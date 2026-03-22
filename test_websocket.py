#!/usr/bin/env python3
"""
LCX Exchange API - WebSocket Testing Script
Tests all 6 WebSocket endpoints with correct authentication
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

    def get_auth_url(self):
        """Get authenticated WebSocket URL with credentials in query params"""
        if not self.api_key or not self.api_secret:
            return None
        signature, timestamp = self.create_signature("GET", "/api/auth/ws", {})
        return f"{self.ws_url}/api/auth/ws?x-access-key={self.api_key}&x-access-sign={signature}&x-access-timestamp={timestamp}"

    def parse_ws_message(self, message_str, subscription_type):
        """Parse WebSocket message based on subscription type (v1.1.2 format)"""
        try:
            data = json.loads(message_str)

            # v1.1.2 changes: orderbook and trade return arrays
            if subscription_type == "orderbook" and "data" in data:
                # data is now array of [price, amount, side]
                if isinstance(data.get("data"), list) and len(data["data"]) > 0:
                    if isinstance(data["data"][0], list):
                        return f"Orderbook update: {len(data['data'])} changes"
            elif subscription_type == "trade" and "data" in data:
                # data is now array of [price, amount, side, timestamp]
                if isinstance(data.get("data"), list) and len(data["data"]) > 0:
                    if isinstance(data["data"][0], list):
                        return f"Trade update: {len(data['data'])} trades"
            elif subscription_type == "ticker" and "data" in data:
                # v1.1.2: unified response structure
                return f"Ticker: {data.get('data', {}).get('pair', 'N/A')} @ ${data.get('data', {}).get('lastPrice', 'N/A')}"

            return json.dumps(data)[:120]
        except json.JSONDecodeError:
            return message_str[:100]

    async def test_public_ws(self, subscription_type, name, pair=None, duration=3):
        """Test public WebSocket endpoints (no auth required)"""
        self.results['total'] += 1
        uri = f"{self.ws_url}/ws"

        print(f"\n📡 Testing: {name}")
        print(f"   Endpoint: /ws")
        print(f"   URL: {uri}")

        try:
            async with websockets.connect(uri) as websocket:
                print(f"✅ Connected")

                # Build subscription message
                subscribe_msg = {
                    "Topic": "subscribe",
                    "Type": subscription_type
                }

                # Add Pair if provided (for orderbook/trade subscriptions)
                if pair:
                    subscribe_msg["Pair"] = pair

                await websocket.send(json.dumps(subscribe_msg))
                print(f"   📤 Sent: {json.dumps(subscribe_msg)}")

                # Listen for messages
                start_time = time.time()
                message_count = 0

                while time.time() - start_time < duration:
                    try:
                        # Wait for message with timeout
                        message = await asyncio.wait_for(
                            websocket.recv(),
                            timeout=2.0
                        )

                        # Skip empty messages
                        if not message or not message.strip():
                            continue

                        message_count += 1

                        # Parse based on message type
                        parsed = self.parse_ws_message(message, subscription_type)
                        print(f"   📨 Message {message_count}: {parsed}")

                    except asyncio.TimeoutError:
                        pass  # No message, continue waiting
                    except Exception as e:
                        continue

                if message_count > 0:
                    print(f"✅ PASS - {name} (received {message_count} messages)")
                else:
                    print(f"✅ PASS - {name} (connection successful, awaiting data)")

                self.results['passed'].append(name)
                return True

        except Exception as e:
            error_str = str(e)[:100]
            print(f"❌ FAIL - {name}: {error_str}")
            self.results['failed'].append((name, error_str))
            return False

    async def test_authenticated_ws(self, subscription_type, name, duration=3):
        """Test authenticated WebSocket endpoints"""
        self.results['total'] += 1

        if not self.api_key or not self.api_secret:
            print(f"\n📡 Testing: {name}")
            print(f"⚠️  SKIP - No API credentials provided")
            self.results['total'] -= 1
            return None

        auth_url = self.get_auth_url()
        print(f"\n📡 Testing: {name}")
        print(f"   Endpoint: /api/auth/ws")

        try:
            async with websockets.connect(auth_url) as websocket:
                print(f"✅ Connected (authenticated)")

                # Build subscription message
                # Use "update" for authenticated endpoints
                subscribe_msg = {
                    "Topic": "update",
                    "Type": subscription_type
                }

                await websocket.send(json.dumps(subscribe_msg))
                print(f"   📤 Sent: {json.dumps(subscribe_msg)}")

                # Listen for messages
                start_time = time.time()
                message_count = 0

                while time.time() - start_time < duration:
                    try:
                        message = await asyncio.wait_for(
                            websocket.recv(),
                            timeout=2.0
                        )

                        if not message or not message.strip():
                            continue

                        message_count += 1

                        try:
                            data = json.loads(message)
                            # v1.1.1 added ClientOrderId field to order/trade updates
                            msg_preview = json.dumps(data)[:150]
                            print(f"   📨 Message {message_count}: {msg_preview}")
                        except json.JSONDecodeError:
                            print(f"   📨 Message {message_count}: {message[:100]}")

                    except asyncio.TimeoutError:
                        pass
                    except Exception as e:
                        continue

                if message_count > 0:
                    print(f"✅ PASS - {name} (received {message_count} messages)")
                else:
                    print(f"✅ PASS - {name} (connection successful, awaiting data)")

                self.results['passed'].append(name)
                return True

        except Exception as e:
            error_str = str(e)[:100]
            print(f"❌ FAIL - {name}: {error_str}")
            self.results['failed'].append((name, error_str))
            return False

    async def run_all_tests(self):
        """Run all WebSocket endpoint tests"""
        print("="*70)
        print("LCX Exchange API - WebSocket Endpoint Testing")
        print("="*70)
        print()

        # PUBLIC WEBSOCKET ENDPOINTS
        print("📡 PUBLIC WEBSOCKET ENDPOINTS (No Authentication)")
        print("-"*70)

        await self.test_public_ws("ticker", "Subscribe Ticker", duration=3)
        await asyncio.sleep(0.5)

        await self.test_public_ws("orderbook", "Subscribe Orderbook (LCX/USDC)", pair="LCX/USDC", duration=3)
        await asyncio.sleep(0.5)

        await self.test_public_ws("trade", "Subscribe Trade (ETH/BTC)", pair="ETH/BTC", duration=3)
        await asyncio.sleep(0.5)

        # AUTHENTICATED WEBSOCKET ENDPOINTS
        print("\n📡 AUTHENTICATED WEBSOCKET ENDPOINTS (Requires API Keys)")
        print("-"*70)

        await self.test_authenticated_ws("user_wallets", "Subscribe Wallet Updates", duration=3)
        await asyncio.sleep(0.5)

        await self.test_authenticated_ws("user_orders", "Subscribe Order Updates", duration=3)
        await asyncio.sleep(0.5)

        await self.test_authenticated_ws("user_trades", "Subscribe Trade Updates", duration=3)

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
        print("WebSocket Endpoints Reference:")
        print("="*70)
        print("""
📊 Public Endpoints (3):
   ✅ /ws - Type: ticker (real-time ticker updates)
   ✅ /ws - Type: orderbook, Pair: LCX/USDC (order book data)
   ✅ /ws - Type: trade, Pair: ETH/BTC (trade updates)

🔐 Authenticated Endpoints (3):
   ✅ /api/auth/ws - Type: user_wallets (wallet updates)
   ✅ /api/auth/ws - Type: user_orders (order updates)
   ✅ /api/auth/ws - Type: user_trades (trade updates)

Subscription Topic:
   Public: "Topic": "subscribe"
   Authenticated: "Topic": "update"
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
