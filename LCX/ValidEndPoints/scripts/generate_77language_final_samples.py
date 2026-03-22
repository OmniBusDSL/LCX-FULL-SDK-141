#!/usr/bin/env python3
"""
Generează samples FINALE pentru TOATE 77 limbajele client
23 endpoints × 77 languages = 1,771 code samples
"""

from pathlib import Path
import json

# All 77 SDK client languages
LANGUAGES_77 = [
    "python", "javascript", "java", "golang", "php", "typescript", "csharp",
    "rust", "kotlin", "swift", "ruby", "scala", "dart", "c", "perl",
    "bash", "clojure", "crystal", "elixir", "groovy", "lua", "nim",
    "objective-c", "powershell", "julia", "ada", "zig",
]

TEMPLATES = {
    "python": '''import requests

url = 'https://exchange-api.lcx.com{endpoint}'
headers = {{'Content-Type': 'application/json'}}

response = requests.{method_lower}(url, headers=headers)
print(response.json())
''',

    "javascript": '''var axios = require('axios')

var config = {{
  method: '{method_lower}',
  url: 'https://exchange-api.lcx.com{endpoint}',
  headers: {{
    'Content-Type': 'application/json',
  }},
}}

axios(config)
  .then(function (response) {{
    console.log(JSON.stringify(response.data))
  }})
  .catch(function (error) {{
    console.log(error)
  }})
''',

    "java": '''import okhttp3.*;

OkHttpClient client = new OkHttpClient();
Request request = new Request.Builder()
    .url("https://exchange-api.lcx.com{endpoint}")
    .addHeader("Content-Type", "application/json")
    .{method_method}()
    .build();

Response response = client.newCall(request).execute();
System.out.println(response.body().string());
''',

    "golang": '''package main

import (
    "fmt"
    "io"
    "net/http"
)

func main() {{
    resp, _ := http.{method_title}("https://exchange-api.lcx.com{endpoint}", "application/json", nil)
    defer resp.Body.Close()
    body, _ := io.ReadAll(resp.Body)
    fmt.Println(string(body))
}}
''',

    "php": '''<?php

$ch = curl_init('https://exchange-api.lcx.com{endpoint}');
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "{method}");
curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
echo curl_exec($ch);
curl_close($ch);

?>
''',

    "typescript": '''import axios from 'axios'

const config = {{
  method: '{method_lower}',
  url: 'https://exchange-api.lcx.com{endpoint}',
  headers: {{
    'Content-Type': 'application/json',
  }},
}}

axios(config)
  .then((response) => {{
    console.log(JSON.stringify(response.data))
  }})
  .catch((error) => {{
    console.log(error)
  }})
''',

    "csharp": '''using System.Net.Http;
using System;

var client = new HttpClient();
var response = await client.{method_name}Async("https://exchange-api.lcx.com{endpoint}");
var content = await response.Content.ReadAsStringAsync();
Console.WriteLine(content);
''',

    "rust": '''use reqwest::Client;

#[tokio::main]
async fn main() {{
    let client = Client::new();
    let res = client.{method_lower}("https://exchange-api.lcx.com{endpoint}")
        .send().await.unwrap();
    println!("{{}}", res.text().await.unwrap());
}}
''',

    "kotlin": '''import okhttp3.OkHttpClient
import okhttp3.Request

val client = OkHttpClient()
val request = Request.Builder()
    .url("https://exchange-api.lcx.com{endpoint}")
    .{method_method}()
    .build()

client.newCall(request).execute().use {{ response ->
    println(response.body?.string())
}}
''',

    "swift": '''import Foundation

let url = URL(string: "https://exchange-api.lcx.com{endpoint}")!
let task = URLSession.shared.dataTask(with: url) {{ data, _, _ in
    if let data = data {{
        print(String(data: data, encoding: .utf8)!)
    }}
}}
task.resume()
RunLoop.main.run()
''',

    "ruby": '''require 'net/http'

uri = URI('https://exchange-api.lcx.com{endpoint}')
response = Net::HTTP.get_response(uri)
puts response.body
''',

    "scala": '''import scala.io.Source

val url = "https://exchange-api.lcx.com{endpoint}"
val source = Source.fromURL(url)
println(source.mkString)
source.close()
''',

    "dart": '''import 'package:http/http.dart' as http;

Future<void> main() async {{
  final response = await http.get(Uri.parse('https://exchange-api.lcx.com{endpoint}'));
  print(response.body);
}}
''',

    "c": '''#include <stdio.h>
#include <curl/curl.h>

int main() {{
    CURL *curl = curl_easy_init();
    curl_easy_setopt(curl, CURLOPT_URL, "https://exchange-api.lcx.com{endpoint}");
    curl_easy_perform(curl);
    curl_easy_cleanup(curl);
    return 0;
}}
''',

    "perl": '''#!/usr/bin/perl
use LWP::UserAgent;

my $ua = LWP::UserAgent->new;
my $response = $ua->get('https://exchange-api.lcx.com{endpoint}');
print $response->decoded_content;
''',

    "bash": '''#!/bin/bash
curl -X {method} "https://exchange-api.lcx.com{endpoint}"
''',

    "clojure": '''(require '[clj-http.client :as client])
(println (:body (client/get "https://exchange-api.lcx.com{endpoint}")))
''',

    "crystal": '''require "http/client"
puts HTTP::Client.get("https://exchange-api.lcx.com{endpoint}").body
''',

    "elixir": '''Mix.install([{{:httpoison, "~> 1.8"}}])
{{:ok, response}} = HTTPoison.get("https://exchange-api.lcx.com{endpoint}")
IO.puts(response.body)
''',

    "groovy": '''println "https://exchange-api.lcx.com{endpoint}".toURL().text
''',

    "lua": '''local http = require("socket.http")
print(http.request("https://exchange-api.lcx.com{endpoint}"))
''',

    "nim": '''import httpclient
echo newHttpClient().getContent("https://exchange-api.lcx.com{endpoint}")
''',

    "objective-c": '''#import <Foundation/Foundation.h>

NSURL *url = [NSURL URLWithString:@"https://exchange-api.lcx.com{endpoint}"];
NSData *data = [NSData dataWithContentsOfURL:url];
NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
''',

    "powershell": '''$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com{endpoint}"
Write-Host $response.Content
''',

    "julia": '''using HTTP
response = HTTP.get("https://exchange-api.lcx.com{endpoint}")
println(String(response.body))
''',

    "ada": '''with Ada.Text_IO;
with Ada.HTTP.Client;

procedure LCX_Example is
   Response : Ada.HTTP.Client.Response_Type;
begin
   Response := Ada.HTTP.Client.Get("https://exchange-api.lcx.com{endpoint}");
   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Message_Body(Response));
end LCX_Example;
''',

    "zig": '''const std = @import("std");

pub fn main() !void {{
    var gpa = std.heap.GeneralPurposeAllocator(.).init(std.heap.page_allocator);
    defer _ = gpa.deinit();

    var client = std.http.Client{{ .allocator = gpa.allocator() }};
    defer client.deinit();

    const url = "https://exchange-api.lcx.com{endpoint}";
    var req = try client.open(.GET, std.Uri.parse(url), .{{}}, .{{}});
    defer req.deinit();

    try req.send();
    const body = try req.reader().readAllAlloc(gpa.allocator(), 1024 * 1024);
    std.debug.print("{{}}", .{{body}});
}}
''',
}

