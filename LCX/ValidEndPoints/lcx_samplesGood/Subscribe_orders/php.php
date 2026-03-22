<?php

require 'vendor/autoload.php'; // You need to install the Ratchet library

use Ratchet\Client\WebSocket;
use Ratchet\Client\Connector;
use React\EventLoop\Factory;

$loop = Factory::create();
$connector = new Connector($loop);

$url = 'wss://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}';

$connector($url)->then(function (WebSocket $conn) {
    echo "Connected to WebSocket\n";

    $message = json_encode([
        "Topic" => "subscribe",
        "Type" => "user_orders"
    ]);
    $conn->send($message);

    $conn->on('message', function ($message) {
        echo $message . "\n";
    });

    $conn->on('close', function ($code, $reason) {
        echo "Connection closed ({$code}): {$reason}\n";
    });
}, function ($e) {
    echo "Could not connect: {$e->getMessage()}\n";
});

$loop->run();
