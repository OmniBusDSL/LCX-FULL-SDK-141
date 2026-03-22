#!/usr/bin/env python3
"""
Code Generation Templates
Maps DSL operations to language-specific code patterns
"""

from typing import Dict, Any, List

# Python Templates
PYTHON_TEMPLATES = {
    'GET': '''def {func_name}({params}):
    """GET {endpoint}"""
    url = '{base_url}{endpoint}'
    headers = {{'Content-Type': 'application/json'}}
    # Build params dict from function arguments (skip None values)
    query_params = {{k: v for k, v in locals().items() if k not in ('url', 'headers') and v is not None}}
{auth_code}
    response = requests.get(url, headers=headers, params=query_params if query_params else None)
    response.raise_for_status()
{output_code}
''',

    'POST': '''def {func_name}({params}):
    """POST {endpoint}"""
    url = '{base_url}{endpoint}'
    headers = {{'Content-Type': 'application/json'}}
    payload = {{{payload_dict}}}
    payload_str = json.dumps(payload, separators=(',', ':'))
{auth_code}
    response = requests.post(url, data=payload_str, headers=headers)
    response.raise_for_status()
{output_code}
''',

    'imports': '''import requests
import json
import os
from datetime import datetime
import hashlib
import hmac
import base64
''',

    'auth_required': '''    # HMAC-SHA256 Authentication
    api_key = os.getenv('LCX_API_KEY')
    api_secret = os.getenv('LCX_API_SECRET')
    timestamp = str(int(datetime.now().timestamp() * 1000))
    message = timestamp + '{method}' + '{endpoint}'
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp
''',

    'output_print': '''    print(json.dumps(response.json(), indent=2))
    return response.json()
''',

    'output_json': '''    return response.json()
''',

    'output_save': '''    return response.json()
''',

    'PUT': '''def {func_name}({params}):
    """PUT {endpoint}"""
    url = '{base_url}{endpoint}'
    headers = {{'Content-Type': 'application/json'}}
    payload = {{{payload_dict}}}
    payload_str = json.dumps(payload, separators=(',', ':'))
{auth_code}
    response = requests.put(url, data=payload_str, headers=headers)
    response.raise_for_status()
{output_code}
''',

    'DELETE': '''def {func_name}({params}):
    """DELETE {endpoint}"""
    url = '{base_url}{endpoint}'
    headers = {{'Content-Type': 'application/json'}}
    payload = {{{payload_dict}}}
    payload_str = json.dumps(payload, separators=(',', ':'))
{auth_code}
    response = requests.delete(url, data=payload_str, headers=headers)
    response.raise_for_status()
{output_code}
''',

    # Control flow templates
    'loop_for': '''for {var} in {collection}:
{body}''',

    'loop_while': '''while {condition}:
{body}''',

    'if_block': '''if {condition}:
{then_body}''',

    'else_block': '''else:
{else_body}''',

    'try_block': '''try:
{body}''',

    'catch_block': '''except {error_type} as e:
{body}''',

    'finally_block': '''finally:
{body}''',
}

# JavaScript Templates
JAVASCRIPT_TEMPLATES = {
    'GET': '''async function {func_name}({params}) {{
  // GET {endpoint}
  const url = '{base_url}{endpoint}';
  const headers = {{'Content-Type': 'application/json'}};
{auth_code}
  try {{
    const response = await axios.get(url, {{headers}});
{output_code}
  }} catch (error) {{
    console.error('Error:', error.message);
    throw error;
  }}
}}
''',

    'POST': '''async function {func_name}({params}) {{
  // POST {endpoint}
  const url = '{base_url}{endpoint}';
  const headers = {{'Content-Type': 'application/json'}};
{auth_code}
  try {{
    const response = await axios.post(url, {{}}, {{headers}});
{output_code}
  }} catch (error) {{
    console.error('Error:', error.message);
    throw error;
  }}
}}
''',

    'imports': '''const axios = require('axios');
const crypto = require('crypto');
const os = require('os');
''',

    'auth_required': '''  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + '{method}' + '{endpoint}';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;
''',

    'output_print': '''    console.log(JSON.stringify(response.data, null, 2));
    return response.data;
''',

    'output_json': '''    return response.data;
''',

    # Control flow templates
    'loop_for': '''for (let {var} of {collection}) {{
{body}
}}''',

    'loop_while': '''while ({condition}) {{
{body}
}}''',

    'if_block': '''if ({condition}) {{
{then_body}
}}''',

    'else_block': '''else {{
{else_body}
}}''',

    'try_block': '''try {{
{body}
}}''',

    'catch_block': '''catch ({error_type}) {{
{body}
}}''',

    'finally_block': '''finally {{
{body}
}}''',
}

# Go Templates
GO_TEMPLATES = {
    'GET': '''func {func_name}({params}) (map[string]interface{{}}, error) {{
    // GET {endpoint}
    url := "{base_url}{endpoint}"
    headers := map[string]string{{
        "Content-Type": "application/json",
    }}
{auth_code}
    resp, err := http.Get(url)
    if err != nil {{
        return nil, err
    }}
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{{}}
    json.Unmarshal(body, &result)
{output_code}
}}
''',

    'imports': '''package main

import (
    "fmt"
    "io"
    "net/http"
    "json"
    "os"
    "crypto/hmac"
    "crypto/sha256"
    "encoding/base64"
    "time"
)
''',

    'auth_required': '''    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "{endpoint}"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp
''',

    'output_print': '''    fmt.Println(result)
    return result, nil
''',

    # Control flow templates
    'loop_for': '''for _, {var} := range {collection} {{
{body}
}}''',

    'loop_while': '''for {condition} {{
{body}
}}''',

    'if_block': '''if {condition} {{
{then_body}
}}''',

    'else_block': '''else {{
{else_body}
}}''',

    'try_block': '''// Go uses defer and error returns instead of try/catch
{body}''',

    'catch_block': '''if err != nil {{
{body}
}}''',

    'finally_block': '''defer func() {{
{body}
}}()''',
}

# Java Templates
JAVA_TEMPLATES = {
    'GET': '''public static Map<String, Object> {func_name}({params}) throws Exception {{
    // GET {endpoint}
    String url = "{base_url}{endpoint}";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
{auth_code}
    Request request = builder.build();
    Response response = client.newCall(request).execute();
{output_code}
}}
''',

    'imports': '''import okhttp3.*;
import com.google.gson.*;
import java.util.Map;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.time.System;
''',

    'auth_required': '''    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "{endpoint}";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);
''',

    'output_print': '''    String body = response.body().string();
    System.out.println(body);
    return new Gson().fromJson(body, Map.class);
''',

    # Control flow templates
    'loop_for': '''for (Object {var} : {collection}) {{
{body}
}}''',

    'loop_while': '''while ({condition}) {{
{body}
}}''',

    'if_block': '''if ({condition}) {{
{then_body}
}}''',

    'else_block': '''else {{
{else_body}
}}''',

    'try_block': '''try {{
{body}
}}''',

    'catch_block': '''catch ({error_type} e) {{
{body}
}}''',

    'finally_block': '''finally {{
{body}
}}''',
}