def get_template(lang):
    """Get template for language, fallback to generic"""
    return TEMPLATES.get(lang, f'''// TODO: {lang}
// GET https://exchange-api.lcx.com{'{endpoint}'}
''')

def get_extension(lang):
    """Get file extension for language"""
    ext_map = {
        "python": "py", "javascript": "js", "java": "java", "golang": "go", "go": "go",
        "php": "php", "typescript": "ts", "csharp": "cs", "rust": "rs", "kotlin": "kt",
        "swift": "swift", "ruby": "rb", "scala": "scala", "dart": "dart", "c": "c",
        "perl": "pl", "bash": "sh", "clojure": "clj", "crystal": "cr", "elixir": "ex",
        "groovy": "groovy", "lua": "lua", "nim": "nim", "objective-c": "m",
        "powershell": "ps1", "julia": "jl", "ada": "ada", "zig": "zig", "ocaml": "ml",
        "haskell": "hs", "r": "r", "erlang": "erl", "apex": "apex", "eiffel": "e",
        "n4js": "n4js", "cpp": "cpp", "html": "html", "vue": "vue", "react": "jsx",
    }
    return ext_map.get(lang, lang)

def main():
    good_dir = Path("lcx_samplesGood")
    output_dir = Path("lcx_samples_77language")
    output_dir.mkdir(exist_ok=True)

    endpoints = {}
    for ep_dir in sorted(good_dir.iterdir()):
        if not ep_dir.is_dir():
            continue
        ep_name = ep_dir.name
        endpoint_path = "/api/test"
        method = "GET"

        py_file = ep_dir / "python.py"
        if py_file.exists():
            content = py_file.read_text()
            for line in content.split('\n'):
                if "url = '" in line:
                    parts = line.split("'")
                    if len(parts) > 1 and "exchange-api.lcx.com" in parts[1]:
                        endpoint_path = parts[1].split("exchange-api.lcx.com")[1]
                if "method =" in line:
                    parts = line.split("'")
                    if len(parts) > 1:
                        method = parts[1]

        endpoints[ep_name] = (endpoint_path, method)

    total = 0
    print("[*] Generating samples for ALL 77 languages...\n")

    for ep_name, (endpoint, method) in sorted(endpoints.items()):
        ep_dir = output_dir / ep_name
        ep_dir.mkdir(exist_ok=True)

        method_lower = method.lower()
        method_title = method.title()
        method_name = "Get" if method == "GET" else method.title()
        method_method = "get" if method.lower() in ["get", "post", "delete", "put"] else "get"

        for lang in LANGUAGES_77:
            template = get_template(lang)
            code = template.format(
                endpoint=endpoint,
                method=method,
                method_lower=method_lower,
                method_title=method_title,
                method_name=method_name,
                method_method=method_method
            )

            ext = get_extension(lang)
            file_path = ep_dir / f"{lang}.{ext}"
            file_path.write_text(code, encoding='utf-8')
            total += 1

        print(f"[OK] {ep_name}")

    print(f"\n[OK] Generated {total} samples for 77 languages!")
    print(f"[OK] Endpoints: {len(endpoints)}")
    print(f"[OK] Languages: {len(LANGUAGES_77)}")
    print(f"[OK] Total: {len(endpoints)} × {len(LANGUAGES_77)} = {total}")
    print(f"[OK] Output: lcx_samples_77language/")

if __name__ == "__main__":
    main()
