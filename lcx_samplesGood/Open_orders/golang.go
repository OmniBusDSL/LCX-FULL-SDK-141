package main

import (
  "fmt"
  "net/http"
)

func main() {
  url := "https://exchange-api.lcx.com/api/open"
  pair := "ETH/BTC"
  offset := 1

  resp, err := http.Get(url + "?pair=" + pair + "&offset=" + fmt.Sprint(offset))
  if err != nil {
    fmt.Println(err)
    return
  }
  defer resp.Body.Close()

  fmt.Println(resp)
}
