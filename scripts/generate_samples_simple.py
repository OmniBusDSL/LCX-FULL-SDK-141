#!/usr/bin/env python3
"""
Generează code samples pentru endpoints LCX în Python, Java, Go, TypeScript, C#, PHP
"""

from pathlib import Path
import json

def gen_python(endpoint, method, name):
    func_name = name.replace("/", "_").replace("-", "_").lower()
    return f'''import requests
import hmac
import hashlib
import base64
import json
import time

BASE_URL = "https://exchange-api.lcx.com"
ENDPOINT = "{endpoint}"
API_KEY = "YOUR_API_KEY"
SECRET_KEY = "YOUR_SECRET_KEY"

def {func_name}():
    """Example: {name}"""
    payload = {{}}

    request_string = "{method}" + ENDPOINT + json.dumps(payload)

    signature = base64.b64encode(
        hmac.new(SECRET_KEY.encode(), request_string.encode(), hashlib.sha256).digest()
    ).decode()

    headers = {{
        'x-access-key': API_KEY,
        'x-access-sign': signature,
        'x-access-timestamp': str(int(time.time() * 1000)),
    }}

    response = requests.{method.lower()}(BASE_URL + ENDPOINT, json=payload, headers=headers)
    print(response.json())

if __name__ == "__main__":
    {func_name}()
'''

def gen_java(endpoint, method, name):
    class_name = "".join(w.title() for w in name.split("_"))
    return f'''import java.util.*;
import java.nio.charset.StandardCharsets;

public class {class_name}Example {{
    static final String ENDPOINT = "{endpoint}";
    static final String METHOD = "{method}";

    public static void main(String[] args) throws Exception {{
        // TODO: Implement LCX API call for {name}
        System.out.println("Example: {name}");
        System.out.println("Endpoint: {endpoint}");
        System.out.println("Method: {method}");
    }}
}}
'''

def gen_go(endpoint, method, name):
    return f'''package main

import (
    "fmt"
    "net/http"
)

func main() {{
    // Example: {name}
    endpoint := "{endpoint}"
    method := "{method}"

    fmt.Println("Endpoint:", endpoint)
    fmt.Println("Method:", method)

    // TODO: Implement HTTP request with HMAC-SHA256 signature
}}
'''

def gen_typescript(endpoint, method, name):
    return f'''// Example: {name}
const ENDPOINT = '{endpoint}';
const METHOD = '{method}';

async function {name.replace("/", "_").replace("-", "_")}() {{
    const apiKey = 'YOUR_API_KEY';
    const secretKey = 'YOUR_SECRET_KEY';

    // TODO: Implement HMAC-SHA256 signature generation
    // TODO: Make HTTP request with proper headers

    console.log('Endpoint:', ENDPOINT);
    console.log('Method:', METHOD);
}}

{name.replace("/", "_").replace("-", "_")}();
'''

def gen_php(endpoint, method, name):
    return f'''<?php
// Example: {name}

define('ENDPOINT', '{endpoint}');
define('METHOD', '{method}');

function {name.replace("/", "_").replace("-", "_")}() {{
    // TODO: Implement LCX API call
    echo "Endpoint: " . ENDPOINT . "\\n";
    echo "Method: " . METHOD . "\\n";
}}

{name.replace("/", "_").replace("-", "_")}();

?>
'''

def gen_csharp(endpoint, method, name):
    class_name = "".join(w.title() for w in name.split("_"))
    return f'''using System;
using System.Net.Http;

public class {class_name} {{
    public static async void Main() {{
        string endpoint = "{endpoint}";
        string method = "{method}";

        // TODO: Implement LCX API call with HMAC-SHA256
        Console.WriteLine("Endpoint: " + endpoint);
        Console.WriteLine("Method: " + method);
    }}
}}
'''

GENERATORS = {
    "python": (gen_python, "py"),
    "java": (gen_java, "java"),
    "go": (gen_go, "go"),
    "typescript": (gen_typescript, "ts"),
    "csharp": (gen_csharp, "cs"),
    "php": (gen_php, "php"),
}

ENDPOINTS = [
    ("/api/tickers", "GET", "Get Tickers"),
    ("/api/pairs", "GET", "Get Pairs"),
    ("/api/book", "GET", "Get OrderBook"),
    ("/api/trades", "GET", "Get Trades"),
    ("/api/create", "POST", "Create Order"),
    ("/api/cancel", "DELETE", "Cancel Order"),
    ("/api/modify", "PUT", "Modify Order"),
    ("/api/open", "GET", "Open Orders"),
    ("/api/order", "GET", "Get Order"),
    ("/api/orderHistory", "GET", "Order History"),
    ("/api/balances", "GET", "Get Balances"),
    ("/api/balance", "GET", "Get Balance"),
]

def main():
    samples_dir = Path("lcx_samples")
    samples_dir.mkdir(exist_ok=True)

    total = 0

    for endpoint, method, name in ENDPOINTS:
        # Create endpoint folder
        clean_name = name.replace(" ", "_").lower()
        endpoint_dir = samples_dir / clean_name
        endpoint_dir.mkdir(exist_ok=True)

        # Generate for each language
        for lang, (gen_func, ext) in GENERATORS.items():
            content = gen_func(endpoint, method, name)
            file_path = endpoint_dir / f"{lang}.{ext}"
            file_path.write_text(content, encoding='utf-8')
            total += 1
            print(f"[OK] {endpoint_dir.name}/{lang}.{ext}")

    print(f"\n[OK] Generated {total} code samples for {len(ENDPOINTS)} endpoints!")

if __name__ == "__main__":
    main()
