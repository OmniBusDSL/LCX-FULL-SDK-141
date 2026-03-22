# LCX Opcodes (Operation Codes)

**Low-level bytecode format for ultra-fast API interactions**

## Overview

While DSL is human-readable and powerful, Opcodes provide an ultra-lightweight, binary-safe format for:
- **Network transmission** - Tiny packets over wire
- **Storage efficiency** - Minimal disk/memory footprint
- **Performance** - Direct execution without parsing
- **Embedded systems** - IoT and embedded devices

## Opcode Format

Each instruction is a number or short code:

```
[opcode, param1, param2, ...payload...]
```

### Example: Get Tickers

**DSL:**
```
GetTickers:
  endpoint: GET /api/market/tickers
  auth: optional
  output: print
```

**Opcode:**
```
[0x01, "GET", "/api/market/tickers", 0x00, 0x02]

Decode:
  0x01 = HTTP_REQUEST
  "GET" = method
  "/api/market/tickers" = endpoint
  0x00 = no auth
  0x02 = print output
```

## Opcode Table

### HTTP Operations
```
0x01 = HTTP_REQUEST (GET/POST/PUT/DELETE)
0x02 = HTTP_STREAM (for WebSocket)
0x03 = HTTP_PARALLEL (multiple requests)
```

### Data Operations
```
0x10 = SET_VARIABLE
0x11 = GET_VARIABLE
0x12 = ASSIGN_EXPRESSION
0x13 = ARRAY_ACCESS
0x14 = OBJECT_ACCESS
```

### Control Flow
```
0x20 = IF_STATEMENT
0x21 = LOOP_FOR
0x22 = LOOP_WHILE
0x23 = TRY_CATCH
0x24 = SEQUENCE
```

### I/O Operations
```
0x30 = PRINT
0x31 = LOG
0x32 = NOTIFY
0x33 = SAVE_FILE
0x34 = LOAD_FILE
```

### Authentication
```
0x40 = AUTH_NONE
0x41 = AUTH_API_KEY
0x42 = AUTH_HMAC_SHA256
0x43 = AUTH_BEARER_TOKEN
```

### Return/Output
```
0x50 = RETURN_JSON
0x51 = RETURN_STRING
0x52 = RETURN_BOOL
0x53 = RETURN_NULL
```

## Opcode Examples

### Example 1: Simple GET Request
```
[
  0x01,                          // HTTP_REQUEST
  "GET",                        // method
  "/api/market/tickers",        // endpoint
  0x40,                         // AUTH_NONE
  0x50                          // RETURN_JSON
]

Compiled size: 5 units (vs 100+ bytes in DSL)
```

### Example 2: Authenticated POST
```
[
  0x01,                          // HTTP_REQUEST
  "POST",                        // method
  "/api/trading/order/create",   // endpoint
  0x42,                          // AUTH_HMAC_SHA256
  {"symbol": "BTC", "qty": 1},   // payload
  0x50                           // RETURN_JSON
]
```

### Example 3: Conditional Sequence
```
[
  0x24,                          // SEQUENCE
  [
    0x01, "GET", "/api/account/balance", 0x42, 0x50,  // Get balance
    0x20,                        // IF_STATEMENT
    "balance > 1000",            // condition
    [0x01, "POST", "/api/trading/order/create", 0x42, 0x50],  // Place order
    [0x31, "Insufficient balance"]  // ELSE: Log
  ]
]
```

## Binary Encoding

Opcodes can be:
- **JSON** - Human-readable, larger
- **Binary** - Ultra-compact, network-optimized
- **Base64** - Text-safe encoding for transmission

### Binary Format Example

```
GET_BALANCE request:
  [0x01, "GET", "/api/balance", 0x42, 0x50]

Binary (hex):
  01 04 474554 13 2f6170692f62616c616e6365 42 50

  01 = HTTP_REQUEST opcode
  04 = 4 bytes for "GET"
  474554 = "GET" in hex
  13 = 19 bytes for path
  2f6170692f62616c616e6365 = "/api/balance" in hex
  42 = AUTH_HMAC_SHA256
  50 = RETURN_JSON
```

## Advantages vs DSL

| Aspect | DSL | Opcodes |
|--------|-----|---------|
| Readability | ✅ Easy | ❌ Hard |
| File size | 100+ bytes | 5-20 bytes |
| Transmission | Large | Tiny |
| Speed | Fast parsing | Direct exec |
| Humans | ✅ Can write | ❌ Cannot |
| Network | Okay | ✅ Excellent |

## Directory Structure (To Be Built)

```
opcodes/
├── README.md                      ← This file
├── OPCODE_SPEC.md                 ← Complete opcode specification
├── encoder.py                     ← Convert JSON → Opcodes
├── decoder.py                     ← Convert Opcodes → JSON
├── interpreter.py                 ← Execute opcodes
├── dsl_to_opcodes.py             ← DSL → Opcodes converter
└── examples/
    ├── simple_get.opcodes         ← Simple GET request
    ├── authenticated_post.opcodes ← With authentication
    ├── conditional_flow.opcodes   ← If/else logic
    └── sequence.opcodes           ← Sequential operations
```

## Use Cases

1. **Mobile Apps** - Send tiny opcode packets instead of full DSL
2. **IoT Devices** - Minimal bandwidth usage
3. **Trading Bots** - Ultra-fast execution without parsing
4. **Blockchain** - Compact transaction data
5. **Microservices** - Efficient inter-service communication

## Workflow

```
DSL File (.lcx)
    ↓ (DSL Parser)
JSON AST
    ↓ (Opcode Encoder)
Binary Opcodes (.opcodes)
    ↓ (Network/Storage)
Opcode Interpreter
    ↓ (Execution)
API Call & Response
```

## Next Steps

- [ ] Implement encoder (JSON → Opcodes)
- [ ] Implement decoder (Opcodes → JSON)
- [ ] Implement interpreter (Execute opcodes)
- [ ] Create DSL → Opcodes converter
- [ ] Add compression
- [ ] Test with examples

---

**Lightweight, efficient, binary-friendly API instruction format for maximum performance.**
