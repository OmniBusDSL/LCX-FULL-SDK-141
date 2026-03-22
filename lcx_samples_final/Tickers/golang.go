package main

import (
    "fmt"
    "io"
    "net/http"
)

func main() {
    resp, _ := http.Get("https://exchange-api.lcx.com/api/tickers", "application/json", nil)
    defer resp.Body.Close()
    body, _ := io.ReadAll(resp.Body)
    fmt.Println(string(body))
}
