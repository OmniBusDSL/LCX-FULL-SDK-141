import requests
import json
import os
from datetime import datetime
import hashlib
import hmac
import base64


def fetch_candle_data(pair, resolution, from_param, to):
    """GET /v1/market/kline"""
    url = 'https://api-kline.lcx.com/v1/market/kline'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def calculate_moving_averages(pair, resolution):
    """GET /v1/market/kline"""
    url = 'https://api-kline.lcx.com/v1/market/kline'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def calculate_rsi(pair, resolution):
    """GET /v1/market/kline"""
    url = 'https://api-kline.lcx.com/v1/market/kline'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def identify_trend_with_bollinger_bands(pair, resolution):
    """GET /v1/market/kline"""
    url = 'https://api-kline.lcx.com/v1/market/kline'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def generate_trade_signals(pair, resolution):
    """GET /v1/market/kline"""
    url = 'https://api-kline.lcx.com/v1/market/kline'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


def backtest_strategy(pair, resolution, start_date, end_date):
    """GET /v1/market/kline"""
    url = 'https://api-kline.lcx.com/v1/market/kline'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    return response.json()


