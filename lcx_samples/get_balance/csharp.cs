using System;
using System.Net.Http;

public class Get Balance {
    public static async void Main() {
        string endpoint = "/api/balance";
        string method = "GET";

        // TODO: Implement LCX API call with HMAC-SHA256
        Console.WriteLine("Endpoint: " + endpoint);
        Console.WriteLine("Method: " + method);
    }
}
