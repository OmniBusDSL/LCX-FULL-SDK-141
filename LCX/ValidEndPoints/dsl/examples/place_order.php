<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);


# POST method not supported for php
function check_order_status(order_id) {
    // GET /api/trading/order/{order_id}
    $url = "https://exchange-api.lcx.com/api/trading/order/{order_id}";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/trading/order/{order_id}";
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
function complete_order_flow(currency) {
    // GET /api/account/balance
    $url = "https://exchange-api.lcx.com/api/account/balance";
    $headers = ["Content-Type: application/json"];
    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "/api/account/balance";
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



# POST method not supported for php
# None method not supported for php
# None method not supported for php
# None method not supported for php
# None method not supported for php
# None method not supported for php
# None method not supported for php
# None method not supported for php
# None method not supported for php
# None method not supported for php
# None method not supported for php
