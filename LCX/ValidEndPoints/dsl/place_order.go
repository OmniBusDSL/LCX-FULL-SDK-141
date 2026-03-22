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
func check_order_status(order_id) (map[string]interface{}, error) {
    // GET /api/trading/order/{order_id}
    url := "https://exchange-api.lcx.com/api/trading/order/{order_id}"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/trading/order/{order_id}"
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
func complete_order_flow(currency) (map[string]interface{}, error) {
    // GET /api/account/balance
    url := "https://exchange-api.lcx.com/api/account/balance"
    headers := map[string]string{
        "Content-Type": "application/json",
    }
    // HMAC-SHA256 Authentication
    apiKey := os.Getenv("LCX_API_KEY")
    apiSecret := os.Getenv("LCX_API_SECRET")
    timestamp := strconv.FormatInt(time.Now().UnixMilli(), 10)
    message := timestamp + "GET" + "/api/account/balance"
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
# None method not supported for go
# None method not supported for go
# None method not supported for go
# None method not supported for go
# None method not supported for go
# None method not supported for go
# None method not supported for go
# None method not supported for go
# None method not supported for go
# None method not supported for go
