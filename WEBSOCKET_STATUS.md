# WebSocket Endpoints - Status Report

**Date**: 2026-03-22
**Status**: ✅ **AVAILABLE & VERIFIED (v1.1.2)**
**Source**: https://docs.lcx.com

---

## Current Status

✅ **WebSocket API is AVAILABLE** on the LCX Exchange API server
- Base URL: `wss://exchange-api.lcx.com`
- 6 endpoints verified working (3 public + 3 authenticated)
- Version: 1.1.2 (with latest format changes)

---

## Available Endpoints

### Public Endpoints (3)

| Endpoint | Type | URL | Format |
|----------|------|-----|--------|
| Subscribe Ticker | `ticker` | `/ws` | Unified structure (v1.1.2) |
| Subscribe Orderbook | `orderbook` | `/ws` | Array of changes (v1.1.2) |
| Subscribe Trade | `trade` | `/ws` | Array of trades (v1.1.2) |

**Connection URL**:
```
wss://exchange-api.lcx.com/ws
```

**Subscription Message**:
```json
{
  "Topic": "subscribe",
  "Type": "ticker|orderbook|trade",
  "Pair": "LCX/USDC"  // Required for orderbook/trade
}
```

---

### Authenticated Endpoints (3)

| Endpoint | Type | URL | Notes |
|----------|------|-----|-------|
| Wallet Updates | `user_wallets` | `/api/auth/ws` | Real-time balance changes |
| Order Updates | `user_orders` | `/api/auth/ws` | Includes ClientOrderId (v1.1.1) |
| Trade Updates | `user_trades` | `/api/auth/ws` | Includes ClientOrderId (v1.1.1) |

**Connection URL** (with authentication):
```
wss://exchange-api.lcx.com/api/auth/ws?x-access-key={key}&x-access-sign={signature}&x-access-timestamp={timestamp}
```

**Subscription Message**:
```json
{
  "Topic": "update",
  "Type": "user_wallets|user_orders|user_trades"
}
```

---

## Version History

### Version 1.1.2 (Latest - Format Changes)
**Orderbook Response Change**:
- ❌ OLD: Single change `[price, amount, side]`
- ✅ NEW: Array of changes `[[price, amount, side], ...]`

**Trade Response Change**:
- ❌ OLD: Single trade `[price, amount, side, timestamp]`
- ✅ NEW: Array of trades `[[price, amount, side, timestamp], ...]`

**Ticker Response**:
- ✅ Unified response structure for snapshots and updates

### Version 1.1.1 (Field Addition)
All authenticated endpoints now include `ClientOrderId` field:
- Automatically generated as UUID if not provided
- Useful for correlating REST API requests with WebSocket events
- Added to: Order Updates, Trade Updates

### Version 1.1.0 (Initial Release)
- All 6 WebSocket endpoints available
- Complete market data subscriptions
- Authenticated user data subscriptions

---

## Working Examples

### Python: Subscribe to Ticker
```python
import asyncio
import websockets
import json

async def ticker():
    uri = "wss://exchange-api.lcx.com/ws"
    async with websockets.connect(uri) as ws:
        await ws.send(json.dumps({"Topic": "subscribe", "Type": "ticker"}))
        async for msg in ws:
            data = json.loads(msg)
            print(f"Ticker: {data['Data']['Pair']} @ {data['Data']['LastPrice']}")

asyncio.run(ticker())
```

### Python: Subscribe to Orderbook (with Pair)
```python
import asyncio
import websockets
import json

async def orderbook():
    uri = "wss://exchange-api.lcx.com/ws"
    async with websockets.connect(uri) as ws:
        await ws.send(json.dumps({
            "Topic": "subscribe",
            "Type": "orderbook",
            "Pair": "LCX/USDC"
        }))
        async for msg in ws:
            data = json.loads(msg)
            # v1.1.2: data is array of [price, amount, side]
            for price, amount, side in data['Data']:
                print(f"{side}: {amount} @ {price}")

asyncio.run(orderbook())
```

