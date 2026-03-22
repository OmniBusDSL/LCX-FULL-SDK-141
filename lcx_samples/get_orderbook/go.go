package main

import (
    "fmt"
    "net/http"
)

func main() {
    // Example: Get OrderBook
    endpoint := "/api/book"
    method := "GET"

    fmt.Println("Endpoint:", endpoint)
    fmt.Println("Method:", method)

    // TODO: Implement HTTP request with HMAC-SHA256 signature
}
