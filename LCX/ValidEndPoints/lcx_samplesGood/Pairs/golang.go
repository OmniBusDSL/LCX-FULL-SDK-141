package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

func main() {
  url := "https://exchange-api.lcx.com/api/pairs"

  req, err := http.NewRequest("GET", url, nil)
  if err != nil {
    fmt.Println(err)
    return
  }
  req.Header.Set("Content-Type", "application/json")

  client := &http.Client{}
  resp, err := client.Do(req)
  if err != nil {
    fmt.Println(err)
    return
  }
  defer resp.Body.Close()

if resp.Status == "200 OK" {
    // Read and print the response body
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
      fmt.Println(err)
      return
    }
    fmt.Println(string(body))
  } else {
    fmt.Println("Error:", resp.Status)
  }
}
