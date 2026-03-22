using System.Net.Http;
using System;

var client = new HttpClient();
var response = await client.GetAsync("https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}");
var content = await response.Content.ReadAsStringAsync();
Console.WriteLine(content);
