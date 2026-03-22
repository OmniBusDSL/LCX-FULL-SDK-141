# Authentication Setup for Private LCX Endpoints

**Quick Start**: 3 steps to use private endpoints (balances, trading, account info)

---

## 🚀 Quick Setup (2 minutes)

### Step 1: Get API Credentials
1. Log in to LCX Exchange website
2. Go: **Settings → API Management → Create New Key**
3. Copy your **API Key** and **API Secret**

### Step 2: Create .env File
```bash
cd dsl
cp .env.example .env
```

Then edit `.env` and add your credentials:
```env
LCX_API_KEY=your_api_key_here
LCX_API_SECRET=your_api_secret_here
```

### Step 3: Test It Works
```bash
python3 load_env.py
# Should output: [OK] API credentials verified!
```

**Done!** You can now use authenticated endpoints.

---

## 📁 Files Created

| File | Purpose |
|------|---------|
| `.env.example` | Template with all environment variables |
| `.env` | Your actual credentials (create by copying example) |
| `.gitignore` | Prevents .env from being committed |
| `load_env.py` | Helper script to load .env file |
| `example_authenticated_usage.py` | Shows how to use authenticated endpoints |
| `AUTH_SETUP.md` | Detailed setup guide |

---

## 🔐 Security

### What Goes in .env?
```env
LCX_API_KEY=abc123xyz...      # Public
LCX_API_SECRET=secret456...   # KEEP SECURE!
```

### Important
- ✅ Store in `.env` file (not in code)
- ✅ Add `.env` to `.gitignore` (already done)
- ✅ Never commit `.env` to git
- ✅ Never share your API Secret
- ✅ Rotate keys periodically

### The .gitignore Already Protects You
```
# .gitignore includes:
.env              ← Your credentials
.env.local        ← Local overrides
.env.*.local      ← Environment-specific
```

---

## 📝 Usage

### Option 1: Load .env Before Running Code (Recommended)
```python
from load_env import load_env

# Load credentials from .env
load_env()

# Now import and use generated code
from generated_authenticated_trading import get_balance
balance = get_balance('BTC')
print(balance)
```

### Option 2: Set Environment Variables Manually
```bash
# Windows (PowerShell)
$env:LCX_API_KEY="your_key"
$env:LCX_API_SECRET="your_secret"
python3 your_script.py

# Linux/Mac (Bash)
export LCX_API_KEY="your_key"
export LCX_API_SECRET="your_secret"
python3 your_script.py
```

### Option 3: Use Generated Code Directly
Generated code automatically reads from environment:
```python
# Generated code does this internally:
api_key = os.getenv('LCX_API_KEY')
api_secret = os.getenv('LCX_API_SECRET')
# ... creates HMAC signature ...
# ... makes authenticated API call ...
```

---

## 💡 DSL Examples

### Public Endpoint (No Auth)
```lcx
GetTickers:
  endpoint: GET /api/tickers
  auth: none        # ← No credentials needed
  output: print
```

### Private Endpoint (Requires Auth)
```lcx
GetBalance:
  endpoint: GET /api/balance
  auth: required    # ← Uses .env credentials
  input: asset
  output: json
```

### Workflow with Both
```lcx
CheckBeforeBuying:
  sequence:
    1. GetPrice:
         endpoint: GET /api/ticker
         auth: none          # Public
         input: BTC/USDC
         output: save price

    2. CheckBalance:
         endpoint: GET /api/balance
         auth: required      # Uses .env
         input: BTC
         output: save balance

    3. print "Price: " + price
       print "Balance: " + balance
```

---

## 🎯 Available Private Endpoints

Once authenticated:

### Account Operations
- `GET /api/account` - Account info
- `GET /api/balances` - All balances
- `GET /api/balance` - Single asset balance
- `GET /api/fees` - Trading fees

### Order Operations
- `GET /api/orders/open` - Open orders
- `GET /api/orders/history` - Order history
- `GET /api/order` - Single order details
- `POST /api/order` - Place order
- `DELETE /api/order` - Cancel order

### See `examples/authenticated_trading.lcx` for full list!

---

## 🔧 Configuration

