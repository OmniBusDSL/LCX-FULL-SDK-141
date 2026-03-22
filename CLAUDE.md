# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **reference and documentation repository** containing:

1. **Programming Languages Reference** (`list.txt`) - A comprehensive list of 90 programming languages with descriptions in Romanian, covering modern languages (Python, JavaScript, TypeScript, Go, Rust) to historical/niche languages (COBOL, Fortran, Assembly)

2. **Infrastructure Tool Registry** (`1000_tool_registry_categories.txt`) - Categorization of tool registry items related to infrastructure management, optimization, compatibility, and other system management concerns

3. **LCX Exchange API Documentation** (`LCX/ValidEndPoints/`) - Complete API reference for LCX Exchange (cryptocurrency trading platform) with:
   - API v1.1.0 documentation in multiple formats (.rst, .adoc, plain text)
   - Python utility script for extracting request samples from API documentation

## Key Files and Directories

- `list.txt` - 90 programming languages reference (Romanian)
- `1000_tool_registry_categories.txt` - Infrastructure tool categories
- `LCX/ValidEndPoints/Extrage request samples din documentația LCX API.py` - Python utility to scrape and extract API request samples by language and endpoint
- `LCX/ValidEndPoints/*.rst` / `*.adoc` / `*` - API documentation files (ReStructuredText, AsciiDoc, and plain text formats)

## Running Python Utilities

The primary Python utility is in `LCX/ValidEndPoints/`:

```bash
# Extract request samples from LCX API documentation
cd "LCX/ValidEndPoints"
python3 "Extrage request samples din documentația LCX API.py"
```

**Requirements**: The script uses `requests` and `beautifulsoup4` libraries
```bash
pip install requests beautifulsoup4
```

## Structure Notes

- **Not a traditional software project** - No build system, test framework, or package manager setup
- **No automated build/test pipeline** - This is a reference repository for documentation and language information
- **Single Python utility** - The main code artifact is the API documentation scraper script
- **Documentation-first** - Content is organized primarily as reference materials and API specifications

## SDK Generation for LCX Exchange API

This repository also contains scripts for generating **Client SDKs and Server Stubs** for the LCX Exchange API across **40+ programming languages**.

### Scripts Available

- **generate_sdks_clean.py** - Main script to generate SDKs for all supported languages
  - Supports 40+ Client SDK generators (Python, Java, Go, TypeScript, C#, PHP, Rust, Swift, Kotlin, etc.)
  - Supports 10+ Server stub generators (Node.js Express, Python FastAPI, Java Spring Boot, etc.)
  - Parallel generation with 3 concurrent workers
  - Auto-detects openapi-generator-cli JAR or CLI tool
  - Generates HTML report with success/failure status

### Running SDK Generation

```bash
cd LCX/ValidEndPoints
python3 generate_sdks_clean.py
```

Results will be in `generated_sdks/` directory with structure:
```
generated_sdks/
├── client_python/          # Python SDK
├── client_java/            # Java SDK
├── client_typescript/      # TypeScript SDK
├── server_nodejs_express/  # Node.js Server Stubs
└── ... (40+ more)
```

### Generated SDK Usage

Each SDK includes:
- Type-safe API client classes
- Complete model/schema classes
- LCX authentication (HMAC-SHA256 signing)
- Language-specific build configs (Maven, npm, pip, cargo, etc.)
- Full API documentation and examples

## LCX DSL Compiler & Testing Dashboard

The repository includes a **DSL-based compiler** for the LCX Exchange API that generates code in 77+ programming languages:

### Running the Dashboard

```bash
cd LCX/ValidEndPoints/dsl
PORT=3030 node web/app.js
```

Access at: **http://localhost:3030**

### Endpoints

- **Main:** http://localhost:3030 - DSL Compiler & 77-language code generator
- **All Endpoints:** http://localhost:3030/all-endpoints - Complete API testing dashboard (14/17 REST + 6 WebSocket)
- **Visual Editor:** http://localhost:3030/visual - Drag-and-drop workflow builder (generates .lcx DSL)
- **Health:** http://localhost:3030/health - Server health check

### Endpoint Status (Latest Testing)

**Working:** 14/17 REST Endpoints (82%)
- Market API: 7/7 (100%)
- Account API: 2/2 (100%)
- Trading API: 5/8 (62.5%)
  - ✅ POST /api/create (LCX/USDC LIMIT orders)
  - ✅ GET /api/open, /api/orderHistory, /api/uHistory
  - ✅ DELETE /api/cancel (uses lowercase `orderId` query param)
  - ❌ GET /api/order (Order not found)
  - ❌ PUT /api/modify (Order not found)
  - ❌ DELETE /order/cancel-all (404 Not Found)

**WebSocket:** 6 endpoints available for real-time subscriptions

See `ENDPOINT_STATUS_REPORT.md` for detailed analysis and recommendations.

### Key Testing Scripts

```bash
# Test order creation and dependent endpoints
python3 test_complete_flow.py

# Test parameter format variants
python3 test_parameter_variants.py

# Direct API testing (bypasses proxy)
python3 test_create_order.py
```

### Important Notes for Developers

- **HMAC Signature:** `METHOD + ENDPOINT + JSON.stringify(payload)`
- **GET requests:** Signature uses empty `{}` for payload
- **Parameters:** Some endpoints use lowercase parameter names (e.g., `orderId` not `OrderId`)
- **Rate Limits:** 25 req/sec (market), 5 req/sec (trading)
- **Authentication:** All private endpoints require `x-access-key`, `x-access-sign`, `x-access-timestamp` headers

## When Working in This Repository

Since this is primarily a documentation/reference repository:
- Focus on updating and organizing reference materials
- When modifying Python utilities, test with Python 3
- Maintain consistency in formatting across documentation files
- Keep language descriptions concise and technically accurate
- Update file lists when adding new language or category references
- SDK generation requires `openapi-generator-cli` v7.20.0+ (auto-detected from JAR)
- For DSL dashboard work: Node.js and Python 3 required, runs on port 3030
