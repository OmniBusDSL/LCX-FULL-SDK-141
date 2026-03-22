# LCX Exchange API - WebSocket Reference

**Latest Version**: 1.1.2
**Date**: 2026-03-22
**Source**: https://docs.lcx.com

---

## 📡 Overview

The LCX Exchange API provides **6 WebSocket endpoints** for real-time data streaming:
- **3 Public endpoints** (no authentication required)
- **3 Authenticated endpoints** (requires API credentials)

### Base URL
```
wss://exchange-api.lcx.com
```

---

## ✅ Public WebSocket Endpoints

### 1. Subscribe Ticker
**Endpoint**: `/ws`
**Type**: `ticker`
**Authentication**: None

Get real-time ticker data for all trading pairs.

**Subscription Message**:
```json
{
  "Topic": "subscribe",
  "Type": "ticker"
}
```

**Response Format** (v1.1.2 - Unified):
```json
{
  "Type": "ticker",
  "Event": "snapshot",
  "Timestamp": 1234567890000,
  "Data": {
    "Pair": "LCX/USDC",
    "LastPrice": 2.45,
    "BidPrice": 2.44,
    "AskPrice": 2.46,
    "High24h": 2.60,
    "Low24h": 2.30,
    "Volume24h": 1500000
  }
}
```

**Python Example**:
```python
import asyncio
import websockets
import json

async def subscribe_ticker():
    uri = "wss://exchange-api.lcx.com/ws"
    async with websockets.connect(uri) as websocket:
        msg = json.dumps({
            "Topic": "subscribe",
            "Type": "ticker"
        })
        await websocket.send(msg)
        async for message in websocket:
            data = json.loads(message)
            print(f"Ticker: {data['Data']['Pair']} @ {data['Data']['LastPrice']}")

asyncio.run(subscribe_ticker())
```

---

### 2. Subscribe Orderbook
**Endpoint**: `/ws`
**Type**: `orderbook`
**Authentication**: None
**Parameters**: `Pair` (required)

Get real-time orderbook updates for a specific trading pair.

**Subscription Message**:
```json
{
  "Topic": "subscribe",
  "Type": "orderbook",
  "Pair": "LCX/USDC"
}
```

**Response Format** (v1.1.2 - Array of Changes):
```json
{
  "Type": "orderbook",
  "Event": "snapshot",
  "Timestamp": 1234567890000,
  "Pair": "LCX/USDC",
  "Data": [
    [2.45, 100.5, "BUY"],
    [2.46, 200.3, "SELL"],
    [2.47, 150.2, "SELL"]
  ]
}
```

**Note**: v1.1.2 changed the response to return an **array of orderbook changes** instead of a single change. Each entry is `[price, amount, side]`.

**Python Example**:
```python
import asyncio
import websockets
import json

async def subscribe_orderbook():
    uri = "wss://exchange-api.lcx.com/ws"
    async with websockets.connect(uri) as websocket:
        msg = json.dumps({
            "Topic": "subscribe",
            "Type": "orderbook",
            "Pair": "LCX/USDC"
        })
        await websocket.send(msg)
        async for message in websocket:
            data = json.loads(message)
            print(f"Orderbook update: {len(data['Data'])} changes")
            for price, amount, side in data['Data']:
                print(f"  {side}: {amount} @ {price}")

asyncio.run(subscribe_orderbook())
```

---

### 3. Subscribe Trade
**Endpoint**: `/ws`
**Type**: `trade`
**Authentication**: None
**Parameters**: `Pair` (required)

Get real-time trade execution updates for a specific pair.

**Subscription Message**:
```json
{
  "Topic": "subscribe",
  "Type": "trade",
  "Pair": "ETH/BTC"
}
```

**Response Format** (v1.1.2 - Array of Trades):
```json
{
  "Type": "trade",
  "Event": "update",
  "Timestamp": 1234567890000,
  "Pair": "ETH/BTC",
  "Data": [
    [1.45, 50.2, "BUY", 1234567890000],
    [1.46, 75.3, "SELL", 1234567891000]
  ]
}
```

**Note**: v1.1.2 changed the response to return an **array of trades** instead of a single trade. Each entry is `[price, amount, side, timestamp]`.

