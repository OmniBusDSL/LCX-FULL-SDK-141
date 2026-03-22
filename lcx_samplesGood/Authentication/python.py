import requests
import hmac
import hashlib
import base64
import json
import time

base_url = 'https://exchange-api.lcx.com'
end_point = '/api/create'
method = 'POST'
api_key = 'ADD YOUR LCX EXCHANGE API KEY'
secret_key = 'ADD YOUR LCX EXCHANGE SECRET KEY'

example_payload = {
    'OrderType': 'LIMIT',
    'Pair': 'LCX/ETH',
    'Side': 'BUY',
    'Price': 0.03033486,
    'Amount': 500,
}

# Create request string
request_string = method + end_point + json.dumps(example_payload)

# Sign the request
signature = base64.b64encode(
    hmac.new(
        secret_key.encode(),
        request_string.encode(),
        hashlib.sha256
    ).digest()
).decode()

# Prepare headers
headers = {
    'x-access-key': api_key,
    'x-access-sign': signature,
    'x-access-timestamp': str(int(time.time() * 1000)),
}

# Make the request
url = base_url + end_point
try:
    response = requests.post(url, json=example_payload, headers=headers)
    print(response.json())
except Exception as e:
    print(f"Error: {e}")
