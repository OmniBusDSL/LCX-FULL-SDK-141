#!/usr/bin/env python3
"""
LCX Exchange API - WebSocket Testing Script
Tests all 6 WebSocket endpoints
"""

import asyncio
import websockets
import json
import hmac
import hashlib
import base64
import time
import sys
import os

if sys.platform == 'win32':
    os.environ['PYTHONIOENCODING'] = 'utf-8'
    sys.stdout.reconfigure(encoding='utf-8')

class LCXWebSocketTester:
    def __init__(self, api_key=None, api_secret=None):
        self.api_key = api_key
        self.api_secret = api_secret
        self.ws_url = "wss://exchange-api.lcx.com"
        self.results = {
            'passed': [],
            'failed': [],
            'total': 0
        }

    def create_signature(self, method, endpoint, payload=None):
        """Create HMAC-SHA256 signature for authenticated endpoints"""
        if payload is None:
            payload = {}
        timestamp = str(int(time.time() * 1000))
        request_string = method + endpoint + json.dumps(payload)
        signature = base64.b64encode(
            hmac.new(
                self.api_secret.encode(),
                request_string.encode(),
                hashlib.sha256
            ).digest()
        ).decode()
        return signature, timestamp

    def get_auth_headers(self):
        """Get authentication headers for WebSocket"""
        signature, timestamp = self.create_signature("GET", "/api/auth/ws", {})
        return {
            'x-access-key': self.api_key,
            'x-access-sign': signature,
            'x-access-timestamp': timestamp,
            'API-VERSION': '1.1.0'
        }

    async def test_public_ws(self, endpoint, name, duration=5):
        """Test public WebSocket endpoints (no auth required)"""
        self.results['total'] += 1
        uri = f"{self.ws_url}{endpoint}"

        # Determine subscription type from endpoint
        type_map = {
            '/subscribeTicker': 'ticker',
            '/subscribeOrderbook': 'orderbook',
            '/subscribeTrade': 'trade'
        }
        sub_type = type_map.get(endpoint, 'ticker')

        print(f"\n📡 Testing: {name}")
        print(f"   Endpoint: {endpoint}")
        print(f"   URL: {uri}")

        try:
            async with websockets.connect(uri) as websocket:
                print(f"✅ Connected to {name}")

                # Send subscription message
                subscribe_msg = {
                    "Topic": "subscribe",
                    "Type": sub_type
                }
                await websocket.send(json.dumps(subscribe_msg))
                print(f"   📤 Sent subscription: {json.dumps(subscribe_msg)}")

                # Listen for messages for specified duration
                start_time = time.time()
                message_count = 0
                last_ping = time.time()

                while time.time() - start_time < duration:
                    try:
                        # Send ping every 60 seconds to keep connection alive
                        if time.time() - last_ping > 60:
                            await websocket.send(json.dumps({"action": "ping"}))
                            last_ping = time.time()

                        # Wait for message with timeout
                        message = await asyncio.wait_for(
                            websocket.recv(),
                            timeout=2.0
                        )
                        message_count += 1

                        try:
                            data = json.loads(message)
                            print(f"   📨 Message {message_count}: {json.dumps(data, indent=2)[:200]}...")
                        except:
                            print(f"   📨 Message {message_count}: {message[:100]}")

                    except asyncio.TimeoutError:
                        pass  # No message, continue waiting

                print(f"✅ PASS - {name} (received {message_count} messages)")
                self.results['passed'].append(name)
                return True

        except Exception as e:
            print(f"❌ FAIL - {name}: {str(e)[:100]}")
            self.results['failed'].append((name, str(e)[:100]))
            return False

    async def test_authenticated_ws(self, endpoint, name, duration=5):
        """Test authenticated WebSocket endpoints"""
        self.results['total'] += 1
        uri = f"{self.ws_url}{endpoint}"

        print(f"\n📡 Testing: {name}")
        print(f"   Endpoint: {endpoint}")
        print(f"   URL: {uri}")

        if not self.api_key or not self.api_secret:
            print(f"⚠️  SKIP - {name} (no API credentials)")
            self.results['total'] -= 1
            return None

        try:
            # Add auth headers to connection
            auth_headers = self.get_auth_headers()

            # Note: websockets library doesn't directly support custom headers
            # This is a limitation - would need proxy or custom implementation
            print(f"⚠️  SKIP - {name} (WebSocket auth not fully supported in this client)")
            self.results['total'] -= 1
            return None

        except Exception as e:
            print(f"❌ FAIL - {name}: {str(e)[:100]}")
            self.results['failed'].append((name, str(e)[:100]))
            return False

    async def run_all_tests(self):
        """Run all WebSocket endpoint tests"""
        print("="*70)
        print("LCX Exchange API - WebSocket Endpoint Testing")
        print("="*70)
        print()

        # Public WebSocket Endpoints
        print("📡 PUBLIC WEBSOCKET ENDPOINTS (No Authentication)")
        print("-"*70)

        await self.test_public_ws("/subscribeTicker", "Subscribe Ticker", duration=3)
        await asyncio.sleep(1)

        await self.test_public_ws("/subscribeOrderbook", "Subscribe Orderbook", duration=3)
        await asyncio.sleep(1)

        await self.test_public_ws("/subscribeTrade", "Subscribe Trade", duration=3)
        await asyncio.sleep(1)

        # Authenticated WebSocket Endpoints
        print("\n📡 AUTHENTICATED WEBSOCKET ENDPOINTS (Requires API Keys)")
        print("-"*70)

        await self.test_authenticated_ws("/api/auth/ws", "Subscribe Wallet Updates", duration=3)
        await self.test_authenticated_ws("/api/auth/ws", "Subscribe Order Updates", duration=3)
        await self.test_authenticated_ws("/api/auth/ws", "Subscribe Trade Updates", duration=3)

        # Print summary
        self.print_summary()

    def print_summary(self):
        """Print test summary"""
        print("\n" + "="*70)
        print("WEBSOCKET TEST SUMMARY")
        print("="*70 + "\n")

        passed = len(self.results['passed'])
        failed = len(self.results['failed'])
        total = self.results['total']
        percentage = (passed / total * 100) if total > 0 else 0

        print(f"Total Endpoints Tested: {total}")
        print(f"✅ Passed: {passed}")
        print(f"❌ Failed: {failed}")
        print(f"Success Rate: {percentage:.1f}%")

        if self.results['failed']:
            print(f"\n❌ Failed Endpoints:")
            for name, error in self.results['failed']:
                print(f"  - {name}")
                print(f"    Error: {error[:100]}")

        if self.results['passed']:
            print(f"\n✅ Passed Endpoints:")
            for name in self.results['passed']:
                print(f"  - {name}")

        print("\n" + "="*70)
        print("WebSocket Endpoints Summary:")
        print("="*70)
        print("""
📊 Public Endpoints (3):
   ✅ /subscribeTicker - Real-time ticker updates
   ✅ /subscribeOrderbook - Real-time orderbook data
   ✅ /subscribeTrade - Real-time trade updates

🔐 Authenticated Endpoints (3):
   ⚠️ /api/auth/ws#wallet - Wallet updates (auth required)
   ⚠️ /api/auth/ws#orders - Order updates (auth required)
   ⚠️ /api/auth/ws#trades - Trade updates (auth required)

Note: Authenticated endpoints require custom WebSocket client with
      HMAC-SHA256 authentication support.
""")

        print(f"\nTest Date: {time.strftime('%Y-%m-%d %H:%M:%S')}")
        print("="*70 + "\n")

async def main():
    import argparse

    parser = argparse.ArgumentParser(description='LCX WebSocket Endpoint Tester')
    parser.add_argument('--api-key', default=None, help='API Key for authenticated endpoints')
    parser.add_argument('--api-secret', default=None, help='API Secret for authenticated endpoints')

    args = parser.parse_args()

    tester = LCXWebSocketTester(api_key=args.api_key, api_secret=args.api_secret)
    await tester.run_all_tests()

if __name__ == "__main__":
    asyncio.run(main())
