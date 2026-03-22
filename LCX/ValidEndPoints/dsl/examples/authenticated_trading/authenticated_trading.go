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


func get_account_info() (map[string]interface{}, error) {
    // GET /api/account
    url := "https://exchange-api.lcx.com/api/account"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/account"
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

func get_balances() (map[string]interface{}, error) {
    // GET /api/balances
    url := "https://exchange-api.lcx.com/api/balances"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/balances"
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

func get_asset_balance(asset) (map[string]interface{}, error) {
    // GET /api/balance
    url := "https://exchange-api.lcx.com/api/balance"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/balance"
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

func get_trading_fees() (map[string]interface{}, error) {
    // GET /api/fees
    url := "https://exchange-api.lcx.com/api/fees"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/fees"
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

func get_open_orders(offset, pair) (map[string]interface{}, error) {
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

func get_order_details(orderId) (map[string]interface{}, error) {
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

func get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) (map[string]interface{}, error) {
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

func get_user_trade_history(offset, pair, fromDate, toDate) (map[string]interface{}, error) {
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

# POST method not supported for go
# PUT method not supported for go
# DELETE method not supported for go
# DELETE method not supported for go
func check_balance_workflow() (map[string]interface{}, error) {
    // GET /api/balances
    url := "https://exchange-api.lcx.com/api/balances"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/balances"
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

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for go
func place_order_workflow(BTC/USDC) (map[string]interface{}, error) {
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

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for go
func get_order_info(order_response) (map[string]interface{}, error) {
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
func manage_open_orders_workflow(0) (map[string]interface{}, error) {
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

# Workflow: ManageOpenOrdersWorkflow (sequence)

func get_trade_history(0) (map[string]interface{}, error) {
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
# PUT method not supported for go
# DELETE method not supported for go
# None method not supported for go
func account_monitoring_workflow() (map[string]interface{}, error) {
    // GET /api/balances
    url := "https://exchange-api.lcx.com/api/balances"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/balances"
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

# Workflow: AccountMonitoringWorkflow (sequence)

func get_open_orders(0) (map[string]interface{}, error) {
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

func get_fees() (map[string]interface{}, error) {
    // GET /api/fees
    url := "https://exchange-api.lcx.com/api/fees"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/fees"
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