### Python: Authenticated - User Orders
```python
import asyncio
import websockets
import json
import hmac, hashlib, base64, time

API_KEY = "YOUR_API_KEY"
API_SECRET = "YOUR_API_SECRET"

def get_auth_url():
    ts = str(int(time.time() * 1000))
    sig_str = "GET" + "/api/auth/ws" + json.dumps({})
    sig = base64.b64encode(
        hmac.new(API_SECRET.encode(), sig_str.encode(), hashlib.sha256).digest()
    ).decode()
    return f"wss://exchange-api.lcx.com/api/auth/ws?x-access-key={API_KEY}&x-access-sign={sig}&x-access-timestamp={ts}"

async def user_orders():
    uri = get_auth_url()
    async with websockets.connect(uri) as ws:
        await ws.send(json.dumps({"Topic": "update", "Type": "user_orders"}))
        async for msg in ws:
            data = json.loads(msg)
            order = data['Data']
            # v1.1.1: includes ClientOrderId
            print(f"Order: {order['OrderId'][:8]}... Status={order['Status']}")

asyncio.run(user_orders())
```

---

## Testing WebSocket Endpoints

### Run Test Suite
```bash
# Test all 6 endpoints
python3 test_websocket.py --api-key YOUR_KEY --api-secret YOUR_SECRET

# Test only public endpoints (no auth required)
python3 test_websocket.py
```

### Expected Output
```
📡 Testing: Subscribe Ticker
   Endpoint: /ws
   URL: wss://exchange-api.lcx.com/ws
✅ Connected
   📤 Sent: {"Topic": "subscribe", "Type": "ticker"}
   📨 Message 1: Ticker: LCX/USDC @ $2.45
✅ PASS - Subscribe Ticker (received 3 messages)

📡 Testing: Subscribe Orderbook (LCX/USDC)
   Endpoint: /ws
✅ Connected
   📤 Sent: {"Topic": "subscribe", "Type": "orderbook", "Pair": "LCX/USDC"}
   📨 Message 1: Orderbook update: 5 changes
✅ PASS - Subscribe Orderbook (received 2 messages)
```

---

## Troubleshooting

### Connection Refused
- ❌ Server not running
- ✅ Retry connection after a few seconds

### 404 Not Found
- ❌ Using wrong endpoint (e.g., `/subscribeTicker` instead of `/ws`)
- ✅ Use `/ws` for public subscriptions
- ✅ Use `/api/auth/ws` for authenticated subscriptions

### Authentication Failed
- ❌ Wrong signature format
- ✅ Use `METHOD + ENDPOINT + JSON.stringify(payload)` format
- ✅ Include all 3 auth parameters: `x-access-key`, `x-access-sign`, `x-access-timestamp`
- ✅ For WebSocket, parameters go in query string, not headers

### No Messages Received
- ⚠️ Connection successful but no data yet
- ✅ Wait a few seconds - messages only sent when data changes
- ✅ For tickers, try subscribe to orderbook or trades instead

### JSONDecodeError on Message
- ✅ v1.1.2 format changed - orderbook/trade data are now arrays
- ✅ Update client to handle array format: `for [price, amount, side] in data['Data']`

---

## Migration from Old Format (v1.1.1 → v1.1.2)

If you're upgrading from v1.1.1:

**Orderbook Updates**:
```python
# OLD (v1.1.1)
price, amount, side = data['Data']

# NEW (v1.1.2)
for price, amount, side in data['Data']:  # Now an array
    process_change(price, amount, side)
```

**Trade Updates**:
```python
# OLD (v1.1.1)
price, amount, side, ts = data['Data']

# NEW (v1.1.2)
for price, amount, side, ts in data['Data']:  # Now an array
    process_trade(price, amount, side, ts)
```

---

## Summary

| Component | Status | Version | Details |
|-----------|--------|---------|---------|
| **Public Endpoints** | ✅ Working | v1.1.2 | 3 endpoints: ticker, orderbook, trade |
| **Auth Endpoints** | ✅ Working | v1.1.2 | 3 endpoints: wallets, orders, trades |
| **Format** | ✅ Arrays | v1.1.2 | orderbook/trade return array responses |
| **ClientOrderId** | ✅ Included | v1.1.1 | Added to order/trade updates |
| **Server** | ✅ Live | v1.1.2 | Production ready |

---

**Final Status**: 🚀 **PRODUCTION READY WITH WEBSOCKET**
- All 6 WebSocket endpoints available
- Latest v1.1.2 format supported
- Authentication fully implemented
- Real-time data streaming working

---

**Last Updated**: 2026-03-22
**Official Documentation**: https://docs.lcx.com
**Test Script**: test_websocket.py
**Reference**: WEBSOCKET_API_REFERENCE.md
