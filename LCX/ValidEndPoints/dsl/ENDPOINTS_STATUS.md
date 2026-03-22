# LCX Exchange API Endpoints Testing Status

**Total Endpoints: 17** | **Working: 8** | **In Progress: 9**

## ✅ VERIFIED WORKING ENDPOINTS (8)

### Public Market Data (7)
1. **GET /api/tickers** ✅
   - Returns all market tickers
   - No parameters required
   - Status: FULLY WORKING

2. **GET /api/ticker** ✅
   - Returns specific ticker
   - Parameters: pair
   - Status: FULLY WORKING

3. **GET /api/pairs** ✅
   - Returns all trading pairs
   - No parameters required
   - Status: FULLY WORKING

4. **GET /api/pair** ✅
   - Returns specific pair info
   - Parameters: pair
   - Status: FULLY WORKING

5. **GET /api/book** ✅
   - Returns order book
   - Parameters: pair
   - Status: FULLY WORKING

6. **GET /api/trades** ✅
   - Returns recent trades
   - Parameters: pair, offset
   - Status: FULLY WORKING

7. **GET /v1/market/kline** ✅
   - Returns candle/kline data
   - Base URL: api-kline.lcx.com
   - Parameters: pair, resolution, from, to
   - Status: FULLY WORKING

### Private Account (1)
8. **GET /api/balances** ✅
   - Returns all account balances
   - Requires: API key + secret
   - Authentication: HMAC-SHA256
   - Signature format: `GET/api/balances{}`
   - Status: FULLY WORKING

---

## 🔄 IN PROGRESS / INVESTIGATION NEEDED (9)

### Private Account (1)
- **GET /api/balance** - Requires ?coin parameter
  - Issue: Signature mismatch with parameters
  - Expected: HTTP 200 with balance data
  - Current: HTTP 500 "Signature not matched"

### Private Trading (8)
- **POST /api/create** - Create order
  - Issue: Invalid input data / parameter format
  - Expected body: OrderType, Pair, Side, Price, Amount
  - Current: HTTP 400 "Invalid input data"

- **GET /api/open** - Get open orders
  - Issue: Signature mismatch
  - Parameters: offset (required)
  - Current: HTTP 500 "Signature not matched"

- **GET /api/order** - Get order details
  - Issue: Signature mismatch
  - Parameters: id (required)
  - Current: HTTP 500 "Signature not matched"

- **GET /api/orderHistory** - Get order history
  - Issue: Signature mismatch
  - Parameters: offset (required)
  - Current: HTTP 500 "Signature not matched"

- **GET /api/uHistory** - Get user history
  - Issue: Signature mismatch
  - Parameters: offset (required)
  - Current: HTTP 500 "Signature not matched"

- **DELETE /api/cancel** - Cancel order
  - Issue: Signature mismatch / body format
  - Parameters: id (required)
  - Current: HTTP 500 "Signature not matched"

- **PUT /api/modify** - Modify order
  - Issue: Signature mismatch / body format
  - Parameters: id, Price
  - Current: HTTP 500 "Signature not matched"

- **DELETE /order/cancel-all** - Cancel all orders
  - Issue: Signature mismatch / body format
  - Current: HTTP 500 "Signature not matched"

---

## Authentication Details

### HMAC-SHA256 Signature Format
```javascript
// For GET endpoints with parameters:
requestString = METHOD + ENDPOINT + {} (empty object for signature)
signature = HMAC-SHA256(requestString, apiSecret)
```

### Headers
```
x-access-key: <API_KEY>
x-access-sign: <BASE64_SIGNATURE>
x-access-timestamp: <MILLISECONDS>
API-VERSION: 1.1.0
Content-Type: application/json
```

---

## Next Steps
1. Verify parameter formats for POST/PUT/DELETE endpoints
2. Test signature calculation with actual parameter values
3. Validate response payload structure with official docs
4. Add rate limiting handlers (5 req/sec for trading API)

## Testing Interface
- **Public Testing**: http://localhost:3032/all-endpoints
- **Visual Editor**: http://localhost:3032/visual
- **Dashboard**: http://localhost:3032
