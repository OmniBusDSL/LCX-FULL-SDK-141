# LCX DSL - VS Code Extension

Professional IDE support for the LCX Domain-Specific Language with syntax highlighting, autocomplete, and error checking.

## Features

### ✨ Syntax Highlighting
- Color-coded keywords, methods, and endpoints
- Proper indentation for control flow structures
- Comment support

**Colors:**
- Keywords (operation, loop, if, try): Blue
- HTTP Methods (GET, POST, PUT, DELETE): Green
- Actions (BUY, SELL, BALANCE): Red
- Endpoints (/api/...): Purple
- Strings and numbers: Standard colors

### 🎯 Autocomplete
Intelligent suggestions for:
- **Keywords**: operation, loop, if, else, try, catch, finally
- **HTTP Methods**: GET, POST, PUT, DELETE
- **Endpoints**: /api/tickers, /api/pairs, /api/book, /api/trades, /v1/market/kline
- **Properties**: endpoint, input, output, auth
- **Actions**: BUY, SELL, BALANCE, CANCEL

Trigger autocomplete with:
- `/` for endpoints
- Space for keywords
- `:` for properties

### ⚠️ Error Detection
Real-time error checking for:
- Missing colons after keywords
- Unknown endpoints (warnings)
- Syntax validation

### 📖 Hover Documentation
Hover over keywords to see documentation:
```
GET     → HTTP GET request - Retrieve data
POST    → HTTP POST request - Create/Submit data
PUT     → HTTP PUT request - Update data
DELETE  → HTTP DELETE request - Remove data
operation → Define an API operation
loop    → Loop control structure
if      → Conditional statement
```

---

## Installation

### From VS Code Marketplace
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X / Cmd+Shift+X)
3. Search for "LCX DSL"
4. Click Install

### Manual Installation (Development)
```bash
cd vscode-extension
npm install
npm run build
code --install-extension .
```

---

## Usage

### Create LCX Files
Create a file with `.lcx` extension:
```bash
market_data.lcx
trading_operations.lcx
place_order.lcx
```

### Syntax Highlighting
File is automatically recognized and syntax highlighted:
```lcx
operation FetchTickers:
  endpoint: /api/tickers
  method: GET
  output: json

operation GetPairData:
  endpoint: /api/pair
  method: GET
  input: pair
  output: json
```

### Autocomplete (Ctrl+Space)
- Type `/` to get endpoint suggestions
- Type `GET`, `POST`, etc. for HTTP methods
- Type keywords for control structures

### Error Checking
Errors appear as red squiggles:
- Missing colons → "Missing ':' after keyword"
- Unknown endpoints → "Unknown endpoint: /..."

### Hover Help
Hover over any keyword to see documentation:
```
operation → Define an API operation
endpoint: /api/tickers  ← Hover here for description
```

---

## Supported Constructs

### Operations
```lcx
operation OperationName:
  endpoint: /api/endpoint
  method: GET|POST|PUT|DELETE
  input: param1, param2
  output: json|print|save
  auth: none|required
```

### Control Flow
```lcx
loop i in 1..10:
  # loop body

if condition:
  # then body
else:
  # else body

try:
  # try body
catch:
  # catch body
finally:
  # finally body
```

### Known Endpoints
- `/api/tickers` - All currency tickers
- `/api/pairs` - All trading pairs
- `/api/pair` - Single pair data
- `/api/book` - Order book
- `/api/trades` - Recent trades
- `/v1/market/kline` - Candle data

---

## Troubleshooting

### Extension not activating?
- Ensure file has `.lcx` extension
- Try reloading VS Code (Ctrl+R / Cmd+R)

### Autocomplete not working?
- Press Ctrl+Space to trigger manually
- Check that file has `.lcx` extension
- Verify LSP server is running

### Syntax highlighting wrong?
- Close and reopen the file
- Check that grammar is properly loaded
- Verify `syntaxes/lcx.tmLanguage.json` exists

---

## Contributing

Report issues or suggest features at:
https://github.com/lcx/vscode-extension/issues

---

## License

MIT