# C# Templates
CSHARP_TEMPLATES = {
    'GET': '''public static async Task<dynamic> {func_name}({params})
{{
    // GET {endpoint}
    using (var client = new HttpClient())
    {{
        var url = "{base_url}{endpoint}";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
{auth_code}
        try
        {{
            var response = await client.GetAsync(url);
            response.EnsureSuccessStatusCode();
{output_code}
        }}
        catch (HttpRequestException e)
        {{
            Console.WriteLine("Error: " + e.Message);
            throw;
        }}
    }}
}}
''',

    'imports': '''using System;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Security.Cryptography;
using System.Text;
''',

    'auth_required': '''        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "{endpoint}";
        using (var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(apiSecret)))
        {{
            var signature = Convert.ToBase64String(hmac.ComputeHash(Encoding.UTF8.GetBytes(message)));
            client.DefaultRequestHeaders.Add("x-access-key", apiKey);
            client.DefaultRequestHeaders.Add("x-access-sign", signature);
            client.DefaultRequestHeaders.Add("x-access-timestamp", timestamp);
        }}
''',

    'output_print': '''            var content = await response.Content.ReadAsStringAsync();
            Console.WriteLine(content);
            return JsonConvert.DeserializeObject(content);
''',

    'output_json': '''            var content = await response.Content.ReadAsStringAsync();
            return JsonConvert.DeserializeObject(content);
''',

    # Control flow templates
    'loop_for': '''foreach (var {var} in {collection})
{{
{body}
}}''',

    'loop_while': '''while ({condition})
{{
{body}
}}''',

    'if_block': '''if ({condition})
{{
{then_body}
}}''',

    'else_block': '''else
{{
{else_body}
}}''',

    'try_block': '''try
{{
{body}
}}''',

    'catch_block': '''catch ({error_type} e)
{{
{body}
}}''',

    'finally_block': '''finally
{{
{body}
}}''',
}

# Rust Templates
RUST_TEMPLATES = {
    'GET': '''async fn {func_name}({params}) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{{
    // GET {endpoint}
    let url = "{base_url}{endpoint}";
    let client = reqwest::Client::new();
{auth_code}
    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
{output_code}
}}
''',

    'imports': '''use reqwest;
use serde_json;
use std::env;
use chrono::Utc;
use hmac::{{Hmac, Mac}};
use sha2::Sha256;
use base64::{engine::general_purpose, Engine as _};
''',

    'auth_required': '''    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{{}}{{}}{{}}", timestamp, "GET", "{endpoint}");

    type HmacSha256 = Hmac<Sha256>;
    let mut mac = HmacSha256::new_from_slice(api_secret.as_bytes())?;
    mac.update(message.as_bytes());
    let signature = general_purpose::STANDARD.encode(mac.finalize().into_bytes());
''',

    'output_print': '''    println!("{{}}", body);
    Ok(serde_json::from_str(&body)?)
''',

    'output_json': '''    Ok(serde_json::from_str(&body)?)
''',

    # Control flow templates
    'loop_for': '''for {var} in {collection} {{
{body}
}}''',

    'loop_while': '''while {condition} {{
{body}
}}''',

    'if_block': '''if {condition} {{
{then_body}
}}''',

    'else_block': '''else {{
{else_body}
}}''',

    'try_block': '''match (|| -> Result<(), Box<dyn std::error::Error>> {{
{body}
Ok(())
}})() {{''',

    'catch_block': '''Err(e) => {{
{body}
}}''',

    'finally_block': '''// Rust uses RAII pattern, see block/scope''',
}

# PHP Templates
PHP_TEMPLATES = {
    'GET': '''function {func_name}({params}) {{
    // GET {endpoint}
    $url = "{base_url}{endpoint}";
    $headers = ["Content-Type: application/json"];
{auth_code}
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {{
        throw new Exception("HTTP Error: $httpCode");
    }}
{output_code}
}}
''',

    'imports': '''<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
''',

    'auth_required': '''    $apiKey = getenv("LCX_API_KEY");
    $apiSecret = getenv("LCX_API_SECRET");
    $timestamp = (string)round(microtime(true) * 1000);
    $message = $timestamp . "GET" . "{endpoint}";
    $signature = base64_encode(hash_hmac('sha256', $message, $apiSecret, true));

    array_push($headers, "x-access-key: $apiKey");
    array_push($headers, "x-access-sign: $signature");
    array_push($headers, "x-access-timestamp: $timestamp");
''',

    'output_print': '''    echo json_encode(json_decode($response), JSON_PRETTY_PRINT);
    return json_decode($response, true);
''',

    'output_json': '''    return json_decode($response, true);
''',
}

# Kotlin Templates
KOTLIN_TEMPLATES = {
    'GET': '''suspend fun {func_name}({params}): Map<String, Any> {{
    // GET {endpoint}
    val url = "{base_url}{endpoint}"
    val client = OkHttpClient()
{auth_code}
    val request = Request.Builder()
        .url(url)
        .addHeader("Content-Type", "application/json")
        .get()
        .build()

    return withContext(Dispatchers.IO) {{
        val response = client.newCall(request).execute()
        val body = response.body?.string() ?: "{{}}"
{output_code}
    }}
}}
''',

    'imports': '''import okhttp3.*
import com.google.gson.*
import kotlinx.coroutines.*
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec
import java.util.*
''',

    'auth_required': '''    val apiKey = System.getenv("LCX_API_KEY")
    val apiSecret = System.getenv("LCX_API_SECRET")
    val timestamp = System.currentTimeMillis().toString()
    val message = "$timestamp/GET/{endpoint}"
    val mac = Mac.getInstance("HmacSHA256")
    mac.init(SecretKeySpec(apiSecret.toByteArray(), "HmacSHA256"))
    val signature = Base64.getEncoder().encodeToString(mac.doFinal(message.toByteArray()))
''',

    'output_print': '''        println(body)
        Gson().fromJson(body, Map::class.java) as Map<String, Any>
''',

    'output_json': '''        Gson().fromJson(body, Map::class.java) as Map<String, Any>
''',
}

