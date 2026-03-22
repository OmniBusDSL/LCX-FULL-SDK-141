package main

import (
  "bytes"
  "fmt"
  "net/http"
)

func main() {
  url := "https://exchange-api.lcx.com/api/modify"
  payload := []byte(`{
    "OrderId": "9f898d18-0980-4fb3-b18c-eeb39fc20324",
    "Amount": 100,
    "Price": 0.004
  }`)

  req, err := http.NewRequest("PUT", url, bytes.NewBuffer(payload))
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
