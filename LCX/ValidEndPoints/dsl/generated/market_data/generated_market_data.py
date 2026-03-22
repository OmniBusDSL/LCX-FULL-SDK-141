import requests
import json
import os
from datetime import datetime
import hashlib
import hmac
import base64


def fetch_all_tickers():
    """GET /api/tickers"""
    url = 'https://exchange-api.lcx.com/api/tickers'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    print(json.dumps(response.json(), indent=2))
    return response.json()


def get_ticker_for_pair(pair):
    """GET /api/ticker"""
    url = 'https://exchange-api.lcx.com/api/ticker'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def fetch_all_pairs():
    """GET /api/pairs"""
    url = 'https://exchange-api.lcx.com/api/pairs'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    print(json.dumps(response.json(), indent=2))
    return response.json()


def get_pair_info(pair_symbol):
    """GET /api/pair/BTC/USDC"""
    url = 'https://exchange-api.lcx.com/api/pair/BTC/USDC'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_order_book(pair):
    """GET /api/book"""
    url = 'https://exchange-api.lcx.com/api/book'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    print(json.dumps(response.json(), indent=2))
    return response.json()


def get_recent_trades(pair, offset):
    """GET /api/trades"""
    url = 'https://exchange-api.lcx.com/api/trades'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def get_candle_data(pair, resolution, from_ts, to_ts):
    """GET /v1/market/kline"""
    url = 'https://api-kline.lcx.com/v1/market/kline'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    print(json.dumps(response.json(), indent=2))
    return response.json()


def market_overview():
    """GET /api/book"""
    url = 'https://exchange-api.lcx.com/api/book'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()


def get_trades():
    """GET /api/trades"""
    url = 'https://exchange-api.lcx.com/api/trades'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()


# None method not supported for python
