# LCX API Authentication Setup Guide

## Overview

To use authenticated endpoints (trading, balances, account info), you need to:
1. Get API credentials from LCX Exchange
2. Create a `.env` file with your credentials
3. Use `auth: required` in DSL for private endpoints
4. Run generated code with environment variables

---

## Step 1: Get API Credentials from LCX

### On LCX Exchange Website
1. Log in to your LCX account
2. Go to **Settings → API Management**
3. Click **Create New Key**
4. Configure permissions:
   - ✅ View Account
   - ✅ View Orders
   - ✅ Create Orders
   - ✅ Cancel Orders
   - (Choose what you need)
5. **Copy and save**:
   - API Key (public)
   - API Secret (KEEP SECURE!)

### Security Note
- Never share your API Secret
- Never commit `.env` to git
- Store credentials in environment variables only
- Rotate keys periodically

---

## Step 2: Create `.env` File

### Option A: Copy from template
```bash
cd dsl
cp .env.example .env
```

### Option B: Create manually
```bash
cat > dsl/.env << 'EOF'
LCX_API_KEY=your_api_key_from_lcx
LCX_API_SECRET=your_api_secret_from_lcx
LCX_API_VERSION=1.1.0
LCX_BASE_URL=https://exchange-api.lcx.com
LCX_KLINE_URL=https://api-kline.lcx.com
LCX_REQUEST_TIMEOUT=10
LCX_DEBUG=false
EOF
```

Replace with your actual credentials from LCX.

### File Location
```
dsl/
├── .env                  ← Your secrets (DO NOT COMMIT)
├── .env.example          ← Template (safe to commit)
└── .gitignore            ← Ignores .env file
```

---

## Step 3: Use in DSL Files

### Public Endpoint (No Auth)
```lcx
GetTickers:
  endpoint: GET /api/tickers
  auth: none          # ← Public
  output: print
```

### Private Endpoint (Requires Auth)
```lcx
GetBalance:
  endpoint: GET /api/balance
  auth: required      # ← Reads from .env
  input: asset
  output: json
```

### Example: Trading Workflow with Auth
```lcx
TradingWorkflow:
  sequence:
    # Public endpoint - no auth needed
    1. GetPrice:
         endpoint: GET /api/ticker
         auth: none
         input: BTC/USDC
         output: save price

    # Private endpoint - uses .env credentials
    2. CheckBalance:
         endpoint: GET /api/balance
         auth: required
         input: BTC
         output: save balance

    3. print "Price: " + price + " Balance: " + balance
```

---

## Step 4: Run Generated Code

### Option 1: Load .env in Python

```python
import os
from dotenv import load_dotenv

# Load .env file
load_dotenv('dsl/.env')

# Now run generated code
from generated_market_data import get_balance

balance = get_balance('BTC')
print(balance)
```

### Option 2: Set Environment Variables Directly

**Windows (PowerShell)**:
```powershell
$env:LCX_API_KEY="your_key"
$env:LCX_API_SECRET="your_secret"
python3 generated_market_data.py
```

**Linux/Mac (Bash)**:
```bash
export LCX_API_KEY="your_key"
export LCX_API_SECRET="your_secret"
python3 generated_market_data.py
```

### Option 3: Use Generated Code Directly

The generated code reads from environment:
```python
# generated_market_data.py
def get_balance(asset):
    api_key = os.getenv('LCX_API_KEY')        # ← Reads from .env
    api_secret = os.getenv('LCX_API_SECRET')  # ← Reads from .env

    # Generate HMAC signature
    # Make API call with auth headers
    # Return results
```

No need to pass credentials to functions!

---

## Complete Workflow Example

### 1. Create DSL file
```bash
cat > dsl/examples/my_account.lcx << 'EOF'
MyAccountInfo:
  sequence:
    1. GetAccount:
         endpoint: GET /api/account
         auth: required
         output: save account

    2. GetBalances:
         endpoint: GET /api/balances
         auth: required
         output: save balances

    3. print "Account: " + account
       print "Balances: " + balances
EOF
```

### 2. Compile DSL
```bash
cd dsl
python3 compiler/cli.py examples/my_account.lcx --target python --output my_account.py
```

### 3. Set environment
```bash
# Option A: Load from .env
python3 << 'PYTHON'
import os
from dotenv import load_dotenv
load_dotenv('.env')

import my_account
# Call functions - they use env vars automatically
PYTHON

# Option B: Set vars directly
export LCX_API_KEY="your_key"
export LCX_API_SECRET="your_secret"
python3 my_account.py
```

