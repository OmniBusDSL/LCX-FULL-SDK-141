package main

import (
  "fmt"
  "net/http"
)

func main() {
  url := "https://exchange-api.lcx.com/api/balances"

  req, err := http.NewRequest("GET", url, nil)
  if err != nil {
    fmt.Println(err)
    return
  }
  req.Header.Set("Content-Type", "application/json")

  // Add authentication headers here

  client := &http.Client{}
  resp, err := client.Do(req)
  if err != nil {
    fmt.Println(err)
    return
  }
  defer resp.Body.Close()

if resp.Status == "200 OK" {
    // Read and print the response body
    buf := new(bytes.Buffer)
    buf.ReadFrom(resp.Body)
    fmt.Println(buf.String())
  } else {
    fmt.Println("Error:", resp.Status)
  }
}
