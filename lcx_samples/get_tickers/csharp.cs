using System;
using System.Net.Http;

public class Get Tickers {
    public static async void Main() {
        string endpoint = "/api/tickers";
        string method = "GET";

        // TODO: Implement LCX API call with HMAC-SHA256
        Console.WriteLine("Endpoint: " + endpoint);
        Console.WriteLine("Method: " + method);
    }
}
