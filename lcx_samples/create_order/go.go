package main

import (
    "fmt"
    "net/http"
)

func main() {
    // Example: Create Order
    endpoint := "/api/create"
    method := "POST"

    fmt.Println("Endpoint:", endpoint)
    fmt.Println("Method:", method)

    // TODO: Implement HTTP request with HMAC-SHA256 signature
}
