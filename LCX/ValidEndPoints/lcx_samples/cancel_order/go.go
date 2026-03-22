package main

import (
    "fmt"
    "net/http"
)

func main() {
    // Example: Cancel Order
    endpoint := "/api/cancel"
    method := "DELETE"

    fmt.Println("Endpoint:", endpoint)
    fmt.Println("Method:", method)

    // TODO: Implement HTTP request with HMAC-SHA256 signature
}
