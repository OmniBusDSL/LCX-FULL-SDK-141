package main

import (
  "fmt"
  "net/http"
)

func main() {
  url := "https://exchange-api.lcx.com/api/order"
  OrderID := "e8737c4a-3804-461c-9e67-4fe0af5aeb06"

  resp, err := http.Get(url + "?OrderId=" + OrderID)
  if err != nil {
    fmt.Println(err)
    return
  }
  defer resp.Body.Close()

  fmt.Println(resp)
}
