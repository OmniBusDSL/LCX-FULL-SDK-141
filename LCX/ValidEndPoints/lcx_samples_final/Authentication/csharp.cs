using System.Net.Http;
using System;

var client = new HttpClient();
var response = await client.PostAsync("https://exchange-api.lcx.com");
var content = await response.Content.ReadAsStringAsync();
Console.WriteLine(content);