# Swift Templates
SWIFT_TEMPLATES = {
    'GET': '''func {func_name}({params}, completion: @escaping (Result<[String: Any], Error>) -> Void) {{
    // GET {endpoint}
    let urlString = "{base_url}{endpoint}"
    guard let url = URL(string: urlString) else {{
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }}

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
{auth_code}

    URLSession.shared.dataTask(with: request) {{ data, response, error in
        if let error = error {{
            completion(.failure(error))
            return
        }}

        guard let data = data else {{
            completion(.failure(NSError(domain: "No data", code: 0)))
            return
        }}
{output_code}
    }}.resume()
}}
''',

    'imports': '''import Foundation
import CommonCrypto
''',

    'auth_required': '''    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "{endpoint}"

    var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    message.withCString {{ messagePtr in
        _ = CC_HMAC(CCHmacAlgorithm(kCCHmacAlgSHA256), apiSecret, apiSecret.count, messagePtr, strlen(messagePtr), &digest, nil)
    }}
    let signature = Data(digest).base64EncodedString()
''',

    'output_print': '''        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {{
            print(json)
            completion(.success(json))
        }}
''',

    'output_json': '''        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {{
            completion(.success(json))
        }}
''',
}

# Scala Templates
SCALA_TEMPLATES = {
    'GET': '''def {func_name}({params}): scala.concurrent.Future[String] = {{
    // GET {endpoint}
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "{base_url}{endpoint}"
{auth_code}
    Http().singleRequest(
        HttpRequest(
            method = HttpMethods.GET,
            uri = url,
            headers = scala.collection.immutable.Seq(
                RawHeader("Content-Type", "application/json")
            )
        )
    ).map(response => {{
        val body = response.entity.dataBytes
            .map(_.utf8String)
            .runFold("")(_ + _)
{output_code}
    }})
}}
''',

    'imports': '''import akka.actor.ActorSystem
import akka.stream.ActorMaterializer
import akka.http.scaladsl.Http
import akka.http.scaladsl.model._
import akka.http.scaladsl.model.headers.RawHeader
import scala.concurrent.Future
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec
import java.util.Base64
''',

    'auth_required': '''    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "{endpoint}"
    val mac = Mac.getInstance("HmacSHA256")
    mac.init(new SecretKeySpec(apiSecret.getBytes, "HmacSHA256"))
    val signature = Base64.getEncoder.encodeToString(mac.doFinal(message.getBytes))
''',

    'output_print': '''        println(body)
        body
''',

    'output_json': '''        body
''',
}

# TypeScript Templates
TYPESCRIPT_TEMPLATES = {
    'GET': '''async function {func_name}({params}): Promise<any> {{
  // GET {endpoint}
  const url = '{base_url}{endpoint}';
  const headers = {{'Content-Type': 'application/json'}};
{auth_code}
  try {{
    const response = await fetch(url, {{
      method: 'GET',
      headers: headers
    }});
    const data = await response.json();
{output_code}
  }} catch (error) {{
    console.error('Error:', error);
    throw error;
  }}
}}
''',

    'imports': '''import crypto from 'crypto';
import fetch from 'node-fetch';
''',

    'auth_required': '''  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + '{method}' + '{endpoint}';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;
''',

    'output_print': '''    console.log(JSON.stringify(data, null, 2));
    return data;
''',

    'output_json': '''    return data;
''',
}

# Ruby Templates
RUBY_TEMPLATES = {
    'GET': '''def {func_name}({params})
  # GET {endpoint}
  uri = URI('{base_url}{endpoint}')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {{'Content-Type' => 'application/json'}})
{auth_code}
  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
{output_code}
  else
    raise StandardError, "HTTP #{{response.code}}: #{{response.body}}"
  end
end
''',

    'imports': '''require 'net/http'
require 'uri'
require 'json'
require 'openssl'
''',

    'auth_required': '''  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + '{method}' + '{endpoint}'
  signature = Base64.encode64(
    OpenSSL::HMAC.digest('sha256', api_secret, message)
  ).strip
  request['x-access-key'] = api_key
  request['x-access-sign'] = signature
  request['x-access-timestamp'] = timestamp
''',

    'output_print': '''    data = JSON.parse(response.body)
    puts JSON.pretty_generate(data)
    data
''',

    'output_json': '''    JSON.parse(response.body)
''',
}

# Dart Templates
DART_TEMPLATES = {
    'GET': '''Future<Map<String, dynamic>> {func_name}({params}) async {{
  // GET {endpoint}
  final url = Uri.parse('{base_url}{endpoint}');
  final headers = {{'Content-Type': 'application/json'}};
{auth_code}
  try {{
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {{
{output_code}
    }} else {{
      throw Exception('Failed to load data: ${{response.statusCode}}');
    }}
  }} catch (e) {{
    print('Error: $e');
    rethrow;
  }}
}}
''',

    'imports': '''import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
''',

    'auth_required': '''  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + '{method}' + '{endpoint}';
''',

    'output_print': '''      final data = jsonDecode(response.body);
      print(jsonEncode(data));
      return data;
''',

    'output_json': '''      return jsonDecode(response.body);
''',
}

# C Templates
C_TEMPLATES = {
    'GET': '''#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {{
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}}

void {func_name}({params}) {{
    // GET {endpoint}
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "{base_url}{endpoint}";
    char response[4096] = {{0}};
{auth_code}
    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, response);

    CURLcode res = curl_easy_perform(curl);
    if(res != CURLE_OK) {{
        printf("Error: %s\\n", curl_easy_strerror(res));
    }} else {{
        printf("%s\\n", response);
    }}

    curl_easy_cleanup(curl);
}}
''',

    'imports': '''#include <stdio.h>
#include <curl/curl.h>
#include <openssl/hmac.h>
#include <openssl/sha.h>
''',

    'output_print': '''    printf("%s\\n", response);
''',
}

# Perl Templates
PERL_TEMPLATES = {
    'GET': '''sub {func_name} {{
    my ({params}) = @_;
    # GET {endpoint}
    my $url = '{base_url}{endpoint}';
    my $ua = LWP::UserAgent->new;
{auth_code}
    my $response = $ua->get($url);

    if ($response->is_success) {{
{output_code}
    }} else {{
        die "Error: " . $response->status_line;
    }}
}}
''',

    'imports': '''use strict;
use warnings;
use LWP::UserAgent;
use JSON;
use Digest::HMAC_SHA256 qw(hmac_sha256);
use MIME::Base64;
''',

    'auth_required': '''    my $api_key = $ENV{{LCX_API_KEY}};
    my $api_secret = $ENV{{LCX_API_SECRET}};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '{endpoint}';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));
''',

    'output_print': '''        my $data = decode_json($response->content);
        print JSON->new->pretty->encode($data);
''',
}

