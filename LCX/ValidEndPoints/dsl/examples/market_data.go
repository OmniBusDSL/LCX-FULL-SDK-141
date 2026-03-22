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


func fetch_all_tickers() (map[string]interface{}, error) {
    // GET /api/tickers
    url := "https://exchange-api.lcx.com/api/tickers"
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

func get_ticker_for_pair(pair) (map[string]interface{}, error) {
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

}

func fetch_all_pairs() (map[string]interface{}, error) {
    // GET /api/pairs
    url := "https://exchange-api.lcx.com/api/pairs"
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

func get_pair_info(pair_symbol) (map[string]interface{}, error) {
    // GET /api/pair/BTC/USDC
    url := "https://exchange-api.lcx.com/api/pair/BTC/USDC"
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

}

func get_order_book(pair) (map[string]interface{}, error) {
    // GET /api/book
    url := "https://exchange-api.lcx.com/api/book"
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

func get_recent_trades(pair, offset) (map[string]interface{}, error) {
    // GET /api/trades
    url := "https://exchange-api.lcx.com/api/trades"
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

}

func get_candle_data(pair, resolution, from_ts, to_ts) (map[string]interface{}, error) {
    // GET /v1/market/kline
    url := "https://api-kline.lcx.com/v1/market/kline"
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

func market_overview() (map[string]interface{}, error) {
    // GET /api/book
    url := "https://exchange-api.lcx.com/api/book"
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

}

# Workflow: MarketOverview (sequence)

func get_trades() (map[string]interface{}, error) {
    // GET /api/trades
    url := "https://exchange-api.lcx.com/api/trades"
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

}

# None method not supported for go