**Python Example**:
```python
import asyncio
import websockets
import json

async def subscribe_trade():
    uri = "wss://exchange-api.lcx.com/ws"
    async with websockets.connect(uri) as websocket:
        msg = json.dumps({
            "Topic": "subscribe",
            "Type": "trade",
            "Pair": "ETH/BTC"
        })
        await websocket.send(msg)
        async for message in websocket:
            data = json.loads(message)
            print(f"Trade update: {len(data['Data'])} executions")
            for price, amount, side, ts in data['Data']:
                print(f"  {side}: {amount} @ {price}")

asyncio.run(subscribe_trade())
```

---

## 🔐 Authenticated WebSocket Endpoints

### Authentication
For authenticated endpoints, include credentials in the WebSocket URL as query parameters:

```
wss://exchange-api.lcx.com/api/auth/ws?x-access-key={key}&x-access-sign={signature}&x-access-timestamp={timestamp}
```

**Generate Signature**:
```python
import hmac, hashlib, base64, json, time

def create_signature(api_secret, method, endpoint, payload=None):
    if payload is None:
        payload = {}
    timestamp = str(int(time.time() * 1000))
    request_string = method + endpoint + json.dumps(payload)
    signature = base64.b64encode(
        hmac.new(
            api_secret.encode(),
            request_string.encode(),
            hashlib.sha256
        ).digest()
    ).decode()
    return signature, timestamp

# For WebSocket auth
signature, timestamp = create_signature(api_secret, "GET", "/api/auth/ws", {})
auth_url = f"wss://exchange-api.lcx.com/api/auth/ws?x-access-key={api_key}&x-access-sign={signature}&x-access-timestamp={timestamp}"
```

---

### 4. Subscribe Wallet Updates
**Endpoint**: `/api/auth/ws`
**Type**: `user_wallets`
**Authentication**: Required
**Topic**: `update`

Get real-time wallet balance updates.

**Subscription Message**:
```json
{
  "Topic": "update",
  "Type": "user_wallets"
}
```

**Response Format** (v1.1.1+):
```json
{
  "Type": "user_wallets",
  "Timestamp": 1234567890000,
  "Data": {
    "Coin": "LCX",
    "Free": 1000.50,
    "Locked": 500.00,
    "Total": 1500.50
  }
}
```

**Python Example**:
```python
import asyncio
import websockets
import json
import hmac, hashlib, base64, time

api_key = "YOUR_API_KEY"
api_secret = "YOUR_API_SECRET"

def get_auth_url():
    timestamp = str(int(time.time() * 1000))
    request_string = "GET" + "/api/auth/ws" + json.dumps({})
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), request_string.encode(), hashlib.sha256).digest()
    ).decode()
    return f"wss://exchange-api.lcx.com/api/auth/ws?x-access-key={api_key}&x-access-sign={signature}&x-access-timestamp={timestamp}"

async def subscribe_wallet():
    uri = get_auth_url()
    async with websockets.connect(uri) as websocket:
        msg = json.dumps({"Topic": "update", "Type": "user_wallets"})
        await websocket.send(msg)
        async for message in websocket:
            data = json.loads(message)
            wallet = data['Data']
            print(f"Wallet: {wallet['Coin']} Free={wallet['Free']} Locked={wallet['Locked']}")

asyncio.run(subscribe_wallet())
```

---

### 5. Subscribe Order Updates
**Endpoint**: `/api/auth/ws`
**Type**: `user_orders`
**Authentication**: Required
**Topic**: `update`

Get real-time updates for your orders.

**Subscription Message**:
```json
{
  "Topic": "update",
  "Type": "user_orders"
}
```

**Response Format** (v1.1.1+):
```json
{
  "Type": "user_orders",
  "Timestamp": 1234567890000,
  "Data": {
    "OrderId": "550e8400-e29b-41d4-a716-446655440000",
    "ClientOrderId": "550e8400-e29b-41d4-a716-446655440001",
    "Pair": "LCX/USDC",
    "Side": "BUY",
    "OrderType": "LIMIT",
    "Price": 2.45,
    "Amount": 100.0,
    "FilledAmount": 50.0,
    "Status": "PARTIAL_FILLED",
    "CreatedAt": 1234567890000,
    "UpdatedAt": 1234567895000
  }
}
```

**Note**: v1.1.1 added the `ClientOrderId` field to order updates.

