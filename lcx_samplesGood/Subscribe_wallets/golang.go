package main

import (
  "fmt"
  "github.com/gorilla/websocket"
  "time"
)

func main() {
  url := "wss://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}"

  conn, _, err := websocket.DefaultDialer.Dial(url, nil)
  if err != nil {
    fmt.Println("Error:", err)
    return
  }
  defer conn.Close()

  message := `{"Topic": "subscribe", "Type": "user_wallets"}`
  err = conn.WriteMessage(websocket.TextMessage, []byte(message))
  if err != nil {
    fmt.Println("Error sending message:", err)
    return
  }

  for {
    _, msg, err := conn.ReadMessage()
    if err != nil {
      fmt.Println("Error reading message:", err)
      return
    }
    fmt.Println(string(msg))
    time.Sleep(time.Second)
  }
}
