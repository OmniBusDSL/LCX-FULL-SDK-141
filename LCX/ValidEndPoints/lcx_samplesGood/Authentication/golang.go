package main

import (
	"bytes"
	"crypto/hmac"
	"crypto/sha256"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"strconv"
	"time"
)

func main() {
	baseUrl := "https://exchange-api.lcx.com"
	endpoint := "/api/create"
	method := "POST"
	apiKey := "ADD YOUR LCX EXCHANGE API KEY"
	secretKey := "ADD YOUR LCX EXCHANGE SECRET KEY"

	// Create example payload
	payload := map[string]interface{}{
		"OrderType": "LIMIT",
		"Pair":      "LCX/ETH",
		"Side":      "BUY",
		"Price":     0.03033486,
		"Amount":    500,
	}

	payloadBytes, _ := json.Marshal(payload)
	payloadString := string(payloadBytes)

	// Create request string
	requestString := method + endpoint + payloadString

	// Sign the request using HMAC-SHA256
	signature := getSignature(requestString, secretKey)

	// Create HTTP request
	url := baseUrl + endpoint
	req, _ := http.NewRequest(method, url, bytes.NewBuffer(payloadBytes))

	// Add headers
	req.Header.Set("x-access-key", apiKey)
	req.Header.Set("x-access-sign", signature)
	req.Header.Set("x-access-timestamp", strconv.FormatInt(time.Now().UnixNano()/1e6, 10))
	req.Header.Set("Content-Type", "application/json")

	// Make the request
	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	defer resp.Body.Close()

	body, _ := io.ReadAll(resp.Body)
	fmt.Println("Status:", resp.StatusCode)
	fmt.Println("Body:", string(body))
}

func getSignature(message string, secretKey string) string {
	h := hmac.New(sha256.New, []byte(secretKey))
	h.Write([]byte(message))
	return base64.StdEncoding.EncodeToString(h.Sum(nil))
}
