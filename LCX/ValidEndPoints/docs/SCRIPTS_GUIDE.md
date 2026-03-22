# Python Scripts Guide

Documentation for all Python scripts that generate SDKs and code samples for LCX Exchange API.

---

## 1. `generate_sdks_clean.py`

**Purpose**: Generate 141+ production-ready SDKs across 77 programming languages and 68 backend frameworks

**What it does**:
1. Detects available openapi-generator-cli (JAR or CLI)
2. Lists all available client (76) and server (68) generators
3. Generates SDKs in parallel using 3 concurrent workers
4. Skips OpenAPI spec validation (uses `--skip-validate-spec` flag)
5. Creates HTML report with generation statistics
6. Logs detailed information about each generation attempt

**Usage**:
```bash
python3 generate_sdks_clean.py
```

**Output**:
- `generated_sdks/` directory with 145+ subdirectories (one per SDK)
- `generated_sdks/report.html` - Visual dashboard with stats
- `generation_log.txt` - Detailed log for each generator

**Key Features**:
- Auto-detects JAR file (7.20.0 or 7.8.0)
- Parallelization for faster generation
- HTML report generation
- 97.9% success rate (141/144 auto-generated)

**Time**: ~10-15 minutes for full generation

---

## 2. `generate_samples_simple.py`

**Purpose**: Generate basic code sample templates for 12 core endpoints in 6 main programming languages

**What it does**:
1. Creates sample folder structure for 12 LCX API endpoints
2. Generates boilerplate code for each endpoint in: Python, Java, Go, TypeScript, C#, PHP
3. Includes HMAC-SHA256 authentication patterns
4. Creates TODO comments for implementation details

**Usage**:
```bash
python3 generate_samples_simple.py
```

**Output**:
- `lcx_samples/` directory structure with endpoint folders
- 72 code sample files (12 endpoints × 6 languages)
- Each file contains HMAC-SHA256 authentication example

**Endpoints Covered**:
1. `/api/tickers` - Get Tickers
2. `/api/pairs` - Get Pairs
3. `/api/book` - Get OrderBook
4. `/api/trades` - Get Trades
5. `/api/create` - Create Order
6. `/api/cancel` - Cancel Order
7. `/api/modify` - Modify Order
8. `/api/open` - Open Orders
9. `/api/order` - Get Order
10. `/api/orderHistory` - Order History
11. `/api/balances` - Get Balances
12. `/api/balance` - Get Balance

**Sample Output**:
```
[OK] get_tickers/python.py
[OK] get_tickers/java.java
[OK] get_tickers/go.go
... (72 total)
```

**Time**: ~2-5 seconds

---

## 3. `expand_samples_from_sdks.py`

**Purpose**: Expand code samples to cover 26+ additional programming languages using generated SDK templates

**What it does**:
1. Reads list of 26 additional SDK languages (Rust, Swift, Kotlin, Ruby, Scala, etc.)
2. For each endpoint, generates language-specific boilerplate code
3. Creates examples following language conventions
4. Generates 312 additional sample files

**Usage**:
```bash
python3 expand_samples_from_sdks.py
```

**Output**:
- 312 additional code sample files
- Extends `lcx_samples/` with 26 more language samples per endpoint
- Total: 386 sample files across 32 languages

**Languages Added**:
- Ada, Apex, Bash, C, Clojure, Crystal
- Dart, Eiffel, Elixir, Erlang
- Groovy, Haskell, Julia, Kotlin, Lua, Nim
- N4JS, Objective-C, OCaml, Perl, PowerShell, R
- Ruby, Rust, Scala, Swift, Zig (via code samples)

**Sample Output**:
```
[OK] get_tickers/rust.rs
[OK] get_tickers/swift.swift
[OK] get_tickers/kotlin.kt
... (312 total)
```

**Time**: ~10-20 seconds

---

## 4. `lcx-api-wrapper.py`

**Purpose**: Extract code sample snippets from OpenAPI specification's `x-codeSamples` field

