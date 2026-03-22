package main

import (
  "fmt"
  "net/http"
  "net/url"
  "strings"
)

func main() {
  url := "https://exchange-api.lcx.com/order/cancel-all"
  // Add your auth headers here
  headers := make(map[string]string)

  params := url.Values{}
  params.Add("orderIds", "70aba300-0990-481d-ad76-7bd499f473ab")
  params.Add("orderIds", "ecaf000a-8f4c-459a-b105-784c0e0436df")

  fullURL := fmt.Sprintf("%s?%s", url, params.Encode())

  req, err := http.NewRequest("DELETE", fullURL, nil)
  if err != nil {
    fmt.Println(err)
    return
  }

  for key, value := range headers {
    req.Header.Set(key, value)
  }

  client := &http.Client{}
  resp, err := client.Do(req)
  if err != nil {
    fmt.Println(err)
    return
  }
  defer resp.Body.Close()

  // Read the response body here if needed
  // responseBody, err := ioutil.ReadAll(resp.Body)
  // fmt.Println(string(responseBody))

  fmt.Println(resp.Status)
}
