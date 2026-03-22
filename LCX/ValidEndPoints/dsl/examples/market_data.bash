#!/bin/bash
set -euo pipefail


function fetch_all_tickers() {
    # GET /api/tickers
    local url="https://exchange-api.lcx.com/api/tickers"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_ticker_for_pair() {
    # GET /api/ticker
    local url="https://exchange-api.lcx.com/api/ticker"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

function fetch_all_pairs() {
    # GET /api/pairs
    local url="https://exchange-api.lcx.com/api/pairs"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_pair_info() {
    # GET /api/pair/BTC/USDC
    local url="https://exchange-api.lcx.com/api/pair/BTC/USDC"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_order_book() {
    # GET /api/book
    local url="https://exchange-api.lcx.com/api/book"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_recent_trades() {
    # GET /api/trades
    local url="https://exchange-api.lcx.com/api/trades"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_candle_data() {
    # GET /v1/market/kline
    local url="https://api-kline.lcx.com/v1/market/kline"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

function market_overview() {
    # GET /api/book
    local url="https://exchange-api.lcx.com/api/book"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

# Workflow: MarketOverview (sequence)

function get_trades() {
    # GET /api/trades
    local url="https://exchange-api.lcx.com/api/trades"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

# None method not supported for bash