**What it does**:
1. Reads `lcx_openapi.json` OpenAPI specification
2. Parses `x-codeSamples` field from each endpoint
3. Extracts code samples and organizes by endpoint + language
4. Saves to `lcx_samples/` directory structure

**Usage**:
```bash
python3 lcx-api-wrapper.py lcx_openapi.json
```

**Note**: This was used earlier in the project; now superseded by `generate_samples_simple.py`

---

## 5. `generate_endpoint_samples.py`

**Purpose**: Advanced script to generate comprehensive endpoint examples (initially created but fixed with `generate_samples_simple.py`)

**Status**: Enhanced version exists as `generate_samples_simple.py`

---

## 6. `generate_all_sdks.py` (Original)

**Purpose**: First iteration of SDK generator (superseded by `generate_sdks_clean.py`)

**What it did**:
- Generated SDKs without `--skip-validate-spec` flag
- Result: ~5% success rate due to OpenAPI validation errors
- Folders created but empty (no code generated)

**Status**: Replaced by improved `generate_sdks_clean.py` with 97.9% success rate

---

## Script Dependency Flow

```
lcx_openapi.json (Input OpenAPI Spec)
         ↓
         └─→ generate_sdks_clean.py
                   ↓
         generated_sdks/ (145 SDKs)

lcx_openapi.json
         ↓
         └─→ generate_samples_simple.py
                   ↓
         lcx_samples/ (72 samples)
                   ↓
         expand_samples_from_sdks.py
                   ↓
         lcx_samples/ (386 samples total)
```

---

## Total Output Summary

| Script | Input | Output | Files | Time |
|--------|-------|--------|-------|------|
| `generate_sdks_clean.py` | OpenAPI spec | 145 SDKs | 4,118 | 10-15m |
| `generate_samples_simple.py` | Hardcoded endpoints | 72 samples | 72 | 2-5s |
| `expand_samples_from_sdks.py` | SDK languages | 312 samples | 312 | 10-20s |
| **Total** | | | **4,502** | **~15m** |

---

## Running All Scripts

```bash
# Full pipeline
python3 generate_sdks_clean.py      # Generate 145 SDKs
python3 generate_samples_simple.py  # Generate 72 basic samples
python3 expand_samples_from_sdks.py # Expand to 32 languages

# Result:
# - 145 production-ready SDKs
# - 386 code examples across 32 languages
# - 4,118 generated SDK files
# - 4,502 total files
```

---

## Key Features of Approach

1. **Parallelization**: Uses ThreadPoolExecutor for concurrent SDK generation
2. **Error Handling**: Continues even if some generators fail
3. **Logging**: Detailed logs for debugging and analysis
4. **HTML Reports**: Visual dashboards of generation results
5. **Language Coverage**: From Ada to Zig - 32+ programming languages
6. **Framework Support**: 68+ backend frameworks

---

## Troubleshooting

### Issue: "openapi-generator-cli not found"
**Solution**: Download JAR from maven central:
```bash
curl -L -o openapi-generator-cli.jar https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/7.20.0/openapi-generator-cli-7.20.0.jar
```

### Issue: Unicode encoding errors (Windows)
**Solution**: Scripts automatically handle by using `[OK]` instead of emojis

### Issue: Some generators fail
**Solution**: Expected - use `--skip-validate-spec` flag. OpenAPI spec has validation issues but code is still generated

---

## Files Generated

```
├── generate_sdks_clean.py           # Main SDK generation
├── generate_samples_simple.py       # Basic samples
├── expand_samples_from_sdks.py      # Extended samples
├── openapi-generator-cli.jar        # JAR v7.20.0
├── lcx_openapi.json                 # OpenAPI specification
├── generated_sdks/                  # 145 SDKs (4,118 files)
├── lcx_samples/                     # 386 code samples
├── generation_log.txt               # Detailed logs
└── README.md                        # This guide
```

---

**Generated**: March 21, 2026
**Total Scripts**: 3 active scripts
**Languages Generated**: 32+ programming languages
**SDKs Generated**: 145 (77 client + 68 server)
