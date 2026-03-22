#!/usr/bin/env python3
"""
Crează quality samples cu 25 limbaje PRACTICE care au HTTP clients reali
Exclude limbajele care nu pot face apeluri HTTP ușor
"""

from pathlib import Path

# 27 practical languages with real HTTP capabilities
LANGUAGES = [
    "python", "javascript", "java", "golang", "php", "typescript", "csharp",
    "rust", "kotlin", "swift", "ruby", "scala", "dart", "c", "perl",
    "bash", "clojure", "crystal", "elixir", "groovy", "lua", "nim",
    "objective-c", "powershell", "julia", "ada", "zig"
]

TEMPLATES = {
    "python": '''import requests
url = 'https://exchange-api.lcx.com{endpoint}'
response = requests.{method_lower}(url, headers={{'Content-Type': 'application/json'}})
print(response.json())
''',

    "javascript": '''const axios = require('axios');
axios.{{method_lower}}('https://exchange-api.lcx.com{endpoint}')
  .then(r => console.log(r.data))
  .catch(e => console.error(e.message));
''',

    "java": '''import java.net.http.*;
var request = HttpRequest.newBuilder()
    .uri(java.net.URI.create("https://exchange-api.lcx.com{endpoint}"))
    .{method_upper}().build();
var response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
System.out.println(response.body());
''',

    "golang": '''package main
import ("fmt"; "net/http"; "io")
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
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
echo curl_exec($ch);
?>
''',

    "typescript": '''import axios from 'axios';
axios.{{method_lower}}('https://exchange-api.lcx.com{endpoint}')
  .then(r => console.log(r.data))
  .catch(e => console.error(e.message));
''',

    "csharp": '''using System.Net.Http;
var client = new HttpClient();
var response = await client.{method_title}Async("https://exchange-api.lcx.com{endpoint}");
var content = await response.Content.ReadAsStringAsync();
System.Console.WriteLine(content);
''',

    "rust": '''use reqwest::Client;
#[tokio::main]
async fn main() {{
    let body = Client::new().{method_lower}("https://exchange-api.lcx.com{endpoint}")
        .send().await.unwrap().text().await.unwrap();
    println!("{{}}", body);
}}
''',

    "kotlin": '''import okhttp3.OkHttpClient
import okhttp3.Request
fun main() {{
    val req = Request.Builder().url("https://exchange-api.lcx.com{endpoint}").build()
    val res = OkHttpClient().newCall(req).execute()
    println(res.body?.string())
}}
''',

    "swift": '''import Foundation
let url = URL(string: "https://exchange-api.lcx.com{endpoint}")!
URLSession.shared.dataTask(with: url) {{ d, _, _ in
    print(String(data: d ?? Data(), encoding: .utf8)!)
}}.resume()
RunLoop.main.run()
''',

    "ruby": '''require 'net/http'
response = Net::HTTP.get_response(URI('https://exchange-api.lcx.com{endpoint}'))
puts response.body
''',

    "scala": '''import scala.io.Source
val src = Source.fromURL("https://exchange-api.lcx.com{endpoint}")
println(src.mkString)
src.close()
''',

    "dart": '''import 'package:http/http.dart' as http;
void main() async {{
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
print $ua->get('https://exchange-api.lcx.com{endpoint}')->decoded_content;
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
with Ada.Strings.Unbounded;

procedure LCX_API is
   use Ada.Strings.Unbounded;
   Response : Ada.HTTP.Client.Response_Type;
   URL : constant String := "https://exchange-api.lcx.com{endpoint}";
begin
   Response := Ada.HTTP.Client.Get(URL);
   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Message_Body(Response));
end LCX_API;
''',

    "zig": '''const std = @import("std");
const http = std.http;

pub fn main() !void {{
    var gpa = std.heap.GeneralPurposeAllocator(.).init(std.heap.page_allocator);
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var client = http.Client{{ .allocator = allocator }};
    defer client.deinit();

    const url = "https://exchange-api.lcx.com{endpoint}";
    var req = try client.open(.GET, std.Uri.parse(url), .{{}}, .{{}});
    defer req.deinit();

    try req.send();
    const body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    std.debug.print("{{}}", .{{body}});
}}
''',
}

def main():
    good_dir = Path("lcx_samplesGood")
    if not good_dir.exists():
        print("[FAIL] lcx_samplesGood not found")
        return

    output_dir = Path("lcx_samples_practical")
    output_dir.mkdir(exist_ok=True)

    total = 0

    print("[*] Generating practical quality samples (25 languages)...\n")

    # For each endpoint in lcx_samplesGood
    for endpoint_dir in sorted(good_dir.iterdir()):
        if not endpoint_dir.is_dir():
            continue

        ep_name = endpoint_dir.name
        endpoint_path = f"/api/{ep_name.lower()}"
        endpoint_method = "GET"

        # Try to extract real endpoint path
        for code_file in endpoint_dir.iterdir():
            if code_file.name == "python.py":
                content = code_file.read_text()
                for line in content.split('\n'):
                    if "ENDPOINT = " in line:
                        parts = line.split("'")
                        if len(parts) > 1:
                            endpoint_path = parts[1]
                            # Make sure it's just the path, not full URL
                            if "https://" in endpoint_path:
                                endpoint_path = endpoint_path.split("com")[1]
                    if "METHOD = " in line:
                        parts = line.split("'")
                        if len(parts) > 1:
                            endpoint_method = parts[1]
                break

        ep_output_dir = output_dir / ep_name
        ep_output_dir.mkdir(exist_ok=True)

        # Generate for 25 practical languages
        for lang in LANGUAGES:
            if lang not in TEMPLATES:
                continue

            template = TEMPLATES[lang]
            method_lower = endpoint_method.lower()
            method_upper = endpoint_method.replace("GET", "get").replace("POST", "post").replace("DELETE", "delete").replace("PUT", "put")
            method_title = endpoint_method.title()

            code = template.format(
                endpoint=endpoint_path,
                method=endpoint_method,
                method_lower=method_lower,
                method_upper=method_upper,
                method_title=method_title
            )

            ext_map = {
                "python": "py", "javascript": "js", "java": "java",
                "golang": "go", "php": "php", "typescript": "ts",
                "csharp": "cs", "rust": "rs", "kotlin": "kt", "swift": "swift",
                "ruby": "rb", "scala": "scala", "dart": "dart", "bash": "sh",
                "perl": "pl", "lua": "lua", "c": "c",
                "clojure": "clj", "crystal": "cr", "elixir": "ex",
                "groovy": "groovy", "nim": "nim", "objective-c": "m",
                "powershell": "ps1", "julia": "jl", "ada": "ada", "zig": "zig",
            }

            ext = ext_map.get(lang, lang)
            file_path = ep_output_dir / f"{lang}.{ext}"
            file_path.write_text(code, encoding='utf-8')
            total += 1

        print(f"[OK] {ep_name}")

    print(f"\n[OK] Generated {total} practical samples!")
    print(f"[OK] Languages: {len(LANGUAGES)} (with real HTTP clients)")
    print(f"[OK] Output: lcx_samples_practical/")

if __name__ == "__main__":
    main()
