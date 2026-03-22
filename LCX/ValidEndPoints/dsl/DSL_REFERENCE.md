# LCX DSL (Domain Specific Language) Reference

## Overview

The LCX DSL is a text-based language for defining API workflows that can be compiled to 27 programming languages. It provides a simple, declarative syntax for describing API operations and their compositions.

## Supported File Extension

- `.lcx` - LCX DSL source files

## Basic Syntax

### Single Operation

The simplest operation definition:

```lcx
OperationName:
  endpoint: METHOD /api/path
  auth: none|required
  input: param1, param2
  output: print|json|save variable_name
```

### Fields

| Field | Type | Required | Values | Description |
|-------|------|----------|--------|-------------|
| `endpoint` | string | Yes | `GET\|POST\|PUT\|DELETE\|WS` | HTTP method and API path |
| `auth` | enum | Yes | `none\|required` | Authentication requirement |
| `input` | list | No | comma-separated names | Input parameters |
| `output` | enum+var | Yes | `print\|json\|save var_name\|stream\|process\|connection` | How to handle response |

## Output Types

| Output | Usage | Effect |
|--------|-------|--------|
| `print` | `output: print` | Print response to stdout (with JSON formatting) |
| `json` | `output: json` | Return response as JSON (no output) |
| `save` | `output: save var_name` | Store response in variable for later use |
| `stream` | `output: stream` | WebSocket stream (for WS endpoints) |
| `process` | `output: process` | Process streaming data |
| `connection` | `output: connection` | WebSocket connection handle |

## Operation Examples

### GET Request (No Parameters)

```lcx
FetchAllPairs:
  endpoint: GET /api/pairs
  auth: none
  output: print
```

Generates:
- Python: `def fetch_all_pairs(): ...`
- JavaScript: `async function fetchAllPairs() { ... }`

### GET Request (With Parameters)

```lcx
GetOrderBook:
  endpoint: GET /api/book
  auth: none
  input: pair
  output: print
```

Generates:
- Python: `def get_order_book(pair): ...` (pair becomes query parameter)
- JavaScript: `async function getOrderBook(pair) { ... }`

### POST Request (Authenticated)

```lcx
PlaceBuyOrder:
  endpoint: POST /api/order
  auth: required
  input: pair, amount, price
  output: json
```

Generates:
- Python: `def place_buy_order(pair, amount, price): ...`
- JavaScript: `async function placeBuyOrder(pair, amount, price) { ... }`

### WebSocket Subscription

```lcx
SubscribeTickerStream:
  endpoint: WS /ticker
  auth: none
  input: pair, callback
  output: stream
```

## Sequences (Workflows)

Group multiple operations into a workflow with steps:

```lcx
WorkflowName:
  sequence:
    # Step 1: First operation
    1. OperationA:
         endpoint: GET /api/path1
         auth: none
         output: save result1

    # Step 2: Second operation
    2. OperationB:
         endpoint: POST /api/path2
         auth: required
         input: result1
         output: save result2

    # Step 3: Print summary
    3. print "Results: " + result1 + result2
```

## Features

### ✓ Currently Supported

- Single API operations (GET, POST, PUT, DELETE)
- Sequences (multi-step workflows)
- Authentication (required/none)
- Multiple output formats (print, json, save, stream)
- Input parameters (converted to query params for GET, body for POST)
- Variables and data flow between steps
- Comments (lines starting with `#`)

### ⚠ Planned / Experimental

- **Loops**: Iterate over collections
  ```lcx
  ProcessPairs:
    loop: pair in pairs_list
      endpoint: GET /api/ticker
      input: pair
      output: print
  ```
  *Status*: Parser supports loops, but code generation needs template implementation

- **Conditionals**: Branch based on conditions
  ```lcx
  CheckPrice:
    if: current_price > target_price
      endpoint: POST /api/order
      auth: required
  ```

- **Error Handling**: Catch and handle API errors
  ```lcx
  SafeOperation:
    try:
      endpoint: GET /api/data
    catch:
      output: print "Error occurred"
  ```

