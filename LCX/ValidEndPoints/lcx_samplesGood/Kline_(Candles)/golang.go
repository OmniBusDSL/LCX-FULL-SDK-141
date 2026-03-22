package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

func main() {
  url := "https://api-kline.lcx.com/v1/market/kline"
  pair := "ETH/BTC"
  resolution := "60"
  from := "1608129416"
  to := "1608229416"

  req, err := http.NewRequest("GET", url, nil)
  if err != nil {
    fmt.Println(err)
    return
  }

  q := req.URL.Query()
  q.Add("pair", pair)
  q.Add("resolution", resolution)
  q.Add("from", from)
  q.Add("to", to)
  req.URL.RawQuery = q.Encode()

  req.Header.Add("Content-Type", "application/json")

  client := &http.Client{}
  resp, err := client.Do(req)
  if err != nil {
    fmt.Println(err)
    return
  }
  defer resp.Body.Close()

  body, err := ioutil.ReadAll(resp.Body)
  if err != nil {
    fmt.Println(err)
    return
  }

  fmt.Println(string(body))
}
