import requests
import json
import os
from datetime import datetime
import hashlib
import hmac
import base64


def place_order(symbol, quantity, price):
    """POST /api/trading/order/create"""
    url = 'https://exchange-api.lcx.com/api/trading/order/create'
    headers = {'Content-Type': 'application/json'}
    payload = {'symbol': symbol, 'quantity': quantity, 'price': price}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'POST' + '/api/trading/order/create'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.post(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


def check_order_status(order_id):
    """GET /api/trading/order/{order_id}"""
    url = 'https://exchange-api.lcx.com/api/trading/order/{order_id}'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/trading/order/{order_id}'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def cancel_order(order_id):
    """POST /api/trading/order/cancel"""
    url = 'https://exchange-api.lcx.com/api/trading/order/cancel'
    headers = {'Content-Type': 'application/json'}
    payload = {'order_id': order_id}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'POST' + '/api/trading/order/cancel'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.post(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


def complete_order_flow(currency):
    """GET /api/account/balance"""
    url = 'https://exchange-api.lcx.com/api/account/balance'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/account/balance'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()




def ifbalanceavailablepricequantity(symbol, quantity, price, order_type):
    """POST /api/trading/order/create"""
    url = 'https://exchange-api.lcx.com/api/trading/order/create'
    headers = {'Content-Type': 'application/json'}
    payload = {'symbol': symbol, 'quantity': quantity, 'price': price, 'order_type': order_type}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'POST' + '/api/trading/order/create'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.post(url, data=payload_str, headers=headers)
    response.raise_for_status()


# None method not supported for python
# None method not supported for python
# None method not supported for python
# None method not supported for python
# None method not supported for python
# None method not supported for python
# None method not supported for python
# None method not supported for python
# None method not supported for python
# None method not supported for python
