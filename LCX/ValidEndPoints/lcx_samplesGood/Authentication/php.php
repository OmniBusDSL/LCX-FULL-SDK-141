<?php

$baseUrl = 'https://exchange-api.lcx.com';
$endpoint = '/api/create';
$method = 'POST';
$apiKey = 'ADD YOUR LCX EXCHANGE API KEY';
$secretKey = 'ADD YOUR LCX EXCHANGE SECRET KEY';

// Create example payload
$payload = array(
    'OrderType' => 'LIMIT',
    'Pair' => 'LCX/ETH',
    'Side' => 'BUY',
    'Price' => 0.03033486,
    'Amount' => 500,
);

$payloadString = json_encode($payload);

// Create request string
$requestString = $method . $endpoint . $payloadString;

// Sign the request using HMAC-SHA256
$signature = base64_encode(
    hash_hmac('sha256', $requestString, $secretKey, true)
);

// Prepare headers
$headers = array(
    'x-access-key: ' . $apiKey,
    'x-access-sign: ' . $signature,
    'x-access-timestamp: ' . (time() * 1000),
    'Content-Type: application/json',
);

// Create HTTP request using cURL
$url = $baseUrl . $endpoint;
$ch = curl_init($url);

curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
curl_setopt($ch, CURLOPT_POSTFIELDS, $payloadString);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

try {
    $response = curl_exec($ch);
    if ($response === false) {
        echo "cURL Error: " . curl_error($ch) . "\n";
    } else {
        echo "Response: " . $response . "\n";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
} finally {
    curl_close($ch);
}

?>