---

## Available Private Endpoints

Once you have auth set up, you can use:

### Account Endpoints
```lcx
GetAccountInfo:
  endpoint: GET /api/account
  auth: required
  output: json

GetBalances:
  endpoint: GET /api/balances
  auth: required
  output: json

GetAssetBalance:
  endpoint: GET /api/balance
  auth: required
  input: asset
  output: json
```

### Order Endpoints
```lcx
GetOpenOrders:
  endpoint: GET /api/orders/open
  auth: required
  input: pair
  output: json

PlaceOrder:
  endpoint: POST /api/order
  auth: required
  input: pair, amount, price
  output: json

CancelOrder:
  endpoint: DELETE /api/order
  auth: required
  input: order_id
  output: json
```

### See authenticated_trading.lcx for more examples!

---

## Troubleshooting

### Error: "Missing LCX_API_KEY"
**Problem**: .env file not loaded
**Solution**:
```bash
# Check .env exists
ls -la dsl/.env

# Check values are set
echo $LCX_API_KEY

# Reload .env
source dsl/.env  # or: export $(cat dsl/.env | xargs)
```

### Error: "Invalid API Key"
**Problem**: Wrong credentials
**Solution**:
1. Check you copied from LCX correctly
2. Verify .env file has correct values
3. Generate new API key in LCX settings

### Error: "HMAC Signature Invalid"
**Problem**: API Secret is wrong or timestamp issue
**Solution**:
1. Double-check API Secret (copy carefully)
2. Ensure server time is synchronized
3. Try with fresh API key

### Error: "Permission Denied"
**Problem**: API key doesn't have required permissions
**Solution**:
1. Go to LCX API Management
2. Edit key → Enable permissions
3. Save and try again

---

## Security Best Practices

### ✅ DO
- [x] Store credentials in `.env` file
- [x] Add `.env` to `.gitignore`
- [x] Use environment variables
- [x] Rotate keys regularly
- [x] Limit API key permissions
- [x] Use read-only keys when possible
- [x] Monitor API key usage

### ❌ DON'T
- [ ] Hardcode API keys in code
- [ ] Commit `.env` to git
- [ ] Share API Secret with anyone
- [ ] Use old/inactive API keys
- [ ] Give excessive permissions
- [ ] Log credentials to files
- [ ] Use same key for multiple apps

---

## Environment Variables Reference

| Variable | Required | Example | Purpose |
|----------|----------|---------|---------|
| `LCX_API_KEY` | ✅ Yes | `abc123xyz` | API Key from LCX |
| `LCX_API_SECRET` | ✅ Yes | `secret456` | API Secret (KEEP SAFE) |
| `LCX_API_VERSION` | No | `1.1.0` | API version |
| `LCX_BASE_URL` | No | `https://...` | API endpoint URL |
| `LCX_KLINE_URL` | No | `https://...` | Kline endpoint URL |
| `LCX_REQUEST_TIMEOUT` | No | `10` | Request timeout (seconds) |
| `LCX_DEBUG` | No | `true\|false` | Debug logging |

---

## Next Steps

1. **Get API Key**: Go to LCX → Settings → API Management
2. **Create .env**: `cp .env.example .env` + add credentials
3. **Update DSL**: Add `auth: required` to private endpoints
4. **Compile**: `python3 compiler/cli.py myfile.lcx --target python`
5. **Run**: Load .env and execute generated code

---

## Example: Complete Authenticated Trading

See `examples/authenticated_trading.lcx` for full example:
```bash
cat dsl/examples/authenticated_trading.lcx
```

This file shows:
- ✅ Account queries
- ✅ Balance checking
- ✅ Order placement
- ✅ Order cancellation
- ✅ Complete trading workflow

Compile and use with your credentials:
```bash
cd dsl
python3 compiler/cli.py examples/authenticated_trading.lcx --target python
# → generates: generated_authenticated_trading.py
```

---

## Support

**For API issues**: Check [LCX API Documentation](https://api.lcx.com)
**For DSL syntax**: See `DSL_REFERENCE.md`
**For authentication**: See this file or examples/authenticated_trading.lcx

---

**Security Note**: Never share your `.env` file or API Secret. Use `.env` only locally.
