# LCX Exchange API - Endpoint Parameter Fixes

**Date**: 2026-03-22
**Status**: Parameter issues identified and fixed
**Impact**: Critical for successful API integration

---

## 🔧 Parameter Issues Found & Fixed

### Issue 1: GET /v1/market/kline Missing Timestamps ❌→✅

**Problem**:
```bash
# WRONG - Missing "to" parameter
GET /v1/market/kline?pair=LCX/USDC&resolution=1h&from=1234567890&limit=10
# Error: "no to sent"
```

**Fix**:
```bash
# CORRECT - Include both from and to timestamps
GET /v1/market/kline?pair=LCX/USDC&resolution=1h&from=1234567890&to=1234654290&limit=10
```

**Details**:
- `from`: Start timestamp (unix seconds)
- `to`: End timestamp (unix seconds)
- `resolution`: "1m", "5m", "15m", "1h", "4h", "1d"
- `limit`: Optional, max candles to return

---

### Issue 2: Offset Starts at 1, Not 0 ❌→✅

**Problem**:
```bash
# WRONG - offset=0 causes error
GET /api/open?offset=0
GET /api/orderHistory?offset=0
GET /api/uHistory?offset=0
# Error: "offset should be greater than 0"
```

**Fix**:
```bash
# CORRECT - offset must be >= 1
GET /api/open?offset=1
GET /api/orderHistory?offset=1
GET /api/uHistory?offset=1
```

**Details**:
- Offset is 1-indexed (not 0-indexed)
- Start with `offset=1` for first page
- Increment by 50 or desired batch size for pagination

---

### Issue 3: PUT /api/modify Missing Parameters ❌→✅

**Problem**:
```json
// WRONG - Missing required fields
PUT /api/modify
{
  "orderId": "uuid",
  "Price": 2
}
// Error: "Invalid input data"
```

**Fix**:
```json
// CORRECT - Include all required order fields
PUT /api/modify
{
  "OrderId": "uuid",
  "Price": 2,
  "Amount": 20,
  "OrderType": "LIMIT",
  "Side": "SELL"
}
```

**Details**:
- `OrderId`: Use uppercase O
- `Price`: New price
- `Amount`: Order amount
- `OrderType`: "LIMIT" or "MARKET"
- `Side`: "SELL" or "BUY"

---

### Issue 4: GET /api/order Missing OrderId Parameter ❌→✅

**Problem**:
```bash
# WRONG - No OrderId provided
GET /api/order
# Error: "OrderId is required"
```

**Fix**:
```bash
# CORRECT - Provide OrderId as query parameter
GET /api/order?orderId=0d6d3671-06a7-4061-b19c-159167edb0fc
```

**Details**:
- Parameter name: `orderId` (lowercase o)
- Use valid OrderId from POST /api/create
- Note: This endpoint may not be fully implemented

---

## 📊 Complete Parameter Reference

### Market Data Endpoints

```
GET /api/tickers
  Parameters: None
  Query String: /api/tickers

GET /api/ticker
  Parameters: pair (required)
  Query String: /api/ticker?pair=LCX/USDC

GET /api/pairs
  Parameters: None
  Query String: /api/pairs

GET /api/pair
  Parameters: pair (required)
  Query String: /api/pair?pair=LCX/USDC

GET /api/book
  Parameters: pair (required)
  Query String: /api/book?pair=LCX/USDC

GET /api/trades
  Parameters: pair (required), offset (required)
  Query String: /api/trades?pair=LCX/USDC&offset=1

GET /v1/market/kline
  Parameters: pair, resolution, from, to (all required), limit (optional)
  Query String: /v1/market/kline?pair=LCX/USDC&resolution=1h&from=1234567890&to=1234654290&limit=100
```

### Account Endpoints

```
GET /api/balances
  Parameters: None (Authenticated)
  Query String: /api/balances

GET /api/balance
  Parameters: coin (required)
  Query String: /api/balance?coin=LCX
```