### .env File Reference
```env
# REQUIRED
LCX_API_KEY=your_api_key
LCX_API_SECRET=your_api_secret

# OPTIONAL (defaults shown)
LCX_API_VERSION=1.1.0
LCX_BASE_URL=https://exchange-api.lcx.com
LCX_KLINE_URL=https://api-kline.lcx.com
LCX_REQUEST_TIMEOUT=10
LCX_DEBUG=false
```

### Default Values
- If not in .env, defaults are used
- See `compiler/templates.py` for defaults
- Can override any variable

---

## ✅ Verification

### Check Setup Works
```bash
# Run this to verify
cd dsl
python3 load_env.py

# Expected output:
# [OK] Loaded X environment variables
# [OK] API credentials verified!
```

### Check Compilation Works
```bash
# Compile authenticated endpoint
cd dsl
python3 compiler/cli.py examples/authenticated_trading.lcx --target python
# → generates: generated_authenticated_trading.py
```

### Check Generated Code Works
```bash
# Run with credentials
python3 << 'PYTHON'
from load_env import load_env
load_env()

# Now test a generated function
# (requires real API key + secret)
PYTHON
```

---

## 🆘 Troubleshooting

### Problem: "No .env file found"
```
Solution: Create it
  cd dsl
  cp .env.example .env
  # Edit .env with your credentials
```

### Problem: "Missing LCX_API_KEY"
```
Solution: Add to .env
  LCX_API_KEY=your_key_from_lcx
```

### Problem: "API Key not found (401)"
```
Solution: Check credentials
  1. Is .env loaded? Run: python3 load_env.py
  2. Are credentials correct? Compare with LCX account
  3. Is key enabled? Check LCX API Management
```

### Problem: "HMAC Signature Invalid"
```
Solution: Verify API Secret
  1. Check spelling in .env
  2. Copy again from LCX (carefully)
  3. Regenerate API key in LCX settings
```

### Problem: "Permission Denied (403)"
```
Solution: Enable permissions
  1. Go to LCX API Management
  2. Edit the API key
  3. Enable required permissions
  4. Save changes
```

---

## 📚 Learn More

| Resource | Link |
|----------|------|
| **DSL Syntax** | `DSL_REFERENCE.md` |
| **Full Auth Guide** | `AUTH_SETUP.md` |
| **Trading Examples** | `examples/authenticated_trading.lcx` |
| **System Status** | `SYSTEM_STATUS.md` |
| **Full Index** | `INDEX.md` |

---

## 🎓 Complete Example

### Create DSL with Authenticated Endpoint
```bash
cat > dsl/examples/check_btc_balance.lcx << 'EOF'
CheckBTCBalance:
  endpoint: GET /api/balance
  auth: required
  input: BTC
  output: json
EOF
```

### Compile to Python
```bash
cd dsl
python3 compiler/cli.py examples/check_btc_balance.lcx --target python
# Generates: generated_check_btc_balance.py
```

### Use the Generated Code
```bash
python3 << 'PYTHON'
from load_env import load_env
load_env()  # Load from .env

from generated_check_btc_balance import check_btc_balance
balance = check_btc_balance('BTC')
print(f"Your BTC balance: {balance}")
PYTHON
```

### Output
```
Your BTC balance: {'asset': 'BTC', 'balance': 0.5, ...}
```

---

## 🛡️ Security Checklist

- [x] `.env` file created
- [x] Credentials added to `.env`
- [x] `.gitignore` prevents git commits
- [x] API key has limited permissions (only what's needed)
- [x] API secret is never logged or exposed
- [x] `.env` is in `.gitignore` (already done)
- [x] No hardcoded credentials in code
- [x] Using environment variables only

---

## ✨ What You Can Now Do

✅ Access your account information
✅ Check balances for any asset
✅ View open orders
✅ Place buy/sell orders
✅ Cancel orders
✅ View trading history
✅ Monitor account status
✅ All in 27 different programming languages!

---

## 🚀 Next Steps

1. **Setup**: Follow Quick Setup above (2 min)
2. **Test**: Run `python3 load_env.py` (30 sec)
3. **Explore**: Look at `examples/authenticated_trading.lcx` (5 min)
4. **Create**: Write your own `.lcx` with `auth: required` (10 min)
5. **Generate**: Compile to your language (10 sec)
6. **Use**: Load .env and run generated code (1 min)

**Total time**: ~20 minutes to have working authenticated trading code in any language!

---

**Status**: ✅ Ready to use authenticated LCX endpoints
