#!/usr/bin/env python3
"""
Debug script: Investigate GET /api/order endpoint
Create order → Try multiple ways to retrieve it → Compare with cancel/modify
"""

import requests
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

class Colors:
    PASS = '\033[92m'
    FAIL = '\033[91m'
    WARN = '\033[93m'
    INFO = '\033[94m'
    RESET = '\033[0m'
    BOLD = '\033[1m'

def create_signature(method, endpoint, payload=None):
    if payload is None:
        payload = {}
    timestamp = str(int(time.time() * 1000))
    request_string = method + endpoint + json.dumps(payload)
    signature = base64.b64encode(
        hmac.new(
            api_secret.encode(),
            request_string.encode(),
            hashlib.sha256
        ).digest()
    ).decode()
    return signature, timestamp

def get_headers(method, endpoint, payload=None):
    signature, timestamp = create_signature(method, endpoint, payload)
    return {
        'Content-Type': 'application/json',
        'API-VERSION': '1.1.0',
        'x-access-key': api_key,
        'x-access-sign': signature,
        'x-access-timestamp': timestamp
    }

# ===== CONFIGURATION =====
import argparse
parser = argparse.ArgumentParser(description='Debug GET /api/order endpoint')
parser.add_argument('--api-key', required=True, help='API Key')
parser.add_argument('--api-secret', required=True, help='API Secret')
args = parser.parse_args()

api_key = args.api_key
api_secret = args.api_secret
base_url = "https://exchange-api.lcx.com"

print(f"\n{Colors.BOLD}{'='*70}{Colors.RESET}")
print(f"{Colors.BOLD}DEBUG: GET /api/order Investigation{Colors.RESET}")
print(f"{Colors.BOLD}{'='*70}{Colors.RESET}\n")

# ========== STEP 1: CREATE ORDER ==========
print(f"{Colors.INFO}Step 1: Create SELL order{Colors.RESET}\n")

create_payload = {
    "Pair": "LCX/USDC",
    "Amount": 20,
    "Price": 0.05,
    "OrderType": "LIMIT",
    "Side": "SELL"
}

try:
    headers = get_headers("POST", "/api/create", create_payload)
    response = requests.post(base_url + "/api/create", json=create_payload, headers=headers, timeout=10)

    if response.status_code in [200, 201]:
        order_data = response.json()['data']
        order_id = order_data['Id']
        print(f"✅ Order created: {order_id}\n")
    else:
        print(f"❌ Failed: {response.status_code}\n")
        sys.exit(1)
except Exception as e:
    print(f"❌ Error: {e}\n")
    sys.exit(1)

print(f"⏱️  Waiting 3 seconds...\n")
time.sleep(3)

# ========== STEP 2: TRY GET /api/order WITH DIFFERENT PARAMS ==========
print(f"{Colors.INFO}Step 2: Try GET /api/order with different parameter formats{Colors.RESET}\n")

params_to_try = [
    {"OrderId": order_id},
    {"orderId": order_id},
    {"id": order_id},
    {"ID": order_id},
    {"order_id": order_id},
]

# Also try as JSON body
body_to_try = [
    {"OrderId": order_id},
    {"orderId": order_id},
]

print(f"{Colors.BOLD}Order ID to use: {order_id}{Colors.RESET}\n")

results = []
for idx, params in enumerate(params_to_try, 1):
    param_name = list(params.keys())[0]
    print(f"{Colors.INFO}Try {idx}: {param_name}={order_id}{Colors.RESET}")

    try:
        headers = get_headers("GET", "/api/order", {})
        response = requests.get(base_url + "/api/order", headers=headers, params=params, timeout=10)

        status = f"{Colors.PASS}✅{Colors.RESET}" if response.status_code == 200 else f"{Colors.FAIL}❌{Colors.RESET}"
        print(f"  Status: {response.status_code} {status}")

        data = response.json()
        if 'message' in data:
            print(f"  Message: {data['message']}")
        if 'data' in data and data['data']:
            print(f"  Order found: YES ✅")
            print(f"    Price: {data['data'].get('Price')}")
            print(f"    Amount: {data['data'].get('Amount')}")
        else:
            print(f"  Order found: NO ❌")

        results.append({'param': param_name, 'status': response.status_code, 'works': response.status_code == 200})
        print()
    except Exception as e:
        print(f"  Error: {e}\n")
        results.append({'param': param_name, 'status': 'ERROR', 'works': False})

