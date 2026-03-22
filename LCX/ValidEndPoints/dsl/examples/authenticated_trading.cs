using System;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Security.Cryptography;
using System.Text;


public static async Task<dynamic> get_account_info()
{
    // GET /api/account
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/account";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/account";
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

public static async Task<dynamic> get_balances()
{
    // GET /api/balances
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/balances";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/balances";
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

public static async Task<dynamic> get_asset_balance(asset)
{
    // GET /api/balance
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/balance";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/balance";
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

public static async Task<dynamic> get_trading_fees()
{
    // GET /api/fees
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/fees";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/fees";
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

public static async Task<dynamic> get_open_orders(offset, pair)
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

public static async Task<dynamic> get_order_details(orderId)
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

public static async Task<dynamic> get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType)
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

public static async Task<dynamic> get_user_trade_history(offset, pair, fromDate, toDate)
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

# POST method not supported for csharp
# PUT method not supported for csharp
# DELETE method not supported for csharp
# DELETE method not supported for csharp
public static async Task<dynamic> check_balance_workflow()
{
    // GET /api/balances
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/balances";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/balances";
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

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for csharp
public static async Task<dynamic> place_order_workflow(BTC/USDC)
{
    // GET /api/ticker
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/ticker";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");

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

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for csharp
public static async Task<dynamic> get_order_info(order_response)
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
public static async Task<dynamic> manage_open_orders_workflow(0)
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

# Workflow: ManageOpenOrdersWorkflow (sequence)

public static async Task<dynamic> get_trade_history(0)
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
# PUT method not supported for csharp
# DELETE method not supported for csharp
# None method not supported for csharp
public static async Task<dynamic> account_monitoring_workflow()
{
    // GET /api/balances
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/balances";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/balances";
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

# Workflow: AccountMonitoringWorkflow (sequence)

public static async Task<dynamic> get_open_orders(0)
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

        }
        catch (HttpRequestException e)
        {
            Console.WriteLine("Error: " + e.Message);
            throw;
        }
    }
}

public static async Task<dynamic> get_fees()
{
    // GET /api/fees
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/fees";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");
        var apiKey = Environment.GetEnvironmentVariable("LCX_API_KEY");
        var apiSecret = Environment.GetEnvironmentVariable("LCX_API_SECRET");
        var timestamp = DateTimeOffset.Now.ToUnixTimeMilliseconds().ToString();
        var message = timestamp + "GET" + "/api/fees";
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
