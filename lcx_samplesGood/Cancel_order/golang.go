package main

import (
  "fmt"
  "net/http"
)

func main() {
  url := "https://exchange-api.lcx.com/api/cancel"
  orderID := "e8737c4a-3804-461c-9e67-4fe0af5aeb06"

  resp, err := http.Delete(url + "?orderId=" + orderID)
  if err != nil {
    fmt.Println(err)
    return
  }
  defer resp.Body.Close()

  fmt.Println(resp)
}
