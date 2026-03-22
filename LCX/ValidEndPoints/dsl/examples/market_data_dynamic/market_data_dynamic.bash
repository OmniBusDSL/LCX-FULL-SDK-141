#!/bin/bash
set -euo pipefail


function fetch_all_pairs_data() {
    # GET /api/ticker
    local url="https://exchange-api.lcx.com/api/ticker"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

# Workflow: FetchAllPairsData (sequence)

function get_ethusdc_ticker() {
    # GET /api/ticker
    local url="https://exchange-api.lcx.com/api/ticker"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

function get_lcxusdc_ticker() {
    # GET /api/ticker
    local url="https://exchange-api.lcx.com/api/ticker"
    local headers=(-H "Content-Type: application/json")

    curl -s -X GET "$url" "${headers[@]}"
}

