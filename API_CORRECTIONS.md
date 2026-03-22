# API Documentation Corrections

**Date**: 2026-03-22
**Source**: https://docs.lcx.com/

## Corrections from Official Documentation

### 1. DELETE /order/cancel-all - Uses `orderIds` Array

**Previous Understanding**: Endpoint doesn't exist (404)

**Official Documentation**: 
- Endpoint EXISTS and is fully implemented
- **Parameter**: `orderIds` (array of strings, NOT single orderId)
- **Max orders**: 25 per request
- **Authorization**: Required

**Fix Applied**:
```python
# CORRECT
DELETE /order/cancel-all
{
  "orderIds": ["0d6d3671-06a7-4061-b19c-159167edb0fc", "uuid2", ...]
}

# WRONG (was trying single orderId)
DELETE /order/cancel-all?orderId=UUID  # ❌ This doesn't work
```

---

### 2. PUT /api/modify - Requires Amount + Price

**Official Documentation**: 
- **Endpoint**: PUT /api/modify
- **Required Parameters**:
  - `OrderId` (string): Must be an open order ID
  - `Amount` (float): New amount value
  - `Price` (float): New price in quote currency
- **Authorization**: Required

**Requirements**:
- Can only modify OPEN orders (not partial/filled)
- Price limits still apply (e.g., < 0.0675 for LCX/USDC)

**Correct Format**:
```python
PUT /api/modify
{
  "OrderId": "0d6d3671-06a7-4061-b19c-159167edb0fc",
  "Amount": 25,      # New amount
  "Price": 0.05      # New price (must be < 0.0675 for LCX/USDC)
}
```

---

### 3. GET /api/order - Fully Documented

**Official Documentation**:
- **Purpose**: Retrieve detailed order information
- **Parameter**: `orderId` (required)
- **Returns**: Order details (pair, price, amount, side, status, fill%)
- **Authorization**: Required

**Correct Usage**:
```bash
GET /api/order?orderId=0d6d3671-06a7-4061-b19c-159167edb0fc
```

---

## ✅ Updated Success Expectations

With documentation corrections:

| Endpoint | Previous | Corrected | Status |
|----------|----------|-----------|--------|
| GET /api/order | ❌ Not Impl | ✅ Implemented | Should work |
| PUT /api/modify | ❌ Price error | ✅ With Amount+Price | Should work |
| DELETE /order/cancel-all | ❌ 404 Not Found | ✅ Uses orderIds array | Should work |

**New Expected Success Rate**: 16/17 (94%)

---

## 📚 References

- Official Docs: https://docs.lcx.com/
- Section: Introduction & API Endpoints
- All parameters and requirements officially documented
