<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);


# POST method not supported for php
# POST method not supported for php
# POST method not supported for php
# PUT method not supported for php
# PUT method not supported for php
# PUT method not supported for php
# DELETE method not supported for php
# DELETE method not supported for php
function get_all_open_orders(offset) {
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

function get_open_orders_for_pair(offset, pair) {
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

function get_open_orders_with_date_range(offset, pair, fromDate, toDate) {
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

function get_single_order_status(orderId) {
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

function get_complete_order_history(offset) {
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

function get_order_history_for_pair(offset, pair) {
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

function get_order_history_by_status(offset, orderStatus) {
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

function get_order_history_by_type(offset, orderType) {
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

function get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) {
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

function get_all_trade_history(offset) {
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

function get_trade_history_for_pair(offset, pair) {
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

function get_trade_history_by_date_range(offset, pair, fromDate, toDate) {
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

function simple_buy_workflow(order_result) {
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

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for php
# PUT method not supported for php
function get_history(0, BTC/USDC) {
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

function get_trades(0, BTC/USDC) {
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
# DELETE method not supported for php
function confirm_cancelled(first_order_from_list) {
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
