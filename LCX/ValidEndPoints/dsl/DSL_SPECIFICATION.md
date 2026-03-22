# LCX Universal DSL (Domain Specific Language)

**A simple, human-readable language to define LCX API interactions that compiles to 77 programming languages**

## Overview

The LCX DSL is a universal, text-based language for describing API interactions with the LCX Exchange API. Write once in `.lcx` format, compile to any of 77 languages automatically.

```
# Simple example - Get Tickers
endpoint: GET /api/tickers
auth: required
output: print response
```

Compiles to:
- Python, JavaScript, Java, Go, TypeScript, C#, Rust, PHP, and 69 more languages

## Design Principles

1. **Human-Readable** - Plain English-like syntax
2. **Universal** - Language-agnostic, compile to anything
3. **Simple** - Learn in 5 minutes
4. **Powerful** - Support complex workflows
5. **Consistent** - Same syntax for all operations

## Language Syntax

### File Format
- Extension: `.lcx` or `.bus`
- Encoding: UTF-8
- Line-based: Each statement on new line

### Basic Structure

```
# Comment
operation_name:
  endpoint: METHOD /path
  auth: required|optional|none
  input: var1, var2
  output: format
  [additional properties]
```

## Core Operations

### 1. CALL - API Endpoint Call

```
GetTickers:
  endpoint: GET /api/tickers
  auth: optional
  output: print

GetBalance:
  endpoint: GET /api/account/balance
  auth: required
  output: json
```

### 2. SET - Variable Assignment

```
SetKey:
  set: api_key = "your-key"
  set: api_secret = "your-secret"
```

### 3. IF - Conditional Logic

```
CheckBalance:
  endpoint: GET /api/account/balance
  auth: required
  if: response.balance > 100
    then: print "High balance!"
    else: print "Low balance"
```

### 4. LOOP - Iteration

```
FetchAllPairs:
  loop: pair in pairs_list
    endpoint: GET /api/pair/{pair}
    output: store result
```

### 5. SEQUENCE - Multiple Operations

```
CompleteOrder:
  sequence:
    1. endpoint: POST /api/trading/order/create
       input: symbol, quantity, price
       output: save order_id
    2. endpoint: GET /api/trading/order/{order_id}
       output: print
    3. if: response.status == "filled"
         then: notify "Order filled!"
```

## Data Types

```
string: "text"
number: 123
float: 123.45
boolean: true|false
array: [item1, item2]
object: {key: value}
null: null
```

## Built-in Variables

```
request.headers    - HTTP headers
request.body       - Request body
response.status    - HTTP status code
response.body      - Response body
response.data      - Parsed JSON data
timestamp          - Current timestamp
random()           - Random value
env(VAR_NAME)      - Environment variable
```

## Authentication

```
# No auth
auth: none

# Optional authentication
auth: optional
  header: x-access-key
  header: x-access-sign
  header: x-access-timestamp

# Required authentication (automatic HMAC-SHA256)
auth: required
  key: $API_KEY
  secret: $API_SECRET
```

## Output Formats

```
output: print              # Print to console
output: json               # Return as JSON
output: object             # Return as object/dict
output: save var_name      # Save to variable
output: file filename      # Save to file
output: log                # Log to file
```

## Examples

### Example 1: Get Market Data

```
# Get all tickers and print
FetchMarketData:
  endpoint: GET /api/tickers
  auth: optional
  output: print
```

### Example 2: Authenticated Trading

```
# Create an order with authentication
CreateOrder:
  endpoint: POST /api/trading/order/create
  auth: required
    key: $API_KEY
    secret: $API_SECRET
  input: symbol, quantity, price
  output: json
```

### Example 3: Complex Workflow

```
CompleteTrading:
  sequence:
    # 1. Get balance
    1. GetBalance:
         endpoint: GET /api/account/balance
         auth: required
         output: save balance

    # 2. Check if we have enough funds
    2. if: balance.available > price * quantity
         then:
           # Create order
           3. CreateOrder:
                endpoint: POST /api/trading/order/create
                auth: required
                input: symbol, quantity, price
                output: save order
           # Monitor order
           4. MonitorOrder:
                loop: i in range(10)
                  endpoint: GET /api/trading/order/{order.id}
                  auth: required
                  output: print
                  if: response.status == "filled"
                    then: break
         else:
           print "Insufficient funds"
```

### Example 4: Error Handling

```
SafeOrder:
  try:
    endpoint: POST /api/trading/order/create
    auth: required
    input: symbol, quantity, price
    output: save order
  catch: error
    print "Error: " + error.message
    notify error.message
```

## Compilation Targets

The DSL compiler generates code for:

**Primary Languages (27):**
Python, JavaScript, Java, Go, PHP, TypeScript, C#, Rust, Kotlin, Swift, Ruby, Scala, Dart, C, Perl, Bash, Clojure, Crystal, Elixir, Groovy, Lua, Nim, Objective-C, PowerShell, Julia, Ada, Zig

**Server Frameworks (68):**
FastAPI, Flask, Express, Gin, Spring Boot, ASP.NET, Rocket, Rails, Laravel, and 59 more

## File Structure

```
my_api_flow.lcx:
  - Comments start with #
  - Operations defined with operation_name:
  - Properties indented with 2 spaces
  - One statement per line
```

## Keywords

**Control Flow:**
- `if`, `then`, `else`
- `try`, `catch`
- `loop`, `for`, `while`
- `sequence`, `parallel`
- `break`, `continue`

**Data:**
- `set`, `input`, `output`
- `endpoint`, `auth`
- `save`, `store`, `load`

**Operations:**
- `print`, `log`, `notify`
- `request`, `response`
- `send`, `receive`

## Best Practices

1. **Use descriptive names:**
   ```
   ✓ GetUserBalance
   ✓ CreateMarketOrder
   ✗ op1, op2
   ```

2. **Comment complex logic:**
   ```
   # Get user balance and check if sufficient for order
   CheckFunds:
     endpoint: GET /api/account/balance
   ```

3. **Handle errors:**
   ```
   SafeCall:
     try:
       endpoint: GET /api/ticker/BTC
     catch: NotFound
       print "Ticker not found"
   ```

4. **Use variables:**
   ```
   set: symbol = "BTC"
   set: quantity = 1.5
   endpoint: POST /api/trading/order/create
   input: symbol, quantity
   ```

## Compiler Usage

```bash
# Compile to Python
lcx-compiler my_flow.lcx --target python

# Compile to JavaScript
lcx-compiler my_flow.lcx --target javascript

# Compile to all 27 languages
lcx-compiler my_flow.lcx --target all

# Compile with options
lcx-compiler my_flow.lcx --target go --output my_flow.go --beautify
```

## Example Flow Files

See `examples/` directory for complete working examples:
- `examples/market_data.lcx` - Fetch market information
- `examples/place_order.lcx` - Create and monitor order
- `examples/trading_bot.lcx` - Automated trading flow
- `examples/portfolio_manager.lcx` - Manage portfolio

---

**Next Steps:**
1. Learn the syntax (read this document)
2. Look at examples in `examples/`
3. Write your first `.lcx` file
4. Compile it with `lcx-compiler`
5. Use the generated code
