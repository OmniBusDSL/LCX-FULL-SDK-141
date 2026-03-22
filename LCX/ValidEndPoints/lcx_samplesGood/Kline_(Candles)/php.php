<?php
$url = "https://api-kline.lcx.com/v1/market/kline";
$params = [
    'pair' => 'ETH/BTC',
    'resolution' => '60',
    'from' => 1608129416,
    'to' => 1608229416,
];

$options = [
    'http' => [
        'header' => "Content-Type: application/json\r\n",
        'method' => 'GET',
        'content' => http_build_query($params),
    ],
];

$context = stream_context_create($options);
$response = file_get_contents($url, false, $context);

echo $response;
?>
