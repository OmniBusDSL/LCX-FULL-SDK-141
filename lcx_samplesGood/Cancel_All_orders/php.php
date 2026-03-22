<?php

$url = 'https://exchange-api.lcx.com/order/cancel-all';
// Add your auth headers here
$headers = [];

$params = [
    'orderIds' => [
        '70aba300-0990-481d-ad76-7bd499f473ab',
        'ecaf000a-8f4c-459a-b105-784c0e0436df',
    ],
];

$options = [
    'http' => [
        'method' => 'DELETE',
        'header' => implode("\r\n", $headers),
    ],
];

$queryString = http_build_query($params);
$fullUrl = $url . '?' . $queryString;

$response = file_get_contents($fullUrl, false, stream_context_create($options));

// Handle the response as needed
echo $response;
