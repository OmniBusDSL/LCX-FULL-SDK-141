using System;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Security.Cryptography;
using System.Text;


# POST method not supported for csharp
# POST method not supported for csharp
# POST method not supported for csharp
# PUT method not supported for csharp
# PUT method not supported for csharp
# PUT method not supported for csharp
# DELETE method not supported for csharp
# DELETE method not supported for csharp
public static async Task<dynamic> get_all_open_orders(offset)
{
    // GET /api/open
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/open";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/open";
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

public static async Task<dynamic> get_open_orders_for_pair(offset, pair)
{
    // GET /api/open
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/open";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/open";
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

public static async Task<dynamic> get_open_orders_with_date_range(offset, pair, fromDate, toDate)
{
    // GET /api/open
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/open";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/open";
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

public static async Task<dynamic> get_single_order_status(orderId)
{
    // GET /api/order
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/order";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/order";
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

public static async Task<dynamic> get_complete_order_history(offset)
{
    // GET /api/orderHistory
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/orderHistory";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/orderHistory";
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

public static async Task<dynamic> get_order_history_for_pair(offset, pair)
{
    // GET /api/orderHistory
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/orderHistory";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/orderHistory";
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

public static async Task<dynamic> get_order_history_by_status(offset, orderStatus)
{
    // GET /api/orderHistory
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/orderHistory";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/orderHistory";
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

public static async Task<dynamic> get_order_history_by_type(offset, orderType)
{
    // GET /api/orderHistory
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/orderHistory";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/orderHistory";
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

public static async Task<dynamic> get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType)
{
    // GET /api/orderHistory
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/orderHistory";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/orderHistory";
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

public static async Task<dynamic> get_all_trade_history(offset)
{
    // GET /api/uHistory
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/uHistory";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/uHistory";
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

public static async Task<dynamic> get_trade_history_for_pair(offset, pair)
{
    // GET /api/uHistory
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/uHistory";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/uHistory";
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

public static async Task<dynamic> get_trade_history_by_date_range(offset, pair, fromDate, toDate)
{
    // GET /api/uHistory
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/uHistory";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/uHistory";
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

public static async Task<dynamic> simple_buy_workflow(order_result)
{
    // GET /api/order
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/order";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/order";
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

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for csharp
# PUT method not supported for csharp
public static async Task<dynamic> get_history(0, BTC/USDC)
{
    // GET /api/orderHistory
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/orderHistory";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/orderHistory";
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

public static async Task<dynamic> get_trades(0, BTC/USDC)
{
    // GET /api/uHistory
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/uHistory";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/uHistory";
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

# None method not supported for csharp
# DELETE method not supported for csharp
public static async Task<dynamic> confirm_cancelled(first_order_from_list)
{
    // GET /api/order
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/order";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/order";
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

# None method not supported for csharp