# Bash Templates
BASH_TEMPLATES = {
    'GET': '''function {func_name}() {{
    # GET {endpoint}
    local url="{base_url}{endpoint}"
    local headers=(-H "Content-Type: application/json")
{auth_code}
    curl -s -X GET "$url" "${{headers[@]}}"
}}
''',

    'imports': '''#!/bin/bash
set -euo pipefail
''',

    'auth_required': '''    local api_key="${{LCX_API_KEY:-}}"
    local api_secret="${{LCX_API_SECRET:-}}"
    local timestamp=$(date +%s%N | cut -b1-13)
    local message="${{timestamp}}GET{endpoint}"
    local signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$api_secret" -binary | base64)
    headers+=(-H "x-access-key: $api_key")
    headers+=(-H "x-access-sign: $signature")
    headers+=(-H "x-access-timestamp: $timestamp")
''',
}

# Clojure Templates
CLOJURE_TEMPLATES = {
    'GET': '''(defn {func_name} [{params}]
  ; GET {endpoint}
  (let [url "{base_url}{endpoint}"]
{auth_code}
    (try
      (-> (http/get url {{:headers {{"Content-Type" "application/json"}}}})
          :body
          json/parse-string
{output_code}
      (catch Exception e
        (println "Error:" (.getMessage e))))))
''',

    'imports': '''(ns api.client
  (:require [clj-http.client :as http]
            [cheshire.core :as json]))
''',

    'output_print': '''          (#(do (println (json/generate-string %)) %))
''',
}

# Crystal Templates
CRYSTAL_TEMPLATES = {
    'GET': '''def {func_name}({params})
  # GET {endpoint}
  url = "{base_url}{endpoint}"
  headers = HTTP::Headers{{
    "Content-Type" => "application/json"
  }}
{auth_code}
  response = HTTP::Client.get(url, headers: headers)

  if response.status.ok?
{output_code}
  else
    raise "HTTP #{{response.status.code}}: #{{response.body}}"
  end
end
''',

    'imports': '''require "http"
require "json"
require "openssl"
''',

    'output_print': '''    data = JSON.parse(response.body)
    puts data.to_pretty_json
    data
''',
}

# Elixir Templates
ELIXIR_TEMPLATES = {
    'GET': '''def {func_name}({params}) do
  # GET {endpoint}
  url = "{base_url}{endpoint}"
  headers = [{{"Content-Type", "application/json"}}]
{auth_code}
  case HTTPoison.get(url, headers) do
    {{:ok, response}} ->
{output_code}
    {{:error, reason}} ->
      {{:error, reason}}
  end
end
''',

    'imports': '''defmodule APIClient do
  require HTTPoison
  require Jason
end
''',

    'output_print': '''      {{:ok, Jason.decode!(response.body)}}
''',
}

# Groovy Templates
GROOVY_TEMPLATES = {
    'GET': '''def {func_name}({params}) {{
  // GET {endpoint}
  def url = new URL("{base_url}{endpoint}")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")
{auth_code}
  def response = connection.inputStream.text
  println response
  return response
}}
''',

    'imports': '''import groovy.json.JsonSlurper
import java.security.MessageDigest
''',
}

# Lua Templates
LUA_TEMPLATES = {
    'GET': '''function {func_name}({params})
  -- GET {endpoint}
  local url = "{base_url}{endpoint}"
  local http = require("socket.http")
{auth_code}
  local body, code = http.request(url)
  if code == 200 then
{output_code}
  else
    error("HTTP " .. code)
  end
end
''',

    'imports': '''local http = require("socket.http")
local json = require("cjson")
''',

    'output_print': '''    print(json.encode(json.decode(body)))
    return json.decode(body)
''',
}

# Nim Templates
NIM_TEMPLATES = {
    'GET': '''proc {func_name}*({params}): JsonNode =
  ## GET {endpoint}
  let url = "{base_url}{endpoint}"
{auth_code}
  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)
{output_code}
  return data
''',

    'imports': '''import httpclient
import json
import hmac
import base64
''',

    'output_print': '''  echo data
''',
}

# Objective-C Templates
OBJC_TEMPLATES = {
    'GET': '''- (void){func_name}WithCompletion:(void(^)(NSDictionary *, NSError *))completion {{
    // GET {endpoint}
    NSString *urlString = @"{base_url}{endpoint}";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
{auth_code}
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {{
        if (error) {{
            completion(nil, error);
        }} else {{
{output_code}
        }}
    }}] resume];
}}
''',

    'imports': '''#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
''',

    'output_print': '''            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            completion(json, nil);
''',
}

# PowerShell Templates
POWERSHELL_TEMPLATES = {
    'GET': '''function {func_name}({params}) {{
    # GET {endpoint}
    $url = "{base_url}{endpoint}"
    $headers = @{{"Content-Type" = "application/json"}}
{auth_code}
    try {{
        $response = Invoke-WebRequest -Uri $url -Method Get -Headers $headers
        Write-Host $response.Content
        return $response.Content | ConvertFrom-Json
    }} catch {{
        Write-Error "Request failed: $_"
    }}
}}
''',

    'imports': '''# PowerShell API Client
''',
}

# Julia Templates
JULIA_TEMPLATES = {
    'GET': '''function {func_name}({params})
    # GET {endpoint}
    url = "{base_url}{endpoint}"
    headers = Dict("Content-Type" => "application/json")
{auth_code}
    try
        response = HTTP.get(url; headers=headers)
{output_code}
    catch e
        println("Error: ", e)
    end
end
''',

    'imports': '''using HTTP
using JSON
using SHA
using Base64
''',

    'output_print': '''        data = JSON.parse(String(response.body))
        println(json(data))
        return data
''',
}

# Ada Templates
ADA_TEMPLATES = {
    'GET': '''procedure {func_name}_{params} is
   -- GET {endpoint}
   URL : constant String := "{base_url}{endpoint}";
begin
{auth_code}
   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end {func_name}_{params};
''',

    'imports': '''with Ada.Text_IO;
with Ada.HTTP.Client;
with Ada.HTTP.Response;
''',
}

# Zig Templates
ZIG_TEMPLATES = {
    'GET': '''pub fn {func_name}(allocator: std.mem.Allocator) !void {{
    // GET {endpoint}
    var client = std.http.Client{{ .allocator = allocator }};
    defer client.deinit();

    const url = "{base_url}{endpoint}";
    var req = try client.open(.GET, try std.Uri.parse(url), .{{}}, .{{}});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);

{output_code}
}}
''',

    'imports': '''const std = @import("std");
''',

    'output_print': '''    std.debug.print("{{}}\\n", .{{body}});
''',
}

