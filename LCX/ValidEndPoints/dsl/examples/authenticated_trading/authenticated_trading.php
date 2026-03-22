<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);


function get_account_info() {
    // GET /api/account
    $url = "https://exchange-api.lcx.com/api/account";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/account";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }
    return json_decode($response, true);

}

function get_balances() {
    // GET /api/balances
    $url = "https://exchange-api.lcx.com/api/balances";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/balances";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }
    return json_decode($response, true);

}

function get_asset_balance(asset) {
    // GET /api/balance
    $url = "https://exchange-api.lcx.com/api/balance";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/balance";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }
    return json_decode($response, true);

}

function get_trading_fees() {
    // GET /api/fees
    $url = "https://exchange-api.lcx.com/api/fees";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/fees";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }
    return json_decode($response, true);

}

function get_open_orders(offset, pair) {
    // GET /api/open
    $url = "https://exchange-api.lcx.com/api/open";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/open";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }
    return json_decode($response, true);

}

function get_order_details(orderId) {
    // GET /api/order
    $url = "https://exchange-api.lcx.com/api/order";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/order";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }
    return json_decode($response, true);

}

function get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) {
    // GET /api/orderHistory
    $url = "https://exchange-api.lcx.com/api/orderHistory";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/orderHistory";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }
    return json_decode($response, true);

}

function get_user_trade_history(offset, pair, fromDate, toDate) {
    // GET /api/uHistory
    $url = "https://exchange-api.lcx.com/api/uHistory";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/uHistory";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }
    return json_decode($response, true);

}

# POST method not supported for php
# PUT method not supported for php
# DELETE method not supported for php
# DELETE method not supported for php
function check_balance_workflow() {
    // GET /api/balances
    $url = "https://exchange-api.lcx.com/api/balances";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/balances";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }

}

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for php
function place_order_workflow(BTC/USDC) {
    // GET /api/ticker
    $url = "https://exchange-api.lcx.com/api/ticker";
    $headers = ["Content-Type: application/json"];

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }

}

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for php
function get_order_info(order_response) {
    // GET /api/order
    $url = "https://exchange-api.lcx.com/api/order";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/order";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }

}

# None method not supported for php
function manage_open_orders_workflow(0) {
    // GET /api/orderHistory
    $url = "https://exchange-api.lcx.com/api/orderHistory";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/orderHistory";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }

}

# Workflow: ManageOpenOrdersWorkflow (sequence)

function get_trade_history(0) {
    // GET /api/uHistory
    $url = "https://exchange-api.lcx.com/api/uHistory";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/uHistory";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }

}

# None method not supported for php
# PUT method not supported for php
# DELETE method not supported for php
# None method not supported for php
function account_monitoring_workflow() {
    // GET /api/balances
    $url = "https://exchange-api.lcx.com/api/balances";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/balances";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }

}

# Workflow: AccountMonitoringWorkflow (sequence)

function get_open_orders(0) {
    // GET /api/open
    $url = "https://exchange-api.lcx.com/api/open";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/open";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }

}

function get_fees() {
    // GET /api/fees
    $url = "https://exchange-api.lcx.com/api/fees";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/fees";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        throw new Exception("HTTP Error: $httpCode");
    }

}

# None method not supported for php