### Trading Endpoints

```
POST /api/create
  Parameters: Pair, Amount, Price, OrderType, Side (all in JSON body)
  Body: {
    "Pair": "LCX/USDC",
    "Amount": 20,
    "Price": 1,
    "OrderType": "LIMIT",
    "Side": "SELL"
  }

GET /api/open
  Parameters: offset (required, >= 1)
  Query String: /api/open?offset=1

GET /api/orderHistory
  Parameters: offset (required, >= 1)
  Query String: /api/orderHistory?offset=1

GET /api/uHistory
  Parameters: offset (required, >= 1)
  Query String: /api/uHistory?offset=1

DELETE /api/cancel
  Parameters: orderId (required)
  Query String: /api/cancel?orderId=0d6d3671-06a7-4061-b19c-159167edb0fc

GET /api/order
  Parameters: orderId (required)
  Query String: /api/order?orderId=0d6d3671-06a7-4061-b19c-159167edb0fc

PUT /api/modify
  Parameters: OrderId, Price, Amount, OrderType, Side (all in JSON body)
  Body: {
    "OrderId": "0d6d3671-06a7-4061-b19c-159167edb0fc",
    "Price": 2,
    "Amount": 20,
    "OrderType": "LIMIT",
    "Side": "SELL"
  }
```

---

## ✅ Testing with Fixed Parameters

### Before Fixes (58.8% success)
```
Passed: 10/17
Failed: 6 endpoints due to parameter issues
```

### After Fixes (Projected 76%+ success)
```
✅ GET /v1/market/kline - Will pass with from/to params
✅ GET /api/open - Will pass with offset=1
✅ GET /api/orderHistory - Will pass with offset=1
✅ GET /api/uHistory - Will pass with offset=1
✅ GET /api/order - Will accept with orderId param
⚠️  PUT /api/modify - May still fail (not fully implemented)
❌ DELETE /order/cancel-all - Still 404 (doesn't exist)
```

---

## 🧪 Test with Fixed Script

```bash
# Run updated test script with fixes
python3 test_all_endpoints.py --api-key YOUR_KEY --api-secret YOUR_SECRET --verbose

# Expected results:
# Market Data: 7/7 (100%)
# Account: 2/2 (100%)
# Trading: 5-6/8 (62-75%)
```

---

## 📝 Critical Parameter Rules

| Parameter | Rule | Example |
|-----------|------|---------|
| `offset` | Must be >= 1 (1-indexed) | offset=1, not offset=0 |
| `orderId` | Lowercase, UUID format | orderId=0d6d3671-06a7-4061-b19c-159167edb0fc |
| `OrderId` | Uppercase (in PUT body) | "OrderId": "uuid" |
| `pair` | Format: SYMBOL/SYMBOL | pair=LCX/USDC |
| `coin` | Uppercase symbol | coin=LCX |
| `from`/`to` | Unix timestamps (seconds) | from=1234567890, to=1234654290 |
| `resolution` | Candle interval | resolution=1h |
| `Pair` | Format with uppercase | "Pair": "LCX/USDC" |
| `Amount` | Positive number | "Amount": 20 |
| `Price` | Positive decimal | "Price": 1.0 |
| `OrderType` | LIMIT or MARKET | "OrderType": "LIMIT" |
| `Side` | SELL or BUY | "Side": "SELL" |

---

## 🔗 Related Files

- [test_all_endpoints.py](test_all_endpoints.py) - Updated testing script with fixes
- [PROBLEM_ENDPOINTS.md](PROBLEM_ENDPOINTS.md) - Original endpoint issues
- [QUICK_TEST_GUIDE.md](QUICK_TEST_GUIDE.md) - Testing guide
- [LCX/ValidEndPoints/README.md](LCX/ValidEndPoints/README.md) - Full documentation

---

**Last Updated**: 2026-03-22
**Status**: Parameter fixes implemented
**Next**: Retest with corrected parameters