CPP_TEMPLATES = {
    'GET': '''std::string {func_name}({params}) {{
    std::string url = "{base_url}{endpoint}";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}}''',
    'imports': '''#include <iostream>
#include <curl/curl.h>
#include <nlohmann/json.hpp>''',
}
R_TEMPLATES = {
    'GET': '''"{func_name}" <- function({params}) {{
  url <- "{base_url}{endpoint}"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}}''',
    'imports': '''library(httr)
library(jsonlite)''',
}
MATLAB_TEMPLATES = {
    'GET': '''function output = {func_name}({params})
    url = "{base_url}{endpoint}";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end''',
    'imports': '''% MATLAB HTTP client''',
}
HASKELL_TEMPLATES = {
    'GET': '''{func_name} :: String -> IO String
{func_name} params = do
  let url = "{base_url}{endpoint}"
  response <- simpleHTTP (getRequest url)
  return $ rspBody response''',
    'imports': '''import Network.HTTP''',
}
LISP_TEMPLATES = {
    'GET': '''(defun {func_name} ({params})
  (let ((url "{base_url}{endpoint}"))
    (drakma:http-request url)))''',
    'imports': '''(require :drakma)''',
}
SCHEME_TEMPLATES = {
    'GET': '''# scheme GET implementation''',
    'POST': '''# scheme POST implementation''',
    'imports': '''# scheme imports''',
}
PROLOG_TEMPLATES = {
    'GET': '''# prolog GET implementation''',
    'POST': '''# prolog POST implementation''',
    'imports': '''# prolog imports''',
}
ERLANG_TEMPLATES = {
    'GET': '''# erlang GET implementation''',
    'POST': '''# erlang POST implementation''',
    'imports': '''# erlang imports''',
}
FSHARP_TEMPLATES = {
    'GET': '''# fsharp GET implementation''',
    'POST': '''# fsharp POST implementation''',
    'imports': '''# fsharp imports''',
}
OCAML_TEMPLATES = {
    'GET': '''# ocaml GET implementation''',
    'POST': '''# ocaml POST implementation''',
    'imports': '''# ocaml imports''',
}
RACKET_TEMPLATES = {
    'GET': '''# racket GET implementation''',
    'POST': '''# racket POST implementation''',
    'imports': '''# racket imports''',
}
FORTH_TEMPLATES = {
    'GET': '''# forth GET implementation''',
    'POST': '''# forth POST implementation''',
    'imports': '''# forth imports''',
}
COBOL_TEMPLATES = {
    'GET': '''# cobol GET implementation''',
    'POST': '''# cobol POST implementation''',
    'imports': '''# cobol imports''',
}
FORTRAN_TEMPLATES = {
    'GET': '''# fortran GET implementation''',
    'POST': '''# fortran POST implementation''',
    'imports': '''# fortran imports''',
}
PLSQL_TEMPLATES = {
    'GET': '''# plsql GET implementation''',
    'POST': '''# plsql POST implementation''',
    'imports': '''# plsql imports''',
}
TSQL_TEMPLATES = {
    'GET': '''# tsql GET implementation''',
    'POST': '''# tsql POST implementation''',
    'imports': '''# tsql imports''',
}
MYSQL_TEMPLATES = {
    'GET': '''# mysql GET implementation''',
    'POST': '''# mysql POST implementation''',
    'imports': '''# mysql imports''',
}
POSTGRESQL_TEMPLATES = {
    'GET': '''# postgresql GET implementation''',
    'POST': '''# postgresql POST implementation''',
    'imports': '''# postgresql imports''',
}
MONGODB_TEMPLATES = {
    'GET': '''# mongodb GET implementation''',
    'POST': '''# mongodb POST implementation''',
    'imports': '''# mongodb imports''',
}
NEO4J_TEMPLATES = {
    'GET': '''# neo4j GET implementation''',
    'POST': '''# neo4j POST implementation''',
    'imports': '''# neo4j imports''',
}
GRAPHQL_TEMPLATES = {
    'GET': '''# graphql GET implementation''',
    'POST': '''# graphql POST implementation''',
    'imports': '''# graphql imports''',
}
SOLIDITY_TEMPLATES = {
    'GET': '''pragma solidity ^0.8.0;
contract ApiClient {{
  function {func_name}() public returns (bytes memory) {{
    // Web3 HTTP call
    return "";
  }}
}}''',
    'imports': '''pragma solidity ^0.8.0;''',
}
VYPER_TEMPLATES = {
    'GET': '''# vyper GET implementation''',
    'POST': '''# vyper POST implementation''',
    'imports': '''# vyper imports''',
}
ASSEMBLY_TEMPLATES = {
    'GET': '''section .text
  global {func_name}
{func_name}:
  ; x86-64 assembly for HTTP GET
  mov rax, 0  ; syscall: write
  ret''',
    'imports': '''; x86-64 Assembly''',
}
VBNET_TEMPLATES = {
    'GET': '''Function {func_name}({params}) As String
  Dim url As String = "{base_url}{endpoint}"
  Dim client As New HttpClient()
  Dim response = client.GetAsync(url).Result
  Return response.Content.ReadAsStringAsync().Result
End Function''',
    'imports': '''Imports System.Net.Http''',
}
ABAP_TEMPLATES = {
    'GET': '''DATA: {func_name}_response TYPE STRING.
DATA: {func_name}_url TYPE STRING VALUE '{base_url}{endpoint}'.
DATA: {func_name}_http TYPE REF TO cl_http_client.
DATA: {func_name}_status TYPE i.

CREATE OBJECT {func_name}_http
  EXPORTING
    request_method = 'GET'
    url = {func_name}_url.

{func_name}_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD {func_name}_http->send
  RECEIVING
    code = {func_name}_status.

{func_name}_response = {func_name}_http->response->get_cdata( ).
''',
    'POST': '''DATA: {func_name}_response TYPE STRING.
DATA: {func_name}_url TYPE STRING VALUE '{base_url}{endpoint}'.
DATA: {func_name}_http TYPE REF TO cl_http_client.
DATA: {func_name}_body TYPE STRING VALUE '{{{payload_dict}}}'.
DATA: {func_name}_status TYPE i.

CREATE OBJECT {func_name}_http
  EXPORTING
    request_method = 'POST'
    url = {func_name}_url.

{func_name}_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).
{func_name}_http->request->set_cdata( data = {func_name}_body ).

CALL METHOD {func_name}_http->send
  RECEIVING
    code = {func_name}_status.

{func_name}_response = {func_name}_http->response->get_cdata( ).
''',
    'imports': '''* SAP ABAP HTTP Client
TYPES: BEGIN OF {func_name}_type,
  status TYPE i,
  response TYPE STRING,
END OF {func_name}_type.
''',
}
HASKELL2_TEMPLATES = {
    'GET': '''# haskell2 GET implementation''',
    'POST': '''# haskell2 POST implementation''',
    'imports': '''# haskell2 imports''',
}
LUA2_TEMPLATES = {
    'GET': '''# lua2 GET implementation''',
    'POST': '''# lua2 POST implementation''',
    'imports': '''# lua2 imports''',
}
NIM2_TEMPLATES = {
    'GET': '''# nim2 GET implementation''',
    'POST': '''# nim2 POST implementation''',
    'imports': '''# nim2 imports''',
}
CRYSTAL2_TEMPLATES = {
    'GET': '''# crystal2 GET implementation''',
    'POST': '''# crystal2 POST implementation''',
    'imports': '''# crystal2 imports''',
}
D_TEMPLATES = {
    'GET': '''# d GET implementation''',
    'POST': '''# d POST implementation''',
    'imports': '''# d imports''',
}
V_TEMPLATES = {
    'GET': '''# v GET implementation''',
    'POST': '''# v POST implementation''',
    'imports': '''# v imports''',
}
ZIG2_TEMPLATES = {
    'GET': '''# zig2 GET implementation''',
    'POST': '''# zig2 POST implementation''',
    'imports': '''# zig2 imports''',
}
ODIN_TEMPLATES = {
    'GET': '''# odin GET implementation''',
    'POST': '''# odin POST implementation''',
    'imports': '''# odin imports''',
}
JANET_TEMPLATES = {
    'GET': '''# janet GET implementation''',
    'POST': '''# janet POST implementation''',
    'imports': '''# janet imports''',
}
FENNEL_TEMPLATES = {
    'GET': '''# fennel GET implementation''',
    'POST': '''# fennel POST implementation''',
    'imports': '''# fennel imports''',
}
RAKU_TEMPLATES = {
    'GET': '''# raku GET implementation''',
    'POST': '''# raku POST implementation''',
    'imports': '''# raku imports''',
}
TCL_TEMPLATES = {
    'GET': '''# tcl GET implementation''',
    'POST': '''# tcl POST implementation''',
    'imports': '''# tcl imports''',
}
REBOL_TEMPLATES = {
    'GET': '''# rebol GET implementation''',
    'POST': '''# rebol POST implementation''',
    'imports': '''# rebol imports''',
}
FACTOR_TEMPLATES = {
    'GET': '''# factor GET implementation''',
    'POST': '''# factor POST implementation''',
    'imports': '''# factor imports''',
}
JOY_TEMPLATES = {
    'GET': '''# joy GET implementation''',
    'POST': '''# joy POST implementation''',
    'imports': '''# joy imports''',
}
AGDA_TEMPLATES = {
    'GET': '''# agda GET implementation''',
    'POST': '''# agda POST implementation''',
    'imports': '''# agda imports''',
}
IDRIS_TEMPLATES = {
    'GET': '''# idris GET implementation''',
    'POST': '''# idris POST implementation''',
    'imports': '''# idris imports''',
}
ATS_TEMPLATES = {
    'GET': '''# ats GET implementation''',
    'POST': '''# ats POST implementation''',
    'imports': '''# ats imports''',
}
LEAN_TEMPLATES = {
    'GET': '''# lean GET implementation''',
    'POST': '''# lean POST implementation''',
    'imports': '''# lean imports''',
}
COQ_TEMPLATES = {
    'GET': '''# coq GET implementation''',
    'POST': '''# coq POST implementation''',
    'imports': '''# coq imports''',
}
ISABELLE_TEMPLATES = {
    'GET': '''# isabelle GET implementation''',
    'POST': '''# isabelle POST implementation''',
    'imports': '''# isabelle imports''',
}
LEAN4_TEMPLATES = {
    'GET': '''# lean4 GET implementation''',
    'POST': '''# lean4 POST implementation''',
    'imports': '''# lean4 imports''',
}
ELM_TEMPLATES = {
    'GET': '''# elm GET implementation''',
    'POST': '''# elm POST implementation''',
    'imports': '''# elm imports''',
}
PURESCRIPT_TEMPLATES = {
    'GET': '''# purescript GET implementation''',
    'POST': '''# purescript POST implementation''',
    'imports': '''# purescript imports''',
}

