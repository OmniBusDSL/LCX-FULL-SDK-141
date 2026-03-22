<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);


function fetch_all_pairs_data(pair) {
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
    echo json_encode(json_decode($response), JSON_PRETTY_PRINT);
    return json_decode($response, true);

}

# Workflow: FetchAllPairsData (sequence)

function get_ethusdc_ticker(pair) {
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
    echo json_encode(json_decode($response), JSON_PRETTY_PRINT);
    return json_decode($response, true);

}

function get_lcxusdc_ticker(pair) {
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
    echo json_encode(json_decode($response), JSON_PRETTY_PRINT);
    return json_decode($response, true);

}

