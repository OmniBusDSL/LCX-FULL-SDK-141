using System;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Security.Cryptography;
using System.Text;


# POST method not supported for csharp
public static async Task<dynamic> check_order_status(order_id)
{
    // GET /api/trading/order/{order_id}
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/trading/order/{order_id}";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/trading/order/{order_id}";
        using (var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(apiSecret)))
        {
            var signature = Convert.ToBase64String(hmac.ComputeHash(Encoding.UTF8.GetBytes(message)));
            client.DefaultRequestHeaders.Add("x-access-key", apiKey);
            client.DefaultRequestHeaders.Add("x-access-sign", signature);
            client.DefaultRequestHeaders.Add("x-access-timestamp", timestamp);
        }

        try
        {
            var response = await client.GetAsync(url);
            response.EnsureSuccessStatusCode();
            var content = await response.Content.ReadAsStringAsync();
            return JsonConvert.DeserializeObject(content);

        }
        catch (HttpRequestException e)
        {
            Console.WriteLine("Error: " + e.Message);
            throw;
        }
    }
}

# POST method not supported for csharp
public static async Task<dynamic> complete_order_flow(currency)
{
    // GET /api/account/balance
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/account/balance";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/account/balance";
        using (var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(apiSecret)))
        {
            var signature = Convert.ToBase64String(hmac.ComputeHash(Encoding.UTF8.GetBytes(message)));
            client.DefaultRequestHeaders.Add("x-access-key", apiKey);
            client.DefaultRequestHeaders.Add("x-access-sign", signature);
            client.DefaultRequestHeaders.Add("x-access-timestamp", timestamp);
        }

        try
        {
            var response = await client.GetAsync(url);
            response.EnsureSuccessStatusCode();

        }
        catch (HttpRequestException e)
        {
            Console.WriteLine("Error: " + e.Message);
            throw;
        }
    }
}



# POST method not supported for csharp
# None method not supported for csharp
# None method not supported for csharp
# None method not supported for csharp
# None method not supported for csharp
# None method not supported for csharp
# None method not supported for csharp
# None method not supported for csharp
# None method not supported for csharp
# None method not supported for csharp
# None method not supported for csharp
