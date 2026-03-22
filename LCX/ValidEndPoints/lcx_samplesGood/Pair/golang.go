package main

import (
  "fmt"
  "net/http"
)

func main() {
  url := "https://exchange-api.lcx.com/api/pair"
  pair := "ETH/BTC"

  resp, err := http.Get(url + "?pair=" + pair)
  if err != nil {
    fmt.Println(err)
    return
  }
  defer resp.Body.Close()

  fmt.Println(resp)
}