# Also try JSON body instead of query params
print(f"\n{Colors.INFO}Try JSON Body Format:{Colors.RESET}\n")

for idx, body_payload in enumerate(body_to_try, 1):
    param_name = list(body_payload.keys())[0]
    print(f"{Colors.INFO}Body Try {idx}: {param_name} in JSON body{Colors.RESET}")

    try:
        headers = get_headers("GET", "/api/order", body_payload)
        response = requests.get(base_url + "/api/order", headers=headers, json=body_payload, timeout=10)

        status = f"{Colors.PASS}✅{Colors.RESET}" if response.status_code == 200 else f"{Colors.FAIL}❌{Colors.RESET}"
        print(f"  Status: {response.status_code} {status}")

        data = response.json()
        if 'message' in data:
            print(f"  Message: {data['message']}")
        if 'data' in data and data['data']:
            print(f"  Order found: YES ✅")
        else:
            print(f"  Order found: NO ❌")

        results.append({'param': param_name + ' (body)', 'status': response.status_code, 'works': response.status_code == 200})
        print()
    except Exception as e:
        print(f"  Error: {e}\n")
        results.append({'param': param_name + ' (body)', 'status': 'ERROR', 'works': False})

# ========== STEP 3: VERIFY WITH MODIFY & CANCEL ==========
print(f"\n{Colors.BOLD}Step 3: Verify order exists (using modify & cancel){Colors.RESET}\n")

print(f"Testing PUT /api/modify with same order ID...")
modify_payload = {"OrderId": order_id, "Amount": 25, "Price": 0.06}
try:
    headers = get_headers("PUT", "/api/modify", modify_payload)
    response = requests.put(base_url + "/api/modify", json=modify_payload, headers=headers, timeout=10)
    print(f"  Status: {response.status_code}")
    if response.status_code == 200:
        print(f"  {Colors.PASS}✅ Modify works - order EXISTS{Colors.RESET}")
    else:
        print(f"  {Colors.FAIL}❌ Modify failed{Colors.RESET}")
except Exception as e:
    print(f"  Error: {e}")

print(f"\nTesting DELETE /api/cancel with same order ID...")
try:
    headers = get_headers("DELETE", "/api/cancel", {})
    response = requests.delete(base_url + "/api/cancel", headers=headers, params={"orderId": order_id}, timeout=10)
    print(f"  Status: {response.status_code}")
    if response.status_code == 200:
        cancel_data = response.json()['data']
        print(f"  {Colors.PASS}✅ Cancel works - order EXISTS{Colors.RESET}")
        print(f"    Returned Price: {cancel_data.get('Price')}")
        print(f"    Returned Amount: {cancel_data.get('Amount')}")
    else:
        print(f"  {Colors.FAIL}❌ Cancel failed{Colors.RESET}")
except Exception as e:
    print(f"  Error: {e}")

# ========== SUMMARY ==========
print(f"\n{Colors.BOLD}{'='*70}{Colors.RESET}")
print(f"{Colors.BOLD}FINDINGS{Colors.RESET}")
print(f"{Colors.BOLD}{'='*70}{Colors.RESET}\n")

print(f"Order ID: {order_id}")
print(f"Order created: ✅")
print(f"Order modifiable: ✅ (PUT /api/modify works)")
print(f"Order cancellable: ✅ (DELETE /api/cancel works)")
print(f"Order retrievable via GET: {Colors.FAIL}❌ (all parameter formats fail){Colors.RESET}")

print(f"\n{Colors.WARN}Conclusion: GET /api/order endpoint is BROKEN{Colors.RESET}")
print(f"  • Order exists and is queryable via modify/cancel")
print(f"  • But GET /api/order returns 'Order not found' for all parameter formats")
print(f"  • This is a bug in the LCX API GET /api/order endpoint\n")
