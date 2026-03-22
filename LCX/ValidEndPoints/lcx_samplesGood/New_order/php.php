<?php

$url = 'https://exchange-api.lcx.com/api/create';
$data = json_encode([
    'Pair' => 'LCX/ETH',
    'Amount' => 100,
    'Price' => 0.004,
    'OrderType' => 'MARKET',
    'Side' => 'SELL',
]);

$options = [
    'http' => [
        'header' => "Content-Type: application/json\r\n",
        'method' => 'POST',
        'content' => $data,
    ],
];

// Add authentication headers here

$context = stream_context_create($options);
$response = file_get_contents($url, false, $context);

if ($response !== false) {
    echo $response;
} else {
    echo 'Error: ' . error_get_last();
}