## Compilation

### Target Languages (27 supported)

**Core Languages:**
`Python`, `JavaScript`, `Java`, `Go`, `PHP`, `TypeScript`, `C#`, `Rust`, `Kotlin`, `Swift`, `Ruby`, `Scala`, `Dart`, `C`, `Perl`, `Bash`, `Clojure`, `Crystal`, `Elixir`, `Groovy`, `Lua`, `Nim`, `Objective-C`, `PowerShell`, `Julia`, `Ada`, `Zig`

### Command Line

```bash
# Compile to Python
lcx-compile market_data.lcx --target python --output generated.py

# Compile to all languages
lcx-compile market_data.lcx --target all

# Display in stdout
lcx-compile market_data.lcx --target javascript
```

### Web Dashboard

```bash
cd dsl/web
python3 run.py
# Opens http://localhost:5000 with Monaco Editor + all 27 language tabs
```

## Special Cases

### Kline Endpoint (Separate Server)

The kline endpoint is hosted on a different server:

```lcx
GetCandleData:
  endpoint: GET /v1/market/kline
  auth: none
  input: pair, resolution, from_ts, to_ts
  output: print
```

The compiler automatically routes this to `https://api-kline.lcx.com` instead of `https://exchange-api.lcx.com`.

**Important**: Use `from_ts` and `to_ts` (not `from` and `to`) to avoid Python reserved keyword conflicts.

### Parameter Naming

- Query parameters are extracted from function arguments automatically
- For GET requests, all input parameters become query params: `?pair=BTC/USDC&offset=1`
- For POST requests, parameters typically go in the request body (language-specific)

## Best Practices

1. **Operation Names**: Use PascalCase for readability
   ```lcx
   GetBTCPrice:  # Good
   get_btc_price:  # Also works, converted to camelCase
   get-btc-price:  # Bad - special chars removed
   ```

2. **Variable Names**: Use snake_case in save statements
   ```lcx
   output: save ticker_data  # Good
   output: save tickerData  # Works but inconsistent
   ```

3. **Comments**: Document complex workflows
   ```lcx
   # Fetch and process market data
   MarketAnalysis:
     sequence:
       1. FetchTickers:
            endpoint: GET /api/tickers
            auth: none
            output: save all_tickers
   ```

4. **Authentication**: Always mark authenticated endpoints
   ```lcx
   # Public endpoint
   GetPrices:
     auth: none

   # Authenticated endpoint
   PlaceOrder:
     auth: required
   ```

## Error Handling

### Parser Errors

| Error | Cause | Solution |
|-------|-------|----------|
| `Missing endpoint` | No endpoint defined | Add `endpoint: METHOD /path` |
| `Invalid method` | Unsupported HTTP method | Use GET, POST, PUT, DELETE, or WS |
| `Invalid indent` | Incorrect indentation | Use 2 spaces per indent level |

### Compilation Errors

| Error | Cause | Solution |
|-------|-------|----------|
| `Unknown language` | Language not in supported list | Check target language name |
| `Template error` | Missing language template | Report issue or use supported language |

## Examples

### Example 1: Market Data Fetcher

File: `market_data.lcx`
```lcx
# Simple market data operations
FetchAllTickers:
  endpoint: GET /api/tickers
  auth: none
  output: print

GetOrderBook:
  endpoint: GET /api/book
  auth: none
  input: pair
  output: json

# Workflow combining multiple operations
MarketOverview:
  sequence:
    1. FetchTickers:
         endpoint: GET /api/tickers
         auth: none
         output: save tickers

    2. GetBook:
         endpoint: GET /api/book
         auth: none
         input: pair
         output: save book

    3. print "Market data fetched"
```

### Example 2: Trading Workflow

