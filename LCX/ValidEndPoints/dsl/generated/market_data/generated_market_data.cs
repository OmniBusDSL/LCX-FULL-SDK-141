using System;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Security.Cryptography;
using System.Text;


public static async Task<dynamic> fetch_all_tickers()
{
    // GET /api/tickers
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/tickers";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");

        try
        {
            var response = await client.GetAsync(url);
            response.EnsureSuccessStatusCode();
            var content = await response.Content.ReadAsStringAsync();
            Console.WriteLine(content);
            return JsonConvert.DeserializeObject(content);

        }
        catch (HttpRequestException e)
        {
            Console.WriteLine("Error: " + e.Message);
            throw;
        }
    }
}

public static async Task<dynamic> get_ticker_for_pair(pair)
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

public static async Task<dynamic> fetch_all_pairs()
{
    // GET /api/pairs
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/pairs";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");

        try
        {
            var response = await client.GetAsync(url);
            response.EnsureSuccessStatusCode();
            var content = await response.Content.ReadAsStringAsync();
            Console.WriteLine(content);
            return JsonConvert.DeserializeObject(content);

        }
        catch (HttpRequestException e)
        {
            Console.WriteLine("Error: " + e.Message);
            throw;
        }
    }
}

public static async Task<dynamic> get_pair_info(pair_symbol)
{
    // GET /api/pair/BTC/USDC
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/pair/BTC/USDC";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");

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

public static async Task<dynamic> get_order_book(pair)
{
    // GET /api/book
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/book";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");

        try
        {
            var response = await client.GetAsync(url);
            response.EnsureSuccessStatusCode();
            var content = await response.Content.ReadAsStringAsync();
            Console.WriteLine(content);
            return JsonConvert.DeserializeObject(content);

        }
        catch (HttpRequestException e)
        {
            Console.WriteLine("Error: " + e.Message);
            throw;
        }
    }
}

public static async Task<dynamic> get_recent_trades(pair, offset)
{
    // GET /api/trades
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/trades";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");

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

public static async Task<dynamic> get_candle_data(pair, resolution, from_ts, to_ts)
{
    // GET /v1/market/kline
    using (var client = new HttpClient())
    {
        var url = "https://api-kline.lcx.com/v1/market/kline";
        client.DefaultRequestHeaders.Add("Content-Type", "application/json");

        try
        {
            var response = await client.GetAsync(url);
            response.EnsureSuccessStatusCode();
            var content = await response.Content.ReadAsStringAsync();
            Console.WriteLine(content);
            return JsonConvert.DeserializeObject(content);

        }
        catch (HttpRequestException e)
        {
            Console.WriteLine("Error: " + e.Message);
            throw;
        }
    }
}

public static async Task<dynamic> market_overview()
{
    // GET /api/book
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/book";
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

public static async Task<dynamic> get_trades()
{
    // GET /api/trades
    using (var client = new HttpClient())
    {
        var url = "https://exchange-api.lcx.com/api/trades";
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

# None method not supported for csharp
