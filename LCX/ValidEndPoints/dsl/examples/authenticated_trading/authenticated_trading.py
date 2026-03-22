import requests
import json
import os
from datetime import datetime
import hashlib
import hmac
import base64


def get_account_info():
    """GET /api/account"""
    url = 'https://exchange-api.lcx.com/api/account'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/account'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_balances():
    """GET /api/balances"""
    url = 'https://exchange-api.lcx.com/api/balances'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/balances'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_asset_balance(asset):
    """GET /api/balance"""
    url = 'https://exchange-api.lcx.com/api/balance'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/balance'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_trading_fees():
    """GET /api/fees"""
    url = 'https://exchange-api.lcx.com/api/fees'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/fees'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_open_orders(offset, pair):
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


def get_order_details(order_id):
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


def get_order_history(offset, pair, from_date, to_date, side, order_status, order_type):
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


def get_user_trade_history(offset, pair, from_date, to_date):
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


def place_order(pair, amount, price, order_type, side, client_order_id):
    """POST /api/create"""
    url = 'https://exchange-api.lcx.com/api/create'
    headers = {'Content-Type': 'application/json'}
    payload = {'Pair': pair, 'Amount': amount, 'Price': price, 'OrderType': order_type, 'Side': side, 'ClientOrderId': client_order_id}
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


def modify_order(order_id, amount, price):
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


def cancel_order(order_id):
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


def cancel_multiple_orders(order_ids):
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


def check_balance_workflow():
    """GET /api/balances"""
    url = 'https://exchange-api.lcx.com/api/balances'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/balances'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()


def check_balance_workflow():
    """Workflow: CheckBalanceWorkflow"""
    step1_result = check_btc_balance(BTC)


def place_order_workflow(btcusdc):
    """GET /api/ticker"""
    url = 'https://exchange-api.lcx.com/api/ticker'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()


def place_order_workflow():
    """Workflow: PlaceOrderWorkflow"""
    step1_result = check_balance(BTC)


def manage_open_orders_workflow(operation):
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


def manage_open_orders_workflow():
    """Workflow: ManageOpenOrdersWorkflow"""
    step1_result = get_open_orders_list(0, BTC/USDC)


def modify_order_workflow(order_id_from_open_orders, operation, operation_2):
    """PUT /api/modify"""
    url = 'https://exchange-api.lcx.com/api/modify'
    headers = {'Content-Type': 'application/json'}
    payload = {'order_id_from_open_orders': order_id_from_open_orders, '0.02': operation, '39900': operation_2}
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


def modify_order_workflow():
    """Workflow: ModifyOrderWorkflow"""
    step1_result = get_orders(0)


def account_monitoring_workflow():
    """GET /api/balances"""
    url = 'https://exchange-api.lcx.com/api/balances'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'GET' + '/api/balances'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()


def account_monitoring_workflow():
    """Workflow: AccountMonitoringWorkflow"""
    step1_result = get_account_info()


