package main

import (
    "fmt"
    "io"
    "net/http"
)

func main() {
    resp, _ := http.Post("https://exchange-api.lcx.com", "application/json", nil)
    defer resp.Body.Close()
    body, _ := io.ReadAll(resp.Body)
    fmt.Println(string(body))
}
