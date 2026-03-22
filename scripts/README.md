# LCX Exchange API - Generation Scripts

This directory contains Python scripts for generating SDKs, code samples, and documentation for the LCX Exchange API across 145+ languages and frameworks.

## Scripts Overview (in execution order)

### 1. generate_sdks_clean.py
**Purpose:** Generate 145 complete SDKs (77 client + 68 server frameworks)

**Usage:**
```bash
python3 generate_sdks_clean.py
```

**Output:**
- `generated_sdks/` directory with 145 complete SDKs
- Each SDK includes type-safe client classes, models, and authentication
- Supports both client SDKs and server stubs

**Requirements:**
- `openapi-generator-cli` v7.20.0+ (auto-detected from JAR or installed via npm)
- Java runtime for openapi-generator

**Languages/Frameworks:**
- 77 client SDK languages
- 68 server stub frameworks
- ~4,118 total files generated

---

### 2. generate_samples_simple.py
**Purpose:** Generate basic code samples for 12 core endpoints and 6 main languages

**Usage:**
```bash
python3 generate_samples_simple.py
```

**Output:**
- `lcx_samples/` directory with 72 basic code samples
- Simple, executable examples for quick start

**Languages:** Python, Java, Go, TypeScript, C#, PHP

---

### 3. generate_final_samples.py
**Purpose:** Generate production-ready code samples for 23 endpoints and 27 languages

**Usage:**
```bash
python3 generate_final_samples.py
```

**Output:**
- `lcx_samples_final/` directory with 621 code samples
- Complete, practical code with error handling and proper patterns

**Languages:** Python, JavaScript, Java, Go, PHP, TypeScript, C#, Rust, Kotlin, Swift, Ruby, Scala, Dart, C, Perl, Bash, Clojure, Crystal, Elixir, Groovy, Lua, Nim, Objective-C, PowerShell, Julia, Ada, Zig

---

### 4. generate_77language_final_samples.py
**Purpose:** Generate production-ready samples for 23 endpoints and 27 languages (complete version)

**Usage:**
```bash
python3 generate_77language_final_samples.py
```

**Output:**
- `lcx_samples_77language/` directory with 621 code samples
- Same as generate_final_samples.py (27 core languages with full templates)
- Uses lcx_samplesGood/ as reference for code quality

---

### 5. generate_final_html.py
**Purpose:** Generate interactive HTML page with all code samples

**Usage:**
```bash
python3 generate_final_html.py
```

**Output:**
- `lcx_samples.html` (153 KB)
- Interactive interface with:
  - Endpoint navigation tabs
  - Language tabs within each endpoint
  - Syntax highlighting (Highlight.js)
  - Copy-to-clipboard functionality
  - Responsive design

**Features:**
- Shows 23 endpoints
- Shows 27 programming languages
- 621 total code examples
- Dark theme with professional styling

---

### 6. generate_all.py (MASTER SCRIPT)
**Purpose:** Run all generation scripts in sequence

**Usage:**
```bash
python3 generate_all.py
```

**Execution Order:**
1. generate_sdks_clean.py - Generate 145 SDKs
2. generate_samples_simple.py - Generate basic samples
3. generate_final_samples.py - Generate final samples (27 languages)
4. generate_77language_final_samples.py - Generate comprehensive samples
5. generate_final_html.py - Generate interactive HTML

**Output:** Complete project with SDKs and samples

---

### Utility Scripts

**lcx-api-wrapper.py**
- Legacy API documentation extraction utility
- Extracts request samples from OpenAPI specification
- Useful for analyzing API structure

---

## Input Files

All scripts read from or depend on:

- `lcx_samplesGood/` - Reference samples with good code style
  - Used as template source for quality verification
  - Contains 23 endpoints with clean implementations

- `openapi.yaml` or OpenAPI specification file
  - Required by generate_sdks_clean.py
  - Defines API structure and endpoints

---

## Output Directories

| Directory | Contents | Created By |
|-----------|----------|-----------|
| `generated_sdks/` | 145 complete SDKs | generate_sdks_clean.py |
| `lcx_samples/` | 72 basic samples | generate_samples_simple.py |
| `lcx_samples_final/` | 621 samples (27 langs) | generate_final_samples.py |
| `lcx_samples_77language/` | 621 samples (27 langs) | generate_77language_final_samples.py |

---

## Quick Start

**Generate Everything:**
```bash
python3 generate_all.py
```

**Generate Only Code Samples (no SDKs):**
```bash
python3 generate_final_samples.py
python3 generate_final_html.py
```

**Generate Only SDKs:**
```bash
python3 generate_sdks_clean.py
```

---

## Statistics

- **145 Total SDKs**
  - 77 client SDKs
  - 68 server stubs

- **621 Code Examples**
  - 23 API endpoints
  - 27 programming languages

- **Languages Supported** (complete templates):
  Python, JavaScript, Java, Go, PHP, TypeScript, C#, Rust, Kotlin, Swift, Ruby, Scala, Dart, C, Perl, Bash, Clojure, Crystal, Elixir, Groovy, Lua, Nim, Objective-C, PowerShell, Julia, Ada, Zig

---

## Notes

- All scripts use Python 3
- Generated code includes comments and follows language best practices
- HTML page is self-contained and can be shared standalone
- Code samples are production-ready with error handling