File: `authenticated_trading.lcx`
```lcx
CheckBalance:
  endpoint: GET /api/balance
  auth: required
  input: asset
  output: json

PlaceOrder:
  endpoint: POST /api/order
  auth: required
  input: pair, amount, price
  output: save order_response

TradingWorkflow:
  sequence:
    1. GetBalance:
         endpoint: GET /api/balance
         auth: required
         input: BTC
         output: save btc_balance

    2. PlaceBuy:
         endpoint: POST /api/order
         auth: required
         input: BTC/USDC, 0.5, 40000
         output: save order_id

    3. print "Traded: " + btc_balance
```

### Example 3: Real-Time Streams

File: `websocket_streams.lcx`
```lcx
SubscribePrice:
  endpoint: WS /ticker
  auth: none
  input: pair
  output: stream

RealTimeMonitor:
  sequence:
    1. ConnectWebSocket:
         endpoint: WS /connect
         auth: none
         output: connection

    2. ListenTicker:
         endpoint: WS /ticker
         auth: none
         input: BTC/USDC
         output: stream

    3. ProcessUpdates:
         output: process
```

## Architecture

### Pipeline

```
DSL Source (.lcx)
    ↓
[Parser] → JSON AST
    ↓
[Template Renderer] → Target Language Code
    ↓
Generated Code (.py, .js, .go, ...)
```

### File Structure

```
dsl/
├── compiler/
│   ├── parser.py           # Regex-based DSL parser
│   ├── templates.py        # Code generation templates (27 languages)
│   ├── cli.py              # Command-line interface
│   ├── lcx_compiler.py     # Main compiler logic
│   └── test_compiler.py    # Compiler pipeline test
├── examples/
│   ├── market_data.lcx     # Basic market data operations
│   ├── market_data_dynamic.lcx  # Using sequences
│   ├── websocket_streams.lcx    # WebSocket examples
│   └── authenticated_trading.lcx # Trading operations
├── web/
│   ├── server.py           # Flask API + CORS
│   ├── index.html          # Monaco Editor dashboard
│   └── run.py              # Start web server
├── tests/
│   ├── test_live_api.py    # Test real LCX API (6/6 passing)
│   └── test_generated_code.py  # Test generated Python (4/4 passing)
└── DSL_REFERENCE.md        # This file
```

## Testing

### Test Generated Code

```bash
cd dsl
python3 tests/test_generated_code.py
# Results: 4/4 tests passed (fetch_all_tickers, fetch_all_pairs, get_order_book, get_recent_trades)
```

### Test Real API

```bash
cd dsl
python3 tests/test_live_api.py
# Results: 6/6 endpoints working (tickers, pairs, pair, book, trades, kline)
```

## Contributing

### Adding Loop Support

To enable loop code generation:

1. Update `templates.py` to add loop templates for each language
2. Modify `render_operation()` to handle `LoopBlock` in operation body
3. Test generated code with `market_data_dynamic.lcx`

Example loop template (Python):
```python
'loop': '''for {loop_var} in {loop_collection}:
    # loop body
    {loop_body}
'''
```

### Adding New Languages

1. Add language entry to `LANGUAGE_TEMPLATES` dict in `templates.py`
2. Provide templates for: `imports`, `GET`, `POST`, `PUT`, `DELETE`, `auth_required`, `output_print`, `output_json`
3. Test compilation: `python3 test_compiler.py`
4. Update `test_compiler.py` with new language in `languages` list

## Status

### ✅ Production Ready
- DSL parsing (sequences, operations)
- Code generation (27 languages)
- Web dashboard
- API validation (6/6 public endpoints working)
- Generated code validation (4/4 functions working)

### 🚧 In Development
- Loop code generation (parser ready, templates needed)
- Conditional (if/else) support
- Error handling (try/catch)
- Server stub generation

### 📋 Planned
- Interactive DSL builder
- Visual workflow designer
- SDK package generation
- CI/CD integration templates

## Support

For issues, questions, or contributions:
- Check this reference guide first
- Review examples in `dsl/examples/`
- Run tests: `test_live_api.py`, `test_generated_code.py`
- Check compiler errors: `test_compiler.py`
