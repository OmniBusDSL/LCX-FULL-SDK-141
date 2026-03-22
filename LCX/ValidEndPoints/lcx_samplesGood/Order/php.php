<?php

$url = 'https://exchange-api.lcx.com/api/order';
$params = ['orderId' => 'e8737c4a-3804-461c-9e67-4fe0af5aeb06'];
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
