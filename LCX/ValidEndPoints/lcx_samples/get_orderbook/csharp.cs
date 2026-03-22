using System;
using System.Net.Http;

public class Get Orderbook {
    public static async void Main() {
        string endpoint = "/api/book";
        string method = "GET";

        // TODO: Implement LCX API call with HMAC-SHA256
        Console.WriteLine("Endpoint: " + endpoint);
        Console.WriteLine("Method: " + method);
    }
}
