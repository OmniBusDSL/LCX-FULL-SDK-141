package main

import (
  "bytes"
  "fmt"
  "net/http"
)

func main() {
  url := "https://exchange-api.lcx.com/api/ticker"
  pair := "ETH/BTC"

  resp, err := http.Post(url+"?pair="+pair, "application/json", bytes.NewBuffer([]byte("")))
  if err != nil {
    fmt.Println(err)
    return
  }
  defer resp.Body.Close()

  fmt.Println(resp)
}
