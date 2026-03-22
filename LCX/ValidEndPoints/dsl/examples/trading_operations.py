import requests
import json
import os
from datetime import datetime
import hashlib
import hmac
import base64


def place_limit_buy_order(pair, amount, price, order_type, side):
    """POST /api/create"""
    url = 'https://exchange-api.lcx.com/api/create'
    headers = {'Content-Type': 'application/json'}
    payload = {'Pair': pair, 'Amount': amount, 'Price': price, 'OrderType': order_type, 'Side': side}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'POST' + '/api/create'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.post(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


def place_limit_sell_order(pair, amount, price, order_type, side):
    """POST /api/create"""
    url = 'https://exchange-api.lcx.com/api/create'
    headers = {'Content-Type': 'application/json'}
    payload = {'Pair': pair, 'Amount': amount, 'Price': price, 'OrderType': order_type, 'Side': side}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'POST' + '/api/create'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.post(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


def place_market_order(pair, amount, order_type, side):
    """POST /api/create"""
    url = 'https://exchange-api.lcx.com/api/create'
    headers = {'Content-Type': 'application/json'}
    payload = {'Pair': pair, 'Amount': amount, 'OrderType': order_type, 'Side': side}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'POST' + '/api/create'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.post(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


def modify_order_price(order_id, price):
    """PUT /api/modify"""
    url = 'https://exchange-api.lcx.com/api/modify'
    headers = {'Content-Type': 'application/json'}
    payload = {'OrderId': order_id, 'Price': price}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'PUT' + '/api/modify'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.put(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


def modify_order_amount(order_id, amount):
    """PUT /api/modify"""
    url = 'https://exchange-api.lcx.com/api/modify'
    headers = {'Content-Type': 'application/json'}
    payload = {'OrderId': order_id, 'Amount': amount}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'PUT' + '/api/modify'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.put(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


def modify_order_price_and_amount(order_id, amount, price):
    """PUT /api/modify"""
    url = 'https://exchange-api.lcx.com/api/modify'
    headers = {'Content-Type': 'application/json'}
    payload = {'OrderId': order_id, 'Amount': amount, 'Price': price}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'PUT' + '/api/modify'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.put(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


def cancel_single_order(order_id):
    """DELETE /api/cancel"""
    url = 'https://exchange-api.lcx.com/api/cancel'
    headers = {'Content-Type': 'application/json'}
    payload = {'orderId': order_id}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'DELETE' + '/api/cancel'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.delete(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


def cancel_multiple_orders_example(order_ids):
    """DELETE /order/cancel-all"""
    url = 'https://exchange-api.lcx.com/order/cancel-all'
    headers = {'Content-Type': 'application/json'}
    payload = {'orderIds': order_ids}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'DELETE' + '/order/cancel-all'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.delete(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


def get_all_open_orders(offset):
    """GET /api/open"""
    url = 'https://exchange-api.lcx.com/api/open'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/open'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_open_orders_for_pair(offset, pair):
    """GET /api/open"""
    url = 'https://exchange-api.lcx.com/api/open'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/open'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_open_orders_with_date_range(offset, pair, from_date, to_date):
    """GET /api/open"""
    url = 'https://exchange-api.lcx.com/api/open'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/open'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_single_order_status(order_id):
    """GET /api/order"""
    url = 'https://exchange-api.lcx.com/api/order'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/order'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_complete_order_history(offset):
    """GET /api/orderHistory"""
    url = 'https://exchange-api.lcx.com/api/orderHistory'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/orderHistory'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_order_history_for_pair(offset, pair):
    """GET /api/orderHistory"""
    url = 'https://exchange-api.lcx.com/api/orderHistory'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/orderHistory'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_order_history_by_status(offset, order_status):
    """GET /api/orderHistory"""
    url = 'https://exchange-api.lcx.com/api/orderHistory'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/orderHistory'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_order_history_by_type(offset, order_type):
    """GET /api/orderHistory"""
    url = 'https://exchange-api.lcx.com/api/orderHistory'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/orderHistory'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_filtered_order_history(offset, pair, from_date, to_date, side, order_status, order_type):
    """GET /api/orderHistory"""
    url = 'https://exchange-api.lcx.com/api/orderHistory'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/orderHistory'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_all_trade_history(offset):
    """GET /api/uHistory"""
    url = 'https://exchange-api.lcx.com/api/uHistory'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/uHistory'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_trade_history_for_pair(offset, pair):
    """GET /api/uHistory"""
    url = 'https://exchange-api.lcx.com/api/uHistory'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/uHistory'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_trade_history_by_date_range(offset, pair, from_date, to_date):
    """GET /api/uHistory"""
    url = 'https://exchange-api.lcx.com/api/uHistory'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/uHistory'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def simple_buy_workflow(order_result):
    """GET /api/order"""
    url = 'https://exchange-api.lcx.com/api/order'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/order'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()


def simple_buy_workflow():
    """Workflow: SimpleBuyWorkflow"""
    step1_result = place_order(BTC/USDC, 0.01, 40000, LIMIT, BUY)


def complex_trading_workflow(open_orders_id_0, operation, operation_2):
    """PUT /api/modify"""
    url = 'https://exchange-api.lcx.com/api/modify'
    headers = {'Content-Type': 'application/json'}
    payload = {'open_orders_id_0': open_orders_id_0, '0.015': operation, '39900': operation_2}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'PUT' + '/api/modify'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.put(url, data=payload_str, headers=headers)
    response.raise_for_status()


def complex_trading_workflow():
    """Workflow: ComplexTradingWorkflow"""
    step1_result = get_open(0, BTC/USDC)


def cancel_orders_workflow(first_order_from_list):
    """DELETE /api/cancel"""
    url = 'https://exchange-api.lcx.com/api/cancel'
    headers = {'Content-Type': 'application/json'}
    payload = {'first_order_from_list': first_order_from_list}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'DELETE' + '/api/cancel'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.delete(url, data=payload_str, headers=headers)
    response.raise_for_status()


def cancel_orders_workflow():
    """Workflow: CancelOrdersWorkflow"""
    step1_result = get_open_orders(0)


