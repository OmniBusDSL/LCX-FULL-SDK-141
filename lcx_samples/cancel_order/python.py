import requests
import hmac
import hashlib
import base64
import json
import time

BASE_URL = "https://exchange-api.lcx.com"
ENDPOINT = "/api/cancel"
API_KEY = "YOUR_API_KEY"
SECRET_KEY = "YOUR_SECRET_KEY"

def cancel order():
    """Example: Cancel Order"""
    payload = {}

    request_string = "DELETE" + ENDPOINT + json.dumps(payload)

    signature = base64.b64encode(
        hmac.new(SECRET_KEY.encode(), request_string.encode(), hashlib.sha256).digest()
    ).decode()

    headers = {
        'x-access-key': API_KEY,
        'x-access-sign': signature,
        'x-access-timestamp': str(int(time.time() * 1000)),
    }

    response = requests.delete(BASE_URL + ENDPOINT, json=payload, headers=headers)
    print(response.json())

if __name__ == "__main__":
    cancel order()
