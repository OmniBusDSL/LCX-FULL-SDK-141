import requests
import json
import os
from datetime import datetime
import hashlib
import hmac
import base64


def setup_grid(pair, grid_levels, grid_size):
    """GET /api/pair"""
    url = 'https://exchange-api.lcx.com/api/pair'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def place_grid_orders(pair, grid_levels, order_size):
    """POST /api/orders"""
    url = 'https://exchange-api.lcx.com/api/orders'
    headers = {'Content-Type': 'application/json'}
    payload = {'pair': pair, 'grid_levels': grid_levels, 'order_size': order_size}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'POST' + '/api/orders'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.post(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


# === Orchestration Logic (from body) ===
# Loop: for level in 1..grid_levels:
#   - calculate_price_level(level)
#   - if level % 2 == 0:
#   - place_buy_order(level, order_size)
#   - ... (3 more statements)

def monitor_grid_performance(pair):
    """GET /api/open"""
    url = 'https://exchange-api.lcx.com/api/open'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


# === Orchestration Logic (from body) ===
# Loop: for order in open_orders:
#   - fetch_order_status(order)
#   - if order.status == "filled":
#   - record_trade(order)
#   - ... (2 more statements)

def close_grid_position(pair):
    """DELETE /api/orders"""
    url = 'https://exchange-api.lcx.com/api/orders'
    headers = {'Content-Type': 'application/json'}
    payload = {'pair': pair}
    payload_str = json.dumps(payload, separators=(',', ':'))
    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + 'DELETE' + '/api/orders'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp

    response = requests.delete(url, data=payload_str, headers=headers)
    response.raise_for_status()
    return response.json()


# === Orchestration Logic (from body) ===
# Try-Catch block:
#   - fetch_all_grid_orders(pair)
#   - loop order in grid_orders:
#   - cancel_order(order.id)
#   Catch Exception:

def optimize_grid_parameters(pair):
    """GET /api/pair"""
    url = 'https://exchange-api.lcx.com/api/pair'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


# === Orchestration Logic (from body) ===
# Loop: for grid_size in 5..50:
#   - loop levels in 3..20:
#   - backtest_grid(grid_size, levels)
#   - if profit > max_profit:
#   - ... (1 more statements)

