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


# POST method not supported for go
# POST method not supported for go
# POST method not supported for go
# PUT method not supported for go
# PUT method not supported for go
# PUT method not supported for go
# DELETE method not supported for go
# DELETE method not supported for go
func get_all_open_orders(offset) (map[string]interface{}, error) {
    // GET /api/open
    url := "https://exchange-api.lcx.com/api/open"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/open"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_open_orders_for_pair(offset, pair) (map[string]interface{}, error) {
    // GET /api/open
    url := "https://exchange-api.lcx.com/api/open"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/open"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_open_orders_with_date_range(offset, pair, fromDate, toDate) (map[string]interface{}, error) {
    // GET /api/open
    url := "https://exchange-api.lcx.com/api/open"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/open"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_single_order_status(orderId) (map[string]interface{}, error) {
    // GET /api/order
    url := "https://exchange-api.lcx.com/api/order"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/order"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_complete_order_history(offset) (map[string]interface{}, error) {
    // GET /api/orderHistory
    url := "https://exchange-api.lcx.com/api/orderHistory"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/orderHistory"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_order_history_for_pair(offset, pair) (map[string]interface{}, error) {
    // GET /api/orderHistory
    url := "https://exchange-api.lcx.com/api/orderHistory"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/orderHistory"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_order_history_by_status(offset, orderStatus) (map[string]interface{}, error) {
    // GET /api/orderHistory
    url := "https://exchange-api.lcx.com/api/orderHistory"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/orderHistory"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_order_history_by_type(offset, orderType) (map[string]interface{}, error) {
    // GET /api/orderHistory
    url := "https://exchange-api.lcx.com/api/orderHistory"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/orderHistory"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) (map[string]interface{}, error) {
    // GET /api/orderHistory
    url := "https://exchange-api.lcx.com/api/orderHistory"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/orderHistory"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_all_trade_history(offset) (map[string]interface{}, error) {
    // GET /api/uHistory
    url := "https://exchange-api.lcx.com/api/uHistory"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/uHistory"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_trade_history_for_pair(offset, pair) (map[string]interface{}, error) {
    // GET /api/uHistory
    url := "https://exchange-api.lcx.com/api/uHistory"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/uHistory"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_trade_history_by_date_range(offset, pair, fromDate, toDate) (map[string]interface{}, error) {
    // GET /api/uHistory
    url := "https://exchange-api.lcx.com/api/uHistory"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/uHistory"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func simple_buy_workflow(order_result) (map[string]interface{}, error) {
    // GET /api/order
    url := "https://exchange-api.lcx.com/api/order"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/order"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for go
# PUT method not supported for go
func get_history(0, BTC/USDC) (map[string]interface{}, error) {
    // GET /api/orderHistory
    url := "https://exchange-api.lcx.com/api/orderHistory"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/orderHistory"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    body, _ := io.ReadAll(resp.Body)
    var result map[string]interface{}
    json.Unmarshal(body, &result)

}

func get_trades(0, BTC/USDC) (map[string]interface{}, error) {
    // GET /api/uHistory
    url := "https://exchange-api.lcx.com/api/uHistory"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/uHistory"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

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
# DELETE method not supported for go
func confirm_cancelled(first_order_from_list) (map[string]interface{}, error) {
    // GET /api/order
    url := "https://exchange-api.lcx.com/api/order"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/order"
    h := hmac.New(sha256.New, []byte(apiSecret))
    h.Write([]byte(message))
    signature := base64.StdEncoding.EncodeToString(h.Sum(nil))
    headers["x-access-key"] = apiKey
    headers["x-access-sign"] = signature
    headers["x-access-timestamp"] = timestamp

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