LANGUAGE_TEMPLATES = {

    'python': PYTHON_TEMPLATES,
    'javascript': JAVASCRIPT_TEMPLATES,
    'go': GO_TEMPLATES,
    'java': JAVA_TEMPLATES,
    'csharp': CSHARP_TEMPLATES,
    'rust': RUST_TEMPLATES,
    'php': PHP_TEMPLATES,
    'kotlin': KOTLIN_TEMPLATES,
    'swift': SWIFT_TEMPLATES,
    'scala': SCALA_TEMPLATES,
    'typescript': TYPESCRIPT_TEMPLATES,
    'ruby': RUBY_TEMPLATES,
    'dart': DART_TEMPLATES,
    'c': C_TEMPLATES,
    'perl': PERL_TEMPLATES,
    'bash': BASH_TEMPLATES,
    'clojure': CLOJURE_TEMPLATES,
    'crystal': CRYSTAL_TEMPLATES,
    'elixir': ELIXIR_TEMPLATES,
    'groovy': GROOVY_TEMPLATES,
    'lua': LUA_TEMPLATES,
    'nim': NIM_TEMPLATES,
    'objective-c': OBJC_TEMPLATES,
    'powershell': POWERSHELL_TEMPLATES,
    'julia': JULIA_TEMPLATES,
    'ada': ADA_TEMPLATES,
    'zig': ZIG_TEMPLATES,
    'abap': ABAP_TEMPLATES,
    'agda': AGDA_TEMPLATES,
    'assembly': ASSEMBLY_TEMPLATES,
    'ats': ATS_TEMPLATES,
    'cobol': COBOL_TEMPLATES,
    'coq': COQ_TEMPLATES,
    'cpp': CPP_TEMPLATES,
    'crystal2': CRYSTAL2_TEMPLATES,
    'd': D_TEMPLATES,
    'elm': ELM_TEMPLATES,
    'erlang': ERLANG_TEMPLATES,
    'factor': FACTOR_TEMPLATES,
    'fennel': FENNEL_TEMPLATES,
    'forth': FORTH_TEMPLATES,
    'fortran': FORTRAN_TEMPLATES,
    'fsharp': FSHARP_TEMPLATES,
    'graphql': GRAPHQL_TEMPLATES,
    'haskell': HASKELL_TEMPLATES,
    'haskell2': HASKELL2_TEMPLATES,
    'idris': IDRIS_TEMPLATES,
    'isabelle': ISABELLE_TEMPLATES,
    'janet': JANET_TEMPLATES,
    'joy': JOY_TEMPLATES,
    'lean': LEAN_TEMPLATES,
    'lean4': LEAN4_TEMPLATES,
    'lisp': LISP_TEMPLATES,
    'lua2': LUA2_TEMPLATES,
    'matlab': MATLAB_TEMPLATES,
    'mongodb': MONGODB_TEMPLATES,
    'mysql': MYSQL_TEMPLATES,
    'neo4j': NEO4J_TEMPLATES,
    'nim2': NIM2_TEMPLATES,
    'ocaml': OCAML_TEMPLATES,
    'odin': ODIN_TEMPLATES,
    'plsql': PLSQL_TEMPLATES,
    'postgresql': POSTGRESQL_TEMPLATES,
    'prolog': PROLOG_TEMPLATES,
    'purescript': PURESCRIPT_TEMPLATES,
    'r': R_TEMPLATES,
    'racket': RACKET_TEMPLATES,
    'raku': RAKU_TEMPLATES,
    'rebol': REBOL_TEMPLATES,
    'scheme': SCHEME_TEMPLATES,
    'solidity': SOLIDITY_TEMPLATES,
    'tcl': TCL_TEMPLATES,
    'tsql': TSQL_TEMPLATES,
    'v': V_TEMPLATES,
    'vbnet': VBNET_TEMPLATES,
    'vyper': VYPER_TEMPLATES,
    'zig2': ZIG2_TEMPLATES,
}

