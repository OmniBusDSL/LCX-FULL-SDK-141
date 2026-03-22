using System;
using System.Net.Http;

public class Get Pairs {
    public static async void Main() {
        string endpoint = "/api/pairs";
        string method = "GET";

        // TODO: Implement LCX API call with HMAC-SHA256
        Console.WriteLine("Endpoint: " + endpoint);
        Console.WriteLine("Method: " + method);
    }
}
