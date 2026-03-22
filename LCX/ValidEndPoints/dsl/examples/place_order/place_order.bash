#!/bin/bash
set -euo pipefail


# POST method not supported for bash
function check_order_status() {
    # GET /api/trading/order/{order_id}
    local url="https://exchange-api.lcx.com/api/trading/order/{order_id}"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/trading/order/{order_id}"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

# POST method not supported for bash
function complete_order_flow() {
    # GET /api/account/balance
    local url="https://exchange-api.lcx.com/api/account/balance"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/account/balance"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}



# POST method not supported for bash
# None method not supported for bash
# None method not supported for bash
# None method not supported for bash
# None method not supported for bash
# None method not supported for bash
# None method not supported for bash
# None method not supported for bash
# None method not supported for bash
# None method not supported for bash
# None method not supported for bash
