#!/usr/bin/env python3
"""
Test DELETE /order/cancel-all by creating 3 orders and canceling all
"""

import requests
import hmac
import hashlib
import base64
import json
import time
import sys
import os

if sys.platform == 'win32':
    os.environ['PYTHONIOENCODING'] = 'utf-8'
    sys.stdout.reconfigure(encoding='utf-8')

class LCXCancelAllTester:
    def __init__(self, api_key, api_secret):
        self.api_key = api_key
        self.api_secret = api_secret
        self.base_url = "https://exchange-api.lcx.com"
        self.order_ids = []

    def create_signature(self, method, endpoint, payload=None):
        """Create HMAC-SHA256 signature"""
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

    def get_headers(self, method, endpoint, payload=None):
        """Get request headers with authentication"""
        signature, timestamp = self.create_signature(method, endpoint, payload)
        return {
            'x-access-key': self.api_key,
            'x-access-sign': signature,
            'x-access-timestamp': timestamp,
            'API-VERSION': '1.1.0',
            'Content-Type': 'application/json'
        }

    def create_order(self, pair, amount, price, side="SELL", retry=3):
        """Create a single order with rate limit retry"""
        endpoint = "/api/create"
        payload = {
            "Pair": pair,
            "Amount": amount,
            "Price": price,
            "OrderType": "LIMIT",
            "Side": side
        }

        for attempt in range(retry):
            headers = self.get_headers("POST", endpoint, payload)

            print(f"\n📝 Creating order: {pair} {amount} @ ${price} {side}")
            if attempt > 0:
                print(f"   (Attempt {attempt + 1}/{retry})")

            response = requests.post(
                self.base_url + endpoint,
                headers=headers,
                json=payload,
                timeout=10
            )

            # Rate limit handling
            if response.status_code == 429:
                print(f"⏱️  Rate limited (429). Waiting 3 seconds...")
                time.sleep(3)
                continue

            if response.status_code in [200, 201]:
                try:
                    data = response.json()
                    if 'data' in data:
                        # Response uses 'Id' field, not 'OrderId'
                        order_id = data['data'].get('Id') or data['data'].get('OrderId')
                        if order_id:
                            self.order_ids.append(order_id)
                            print(f"✅ Order created: {order_id}")
                            return order_id
                except Exception as e:
                    print(f"   Parse error: {e}")
                    pass

            print(f"❌ Failed to create order: {response.status_code}")
            print(f"Response: {response.text[:200]}")

            if attempt < retry - 1:
                print(f"⏱️  Waiting 2 seconds before retry...")
                time.sleep(2)

        return None

    def cancel_all_orders(self):
        """Cancel all orders using DELETE /order/cancel-all"""
        if not self.order_ids:
            print("❌ No orders to cancel")
            return False

        endpoint = "/order/cancel-all"

        # Try with query parameters (repeated orderIds)
        print(f"\n🔄 Canceling {len(self.order_ids)} orders...")
        print(f"Order IDs: {self.order_ids}")

        headers = self.get_headers("DELETE", endpoint)

        # Build query string with multiple orderIds
        params = {}
        for oid in self.order_ids:
            params['orderIds'] = oid  # This will overwrite, let's try differently

        # Try with array-like params
        print("\n📤 Attempting DELETE /order/cancel-all with query params...")

        # Method 1: Multiple query params
        url = self.base_url + endpoint
        for oid in self.order_ids:
            url += f"?orderIds={oid}&" if "?" not in url else f"orderIds={oid}&"
        url = url.rstrip("&")

        print(f"URL: {url}")
        response = requests.delete(url, headers=headers, timeout=10)

        print(f"Status: {response.status_code}")
        print(f"Response: {response.text}")

        if response.status_code == 200:
            print("✅ All orders canceled successfully!")
            return True
        elif response.status_code == 404:
            print("❌ Endpoint /order/cancel-all not found (404)")
            print("   Trying alternative: Cancel individually...")
            return self.cancel_individually()
        else:
            print(f"❌ Error: {response.status_code}")
            return False

    def cancel_individually(self):
        """Fallback: Cancel each order individually"""
        print("\n🔄 Canceling orders individually...")
        success_count = 0

        for oid in self.order_ids:
            endpoint = "/api/cancel"
            payload = {}
            headers = self.get_headers("DELETE", endpoint, payload)

            url = self.base_url + endpoint + f"?orderId={oid}"
            response = requests.delete(url, headers=headers, timeout=10)

            if response.status_code in [200, 400]:  # 400 ok if order not found
                print(f"✅ Order {oid[:8]}... canceled")
                success_count += 1
            else:
                print(f"❌ Failed to cancel {oid[:8]}...")

        print(f"\n✅ {success_count}/{len(self.order_ids)} orders canceled")
        return success_count == len(self.order_ids)

def main():
    import argparse

    parser = argparse.ArgumentParser(description='Test DELETE /order/cancel-all')
    parser.add_argument('--api-key', required=True, help='API Key')
    parser.add_argument('--api-secret', required=True, help='API Secret')

    args = parser.parse_args()

    tester = LCXCancelAllTester(args.api_key, args.api_secret)

    print("="*70)
    print("LCX Exchange API - Test DELETE /order/cancel-all")
    print("="*70)
    print("\nCreating 3 SELL orders for LCX/USDC...\n")

    # Create 3 orders - 20 LCX each at 1, 2, 3 USD (with delays to avoid rate limiting)
    tester.create_order("LCX/USDC", 20, 1.0, "SELL", retry=3)   # $1 USD
    print("⏱️  Waiting 2 seconds...")
    time.sleep(2)

    tester.create_order("LCX/USDC", 20, 2.0, "SELL", retry=3)   # $2 USD
    print("⏱️  Waiting 2 seconds...")
    time.sleep(2)

    tester.create_order("LCX/USDC", 20, 3.0, "SELL", retry=3)   # $3 USD

    if len(tester.order_ids) < 3:
        print(f"\n⚠️  Only {len(tester.order_ids)}/3 orders created")

    # Try to cancel all
    success = tester.cancel_all_orders()

    print("\n" + "="*70)
    print("Test Complete")
    print("="*70)

if __name__ == "__main__":
    main()
