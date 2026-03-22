<?php

$url = "https://exchange-api.lcx.com/api/pair";
$params = ["pair" => "ETH/BTC"];
$headers = ["Content-Type: application/json"];

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
