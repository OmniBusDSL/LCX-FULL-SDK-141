<?php

$url = 'https://exchange-api.lcx.com/api/modify';
$data = json_encode([
    'OrderId' => '9f898d18-0980-4fb3-b18c-eeb39fc20324',
    'Amount' => 100,
    'Price' => 0.004,
]);

$options = [
    'http' => [
        'header' => "Content-Type: application/json\r\n",
        'method' => 'PUT',
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
