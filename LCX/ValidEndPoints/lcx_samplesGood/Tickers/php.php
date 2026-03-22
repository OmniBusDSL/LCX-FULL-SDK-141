<?php

$url = 'https://exchange-api.lcx.com/api/tickers';

$options = [
    'http' => [
        'header' => "Content-Type: application/json\r\n",
        'method' => 'GET',
    ],
];

$context = stream_context_create($options);
$response = file_get_contents($url, false, $context);

if ($response !== false) {
    echo $response;
} else {
    echo 'Error: ' . error_get_last();
}
