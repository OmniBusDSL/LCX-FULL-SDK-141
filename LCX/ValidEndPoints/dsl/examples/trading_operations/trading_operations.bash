#!/bin/bash
set -euo pipefail


# POST method not supported for bash
# POST method not supported for bash
# POST method not supported for bash
# PUT method not supported for bash
# PUT method not supported for bash
# PUT method not supported for bash
# DELETE method not supported for bash
# DELETE method not supported for bash
function get_all_open_orders() {
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

function get_open_orders_for_pair() {
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

function get_open_orders_with_date_range() {
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

function get_single_order_status() {
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

function get_complete_order_history() {
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

function get_order_history_for_pair() {
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

function get_order_history_by_status() {
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

function get_order_history_by_type() {
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

function get_filtered_order_history() {
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

function get_all_trade_history() {
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

function get_trade_history_for_pair() {
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

function get_trade_history_by_date_range() {
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

function simple_buy_workflow() {
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

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for bash
# PUT method not supported for bash
function get_history() {
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

function get_trades() {
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
# DELETE method not supported for bash
function confirm_cancelled() {
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
