package main

import (
    "fmt"
    "net/http"
)

func main() {
    // Example: Get Balance
    endpoint := "/api/balance"
    method := "GET"

    fmt.Println("Endpoint:", endpoint)
    fmt.Println("Method:", method)

    // TODO: Implement HTTP request with HMAC-SHA256 signature
}
