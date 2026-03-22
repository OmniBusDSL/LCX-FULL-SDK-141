package main

import (
    "fmt"
    "io"
    "net/http"
    "json"
    "os"
    "crypto/hmac"
    "crypto/sha256"
    "encoding/base64"
    "time"
)


func fetch_all_pairs_data(pair) (map[string]interface{}, error) {
    // GET /api/ticker
    url := "https://exchange-api.lcx.com/api/ticker"
    headers := map[string]string{
        "Content-Type": "application/json",
    }

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)
    fmt.Println(result)
    return result, nil

}

# Workflow: FetchAllPairsData (sequence)

func get_ethusdc_ticker(pair) (map[string]interface{}, error) {
    // GET /api/ticker
    url := "https://exchange-api.lcx.com/api/ticker"
    headers := map[string]string{
        "Content-Type": "application/json",
    }

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)
    fmt.Println(result)
    return result, nil

}

func get_lcxusdc_ticker(pair) (map[string]interface{}, error) {
    // GET /api/ticker
    url := "https://exchange-api.lcx.com/api/ticker"
    headers := map[string]string{
        "Content-Type": "application/json",
    }

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)
    fmt.Println(result)
    return result, nil

}

