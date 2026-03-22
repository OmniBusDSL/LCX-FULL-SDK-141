# LCX Exchange API - Endpoint Status Report
**Date:** 2026-03-22
**Status:** 14/17 REST Endpoints Working (82%)
**Server:** http://localhost:3030

---

## Executive Summary

✅ **14 of 17 REST endpoints are fully functional**
❌ **3 endpoints have limitations** (GET /api/order, PUT /api/modify, DELETE /order/cancel-all)
🔵 **6 WebSocket endpoints** available for real-time subscriptions

---

## Working Endpoints (14/17 - 82%)

### Market Data API (7/7 - 100%) ✅
- `GET /api/tickers` - Get all market tickers
- `GET /api/ticker` - Get specific ticker by pair
- `GET /api/pairs` - Get all trading pairs
- `GET /api/pair` - Get specific pair info
- `GET /api/book` - Get order book data
- `GET /api/trades` - Get recent trades
- `GET /v1/market/kline` - Get candlestick/kline data

### Account API (2/2 - 100%) ✅
- `GET /api/balances` - Get all account balances
- `GET /api/balance` - Get specific coin balance (requires coin param)

### Trading API (5/8 - 62.5%) ⚠️
**Working:**
- `POST /api/create` - Create LIMIT orders (LCX/USDC verified)
- `GET /api/open` - Get all open orders
- `GET /api/orderHistory` - Get order history
- `GET /api/uHistory` - Get user trade history
- `DELETE /api/cancel` - Cancel order (uses lowercase `orderId` query param)

**Limited/Not Working:**
- `GET /api/order` - Returns "Order not found" (API limitation)
- `PUT /api/modify` - Returns "Order not found" (API limitation)
- `DELETE /order/cancel-all` - 404 Not Found

---

## Known Issues & Limitations

### 1. GET /api/order - Order Retrieval Issue
**Status:** ❌ Not Retrievable Individually
- Orders can be created successfully with `/api/create`
- Orders appear in `/api/open` list
- But `/api/order` returns "Order not found" even with valid OrderId
- **Workaround:** Use `GET /api/open` to list orders instead

### 2. PUT /api/modify - Order Modification Issue
**Status:** ❌ Cannot Modify Orders
- Returns "Order not found" even with valid OrderId
- Possible API limitation or scope restriction
- **Workaround:** Cancel and recreate order with new parameters

### 3. DELETE /order/cancel-all - Endpoint Missing
**Status:** ❌ 404 Not Found
- Endpoint does not exist on the API
- May be deprecated or not implemented
- **Workaround:** Cancel orders individually with `/api/cancel`

---

## Parameter Specifications

### POST /api/create
```javascript
{
  "Pair": "LCX/USDC",      // Only verified pair
  "Amount": 20,             // Number of units
  "Price": 1.0,             // Unit price
  "OrderType": "LIMIT",     // LIMIT or MARKET
  "Side": "SELL"            // SELL or BUY
}
```

### DELETE /api/cancel
**Important:** Uses lowercase `orderId` query parameter (NOT `OrderId`)
```
DELETE /api/cancel?orderId=ORDER_UUID
```

### Authentication
All private endpoints require HMAC-SHA256 authentication:
```
Headers:
  x-access-key: API_KEY
  x-access-sign: SIGNATURE
  x-access-timestamp: TIMESTAMP_MS
  API-VERSION: 1.1.0
```

Signature calculation:
```javascript
requestString = METHOD + ENDPOINT + JSON.stringify(payload)
signature = base64(HMAC-SHA256(requestString, API_SECRET))
```

---

## WebSocket Endpoints (6 Available)

### Public (Market Data)
- `POST /subscribeTicker` - Real-time ticker updates
- `POST /subscribeOrderbook` - Real-time orderbook updates
- `POST /subscribeTrade` - Real-time trade updates

### Private (Account Data)
- `POST /api/auth/ws` - Wallet updates (requires auth)
- `POST /api/auth/ws` - Order updates (requires auth)
- `POST /api/auth/ws` - Trade updates (requires auth)

---

## Testing Results

| Endpoint | Method | Status | Notes |
|----------|--------|--------|-------|
| /api/tickers | GET | ✅ PASS | |
| /api/ticker | GET | ✅ PASS | Requires pair param |
| /api/pairs | GET | ✅ PASS | |
| /api/pair | GET | ✅ PASS | Requires pair param |
| /api/book | GET | ✅ PASS | Requires pair param |
| /api/trades | GET | ✅ PASS | Requires pair param |
| /v1/market/kline | GET | ✅ PASS | Different base URL |
| /api/balances | GET | ✅ PASS | Auth required |
| /api/balance | GET | ✅ PASS | Auth + coin param |
| /api/create | POST | ✅ PASS | LCX/USDC LIMIT orders |
| /api/open | GET | ✅ PASS | Auth required |
| /api/orderHistory | GET | ✅ PASS | Auth required |
| /api/uHistory | GET | ✅ PASS | Auth required |
| /api/order | GET | ❌ FAIL | Order not found |
| /api/cancel | DELETE | ✅ PASS | Use lowercase orderId |
| /api/modify | PUT | ❌ FAIL | Order not found |
| /order/cancel-all | DELETE | ❌ FAIL | 404 Not Found |

---

## Performance Metrics

| Metric | Value |
|--------|-------|
| Avg Response Time | 350-500ms |
| Successful Endpoints | 14/17 (82%) |
| Market API Success | 7/7 (100%) |
| Account API Success | 2/2 (100%) |
| Trading API Success | 5/8 (62%) |
| Rate Limit (Market) | 25 req/sec |
| Rate Limit (Trading) | 5 req/sec |

---

## Recommendations

### For Full Trading Support
1. Use `GET /api/open` to list orders (instead of GET /api/order)
2. Use `DELETE /api/cancel` with lowercase `orderId` parameter
3. Cancel and recreate orders to modify them (instead of PUT /api/modify)
4. Do not attempt DELETE /order/cancel-all (endpoint doesn't exist)

### For Production Deployment
- ✅ All market data endpoints are production-ready
- ✅ Account API is production-ready
- ✅ Order creation is production-ready
- ✅ Order cancellation is production-ready
- ⚠️ Consider account scope limitations on order retrieval/modification APIs

---

## Dashboard Access

- **Main:** http://localhost:3030
- **All Endpoints:** http://localhost:3030/all-endpoints
- **Visual Editor:** http://localhost:3030/visual
- **Health:** http://localhost:3030/health

---

## API Documentation References

- Official LCX Docs: https://docs.lcx.com
- API Base URL: https://exchange-api.lcx.com
- Kline API: https://api-kline.lcx.com
- API Version: 1.1.0
