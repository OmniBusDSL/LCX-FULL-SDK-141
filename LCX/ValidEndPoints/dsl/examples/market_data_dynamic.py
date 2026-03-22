import requests
import json
import os
from datetime import datetime
import hashlib
import hmac
import base64


def fetch_all_pairs_data(pair):
    """GET /api/ticker"""
    url = 'https://exchange-api.lcx.com/api/ticker'
    headers = {'Content-Type': 'application/json'}
    # Build params dict from function arguments (skip None values)
    query_params = {k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}

    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
    print(json.dumps(response.json(), indent=2))
    return response.json()


def fetch_all_pairs_data():
    """Workflow: FetchAllPairsData"""
    step1_result = fetch_all_pairs()


