#!/bin/bash
set -euo pipefail


function get_account_info() {
    # GET /api/account
    local url="https://exchange-api.lcx.com/api/account"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/account"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_balances() {
    # GET /api/balances
    local url="https://exchange-api.lcx.com/api/balances"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/balances"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_asset_balance() {
    # GET /api/balance
    local url="https://exchange-api.lcx.com/api/balance"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/balance"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_trading_fees() {
    # GET /api/fees
    local url="https://exchange-api.lcx.com/api/fees"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/fees"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_open_orders() {
    # GET /api/open
    local url="https://exchange-api.lcx.com/api/open"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/open"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_order_details() {
    # GET /api/order
    local url="https://exchange-api.lcx.com/api/order"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/order"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_order_history() {
    # GET /api/orderHistory
    local url="https://exchange-api.lcx.com/api/orderHistory"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/orderHistory"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_user_trade_history() {
    # GET /api/uHistory
    local url="https://exchange-api.lcx.com/api/uHistory"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/uHistory"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

# POST method not supported for bash
# PUT method not supported for bash
# DELETE method not supported for bash
# DELETE method not supported for bash
function check_balance_workflow() {
    # GET /api/balances
    local url="https://exchange-api.lcx.com/api/balances"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/balances"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for bash
function place_order_workflow() {
    # GET /api/ticker
    local url="https://exchange-api.lcx.com/api/ticker"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for bash
function get_order_info() {
    # GET /api/order
    local url="https://exchange-api.lcx.com/api/order"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/order"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

# None method not supported for bash
function manage_open_orders_workflow() {
    # GET /api/orderHistory
    local url="https://exchange-api.lcx.com/api/orderHistory"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/orderHistory"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

# Workflow: ManageOpenOrdersWorkflow (sequence)

function get_trade_history() {
    # GET /api/uHistory
    local url="https://exchange-api.lcx.com/api/uHistory"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/uHistory"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

# None method not supported for bash
# PUT method not supported for bash
# DELETE method not supported for bash
# None method not supported for bash
function account_monitoring_workflow() {
    # GET /api/balances
    local url="https://exchange-api.lcx.com/api/balances"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/balances"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

# Workflow: AccountMonitoringWorkflow (sequence)

function get_open_orders() {
    # GET /api/open
    local url="https://exchange-api.lcx.com/api/open"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/open"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_fees() {
    # GET /api/fees
    local url="https://exchange-api.lcx.com/api/fees"
    local headers=(-H "Content-Type: application/json")
    local api_key="${LCX_API_KEY:-}"
    local api_secret="${LCX_API_SECRET:-}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${timestamp}GET/api/fees"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")

    curl -s -X GET "$url" "${headers[@]}"
}

# None method not supported for bash
