package main

import (
  "fmt"
  "net/http"
)

func main() {
  url := "https://exchange-api.lcx.com/api/balance"
  coin := "ETH"

  resp, err := http.Get(url + "?coin=" + coin)
  if err != nil {
    fmt.Println(err)
    return
  }
  defer resp.Body.Close()

  fmt.Println(resp)
}
