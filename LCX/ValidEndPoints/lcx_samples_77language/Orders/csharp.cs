using System.Net.Http;
using System;

var client = new HttpClient();
var response = await client.GetAsync("https://exchange-api.lcx.com/api/orderHistory");
var content = await response.Content.ReadAsStringAsync();
Console.WriteLine(content);
