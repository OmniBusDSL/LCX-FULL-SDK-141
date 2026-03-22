<?php

$url = 'https://exchange-api.lcx.com/api/balances';

$options = [
    'http' => [
        'header' => "Content-Type: application/json\r\n",
        'method' => 'GET',
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