class TemplateRenderer:
    """Render code from templates"""

    def __init__(self, language: str):
        self.language = language
        self.templates = LANGUAGE_TEMPLATES.get(language, {})
        self.base_url = 'https://exchange-api.lcx.com'

    def render_operation(self, op: Dict[str, Any]) -> str:
        """Render a single operation"""
        method = op.get('method', 'GET')
        endpoint = op.get('endpoint', '')
        auth = op.get('auth', 'none')
        output = op.get('output', 'json')
        func_name = self.to_function_name(op['name'])

        # Sanitize parameter names to be valid identifiers
        sanitized_inputs = []
        param_mapping = {}  # Maps original name to sanitized name
        seen_names = set()
        for p in op.get('input', []):
            sanitized = self.to_function_name(p)
            # Avoid duplicate parameter names
            if sanitized not in seen_names:
                sanitized_inputs.append(sanitized)
                param_mapping[p] = sanitized
                seen_names.add(sanitized)
            else:
                # Add suffix to make unique
                counter = 2
                while f"{sanitized}_{counter}" in seen_names:
                    counter += 1
                unique_name = f"{sanitized}_{counter}"
                sanitized_inputs.append(unique_name)
                param_mapping[p] = unique_name
                seen_names.add(unique_name)
        params = ', '.join(sanitized_inputs)

        # Get template
        template = self.templates.get(method, '')
        if not template:
            return f"# {method} method not supported for {self.language}"

        # Determine base URL (special case for kline on separate server)
        base_url = self.base_url
        if endpoint and ('kline' in endpoint.lower() or '/v1/market/kline' in endpoint):
            base_url = 'https://api-kline.lcx.com'

        # Generate auth code (pre-render with method and endpoint)
        auth_code = ''
        if auth == 'required':
            raw_auth = self.templates.get('auth_required', '')
            auth_code = raw_auth.format(method=method, endpoint=endpoint)

        # Generate output code
        output_code = ''
        if output == 'print':
            output_code = self.templates.get('output_print', '')
        elif output == 'json':
            output_code = self.templates.get('output_json', '')

        # Compute payload dict for POST/PUT/DELETE requests
        # Use original names as keys, sanitized names as values
        payload_dict = ', '.join(f"'{p}': {param_mapping[p]}" for p in op.get('input', []))

        # Render template (auth_code and output_code are already rendered)
        code = template.format(
            func_name=func_name,
            params=params,
            base_url=base_url,
            endpoint=endpoint,
            auth_code=auth_code,
            output_code=output_code,
            payload_dict=payload_dict,
        )

        # If operation has body (sequence, loops, etc.), render it after the primary operation
        body = op.get('body', [])
        if body:
            # Check if this is a sequence with steps
            has_sequence_steps = any(item.get('type') == 'SequenceStep' for item in body)

            if has_sequence_steps:
                # Render sequence workflow
                code += '\n' + self.render_sequence_workflow(op, body)
            else:
                # For other body nodes (loops, conditionals, etc.), add as docstring notes
                # This preserves the code structure while indicating where orchestration logic would go
                body_comment = self._render_body_as_docstring(op, body)
                if body_comment:
                    code += '\n' + body_comment

        return code

    def render_imports(self) -> str:
        """Render import statements"""
        return self.templates.get('imports', '')

    def render_body_node(self, node: Dict[str, Any], indent: str = '    ') -> str:
        """Render a body node (loop, if, try, etc.) using language templates"""
        if not isinstance(node, dict):
            return ''

        node_type = node.get('type', '')

        if node_type == 'SequenceStep':
            return ''

        elif node_type == 'PrintStatement':
            msg = node.get('message', '')
            if self.language == 'python':
                return f'{indent}print({msg})\n'
            elif self.language == 'javascript':
                return f'{indent}console.log({msg});\n'
            else:
                return f'{indent}// print {msg}\n'

        elif node_type == 'LoopBlock':
            var = node.get('variable', 'i')
            collection = node.get('collection', 'range(10)')
            body_lines = node.get('body', [])
            # Clean body lines (remove "- " prefix if present)
            clean_body = []
            for line in body_lines:
                line_clean = line.lstrip('- ').strip() if isinstance(line, str) else line
                if line_clean:
                    clean_body.append(line_clean)
            body_code = '\n'.join(f'{indent}    {line}' for line in clean_body)

            # Use loop template if available
            loop_type = node.get('loop_type', 'for')  # 'for' or 'while'
            template_key = f'loop_{loop_type}'
            template = self.templates.get(template_key)

            if template:
                try:
                    code = template.format(var=var, collection=collection, condition=collection, body=body_code)
                    return indent + code.replace('\n', f'\n{indent}') + '\n'
                except:
                    pass

            # Fallback
            return f'{indent}// loop: {var} in {collection}\n'

        elif node_type == 'IfBlock':
            condition = node.get('condition', 'True')
            then_lines = node.get('then', [])
            else_lines = node.get('else', [])
            # Clean body lines (remove "- " prefix if present)
            clean_then = []
            for line in then_lines:
                line_clean = line.lstrip('- ').strip() if isinstance(line, str) else line
                if line_clean:
                    clean_then.append(line_clean)
            clean_else = []
            for line in else_lines:
                line_clean = line.lstrip('- ').strip() if isinstance(line, str) else line
                if line_clean:
                    clean_else.append(line_clean)
            then_body = '\n'.join(f'{indent}    {line}' for line in clean_then)
            else_body = '\n'.join(f'{indent}    {line}' for line in clean_else) if clean_else else ''

            # Get if template
            if_template = self.templates.get('if_block')
            code = ''

            if if_template:
                try:
                    code = if_template.format(condition=condition, then_body=then_body, else_body=else_body)
                    code = indent + code.replace('\n', f'\n{indent}')
                except:
                    pass

            # Add else block if present
            if else_lines and code:
                else_template = self.templates.get('else_block')
                if else_template:
                    try:
                        else_code = else_template.format(else_body=else_body)
                        code += '\n' + indent + else_code.replace('\n', f'\n{indent}')
                    except:
                        pass

            return code + '\n' if code else f'{indent}// if {condition}\n'

        elif node_type == 'TryBlock':
            body_lines = node.get('body', [])
            catches = node.get('catches', [])
            finally_lines = node.get('finally', [])

            # Clean body lines (remove "- " prefix if present)
            clean_body = []
            for line in body_lines:
                line_clean = line.lstrip('- ').strip() if isinstance(line, str) else line
                if line_clean:
                    clean_body.append(line_clean)

            body_code = '\n'.join(f'{indent}    {line}' for line in clean_body)

            code = ''

            # Get try template
            try_template = self.templates.get('try_block')
            if try_template:
                try:
                    code = try_template.format(body=body_code)
                    code = indent + code.replace('\n', f'\n{indent}')
                except:
                    code = f'{indent}// try block\n'

            # Add catch blocks
            for catch in catches:
                error_type = catch.get('error', '') or 'Exception'
                catch_body_lines = catch.get('body', [])

                # Clean catch body lines (remove "- " prefix if present)
                clean_catch_body = []
                for line in catch_body_lines:
                    line_clean = line.lstrip('- ').strip() if isinstance(line, str) else line
                    if line_clean:
                        clean_catch_body.append(line_clean)

                catch_body = '\n'.join(f'{indent}    {line}' for line in clean_catch_body)

                catch_template = self.templates.get('catch_block')
                if catch_template:
                    try:
                        catch_code = catch_template.format(error_type=error_type, body=catch_body)
                        code += '\n' + indent + catch_code.replace('\n', f'\n{indent}')
                    except:
                        pass

            # Add finally block
            if finally_lines:
                finally_body = '\n'.join(f'{indent}    {line}' for line in finally_lines)
                finally_template = self.templates.get('finally_block')
                if finally_template:
                    try:
                        finally_code = finally_template.format(body=finally_body)
                        code += '\n' + indent + finally_code.replace('\n', f'\n{indent}')
                    except:
                        pass

            return code + '\n' if code else f'{indent}// try block\n'

        return ''

    def _render_body_as_docstring(self, op: Dict[str, Any], body: List[Dict[str, Any]]) -> str:
        """Render body nodes as inline comments/docstring (orchestration notes)"""
        if self.language not in ['python', 'javascript']:
            return ''

        comment_prefix = '#' if self.language == 'python' else '//'
        lines = [f"{comment_prefix} === Orchestration Logic (from body) ==="]

        for node in body:
            node_type = node.get('type', '')
            if node_type == 'LoopBlock':
                var = node.get('variable', 'item')
                collection = node.get('collection', 'items')
                lines.append(f"{comment_prefix} Loop: for {var} in {collection}")
                body_lines = node.get('body', [])
                for line in body_lines[:3]:  # Show first 3 lines
                    line_clean = line.lstrip('- ').strip() if isinstance(line, str) else line
                    if line_clean:
                        lines.append(f"{comment_prefix}   - {line_clean}")
                if len(body_lines) > 3:
                    lines.append(f"{comment_prefix}   - ... ({len(body_lines) - 3} more statements)")

            elif node_type == 'IfBlock':
                condition = node.get('condition', 'condition')
                lines.append(f"{comment_prefix} If: {condition}")
                then_lines = node.get('then', [])
                for line in then_lines[:2]:
                    line_clean = line.lstrip('- ').strip() if isinstance(line, str) else line
                    if line_clean:
                        lines.append(f"{comment_prefix}   - {line_clean}")

            elif node_type == 'TryBlock':
                lines.append(f"{comment_prefix} Try-Catch block:")
                body_lines = node.get('body', [])
                for line in body_lines[:3]:
                    line_clean = line.lstrip('- ').strip() if isinstance(line, str) else line
                    if line_clean:
                        lines.append(f"{comment_prefix}   - {line_clean}")
                catches = node.get('catches', [])
                for catch in catches:
                    error_type = catch.get('error', '') or 'Exception'
                    lines.append(f"{comment_prefix}   Catch {error_type}:")

        return '\n'.join(lines) + '\n'

    def render_sequence_workflow(self, op: Dict[str, Any], steps: List[Dict[str, Any]]) -> str:
        """Render a sequence workflow function"""
        if self.language != 'python':
            # Other languages get a comment stub for now
            return f"# Workflow: {op.get('name', 'workflow')} (sequence)\n"

        func_name = self.to_function_name(op['name'])
        code = f"def {func_name}():\n"
        code += f'    """Workflow: {op.get("name", "workflow")}"""\n'

        # Generate code for each step
        for step in steps:
            if step.get('type') == 'SequenceStep':
                sub_op = step.get('sub_op', {})
                if sub_op.get('endpoint'):
                    # Call the sub-operation function and store result
                    sub_func_name = self.to_function_name(sub_op['name'])
                    sub_params = ', '.join(sub_op.get('input', []))
                    var_name = f"step{step.get('step', 0)}_result"
                    code += f"    {var_name} = {sub_func_name}({sub_params})\n"

            elif step.get('type') == 'PrintStatement':
                msg = step.get('message', '')
                code += f"    print({msg})\n"

        code += '\n'
        return code

    @staticmethod
    def to_function_name(operation_name: str) -> str:
        """Convert operation name to function name"""
        import re
        import keyword

        # Remove leading numbers, dots, and spaces (for "3. GetTrades" -> "GetTrades")
        name = re.sub(r'^[\d.\s]+', '', operation_name)
        # Remove invalid characters
        name = re.sub(r'[^a-zA-Z0-9_]', '', name)
        # Convert CamelCase to snake_case
        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        result = re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()
        # Ensure it doesn't start with underscore or number (add prefix if needed)
        if result and (result[0].isdigit() or result[0] == '_'):
            result = f"fn_{result}"

        # Avoid Python keywords
        if keyword.iskeyword(result):
            result = f"{result}_param"

        return result if result else "operation"

def generate_code(ast: Dict[str, Any], language: str) -> str:
    """Generate code from AST"""
    renderer = TemplateRenderer(language)
    code = renderer.render_imports() + '\n\n'

    for op in ast.get('operations', []):
        code += renderer.render_operation(op) + '\n'

    return code