**Python Example**:
```python
import asyncio
import websockets
import json
import hmac, hashlib, base64, time

api_key = "YOUR_API_KEY"
api_secret = "YOUR_API_SECRET"

def get_auth_url():
    timestamp = str(int(time.time() * 1000))
    request_string = "GET" + "/api/auth/ws" + json.dumps({})
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), request_string.encode(), hashlib.sha256).digest()
    ).decode()
    return f"wss://exchange-api.lcx.com/api/auth/ws?x-access-key={api_key}&x-access-sign={signature}&x-access-timestamp={timestamp}"

async def subscribe_orders():
    uri = get_auth_url()
    async with websockets.connect(uri) as websocket:
        msg = json.dumps({"Topic": "update", "Type": "user_orders"})
        await websocket.send(msg)
        async for message in websocket:
            data = json.loads(message)
            order = data['Data']
            print(f"Order: {order['OrderId'][:8]}... {order['Side']} {order['FilledAmount']}/{order['Amount']} @ {order['Price']}")

asyncio.run(subscribe_orders())
```

---

### 6. Subscribe Trade Updates
**Endpoint**: `/api/auth/ws`
**Type**: `user_trades`
**Authentication**: Required
**Topic**: `update`

Get real-time updates for your executed trades.

**Subscription Message**:
```json
{
  "Topic": "update",
  "Type": "user_trades"
}
```

**Response Format** (v1.1.1+):
```json
{
  "Type": "user_trades",
  "Timestamp": 1234567890000,
  "Data": {
    "TradeId": "660e8400-e29b-41d4-a716-446655440000",
    "OrderId": "550e8400-e29b-41d4-a716-446655440000",
    "ClientOrderId": "550e8400-e29b-41d4-a716-446655440001",
    "Pair": "LCX/USDC",
    "Price": 2.45,
    "Amount": 50.0,
    "Fee": 0.25,
    "FeeCoin": "LCX",
    "Side": "BUY",
    "CreatedAt": 1234567890000
  }
}
```

**Note**: v1.1.1 added the `ClientOrderId` field to trade updates.

**Python Example**:
```python
import asyncio
import websockets
import json
import hmac, hashlib, base64, time

api_key = "YOUR_API_KEY"
api_secret = "YOUR_API_SECRET"

def get_auth_url():
    timestamp = str(int(time.time() * 1000))
    request_string = "GET" + "/api/auth/ws" + json.dumps({})
    signature = base64.b64encode(
        hmac.new(api_secret.encode(), request_string.encode(), hashlib.sha256).digest()
    ).decode()
    return f"wss://exchange-api.lcx.com/api/auth/ws?x-access-key={api_key}&x-access-sign={signature}&x-access-timestamp={timestamp}"

async def subscribe_trades():
    uri = get_auth_url()
    async with websockets.connect(uri) as websocket:
        msg = json.dumps({"Topic": "update", "Type": "user_trades"})
        await websocket.send(msg)
        async for message in websocket:
            data = json.loads(message)
            trade = data['Data']
            print(f"Trade: {trade['TradeId'][:8]}... {trade['Side']} {trade['Amount']} @ {trade['Price']}")

asyncio.run(subscribe_trades())
```

---

## 📋 Release Notes Summary

### Version 1.1.2 (WebSocket Enhancements)
- **Subscribe Orderbook**: Response `data` now returns array of changes `[[price, amount, side], ...]`
- **Subscribe Trade**: Response `data` now returns array of trades `[[price, amount, side, timestamp], ...]`
- **Subscribe Ticker**: Unified response structure for snapshots and updates

### Version 1.1.1 (ClientOrderId Addition)
- All order and trade endpoints now include `ClientOrderId` field
- Auto-generated as UUID if not provided in request
- Useful for tracking orders across REST API and WebSocket subscriptions

### Version 1.1.0 (Initial Release)
- Complete WebSocket API with 6 endpoints
- Public subscriptions for market data
- Authenticated subscriptions for user data

---

## 🔧 Running Tests

```bash
# Test all WebSocket endpoints
python3 test_websocket.py --api-key YOUR_KEY --api-secret YOUR_SECRET

# Test only public endpoints (no auth)
python3 test_websocket.py

# Output shows all 6 endpoints with success/failure status
```

---

## 📌 Important Notes

1. **Heartbeat**: Keep connection alive with periodic pings (recommended every 60 seconds)
2. **Message Format**: All subscription messages must be valid JSON
3. **Error Handling**: If subscription fails, the server will close the connection
4. **Rate Limiting**: WebSocket connections are not subject to HTTP rate limits
5. **v1.1.2 Format**: Ensure your client can handle array responses for orderbook and trade data
6. **Authentication**: Use query parameters for WebSocket auth (cannot use headers in WebSocket protocol)

---

**Last Updated**: 2026-03-22
**Official Docs**: https://docs.lcx.com
