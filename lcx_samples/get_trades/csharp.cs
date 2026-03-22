using System;
using System.Net.Http;

public class Get Trades {
    public static async void Main() {
        string endpoint = "/api/trades";
        string method = "GET";

        // TODO: Implement LCX API call with HMAC-SHA256
        Console.WriteLine("Endpoint: " + endpoint);
        Console.WriteLine("Method: " + method);
    }
}
