using System;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Security.Cryptography;
using System.Text;


public static async Task<dynamic> fetch_all_pairs_data(pair)
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

# Workflow: FetchAllPairsData (sequence)

public static async Task<dynamic> get_ethusdc_ticker(pair)
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

public static async Task<dynamic> get_lcxusdc_ticker(pair)
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

