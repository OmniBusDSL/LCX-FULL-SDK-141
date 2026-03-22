<?php

$url = 'https://exchange-api.lcx.com/api/orderHistory';
$params = ['pair' => 'ETH/BTC', 'offset' => 1];
$headers = [
    'Content-Type: application/json',
    // Add your authentication headers here
];

$ch = curl_init($url . '?' . http_build_query($params));
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$response = curl_exec($ch);

if (curl_errno($ch)) {
    echo 'Error: ' . curl_error($ch);
}

curl_close($ch);

echo $response;
?>
