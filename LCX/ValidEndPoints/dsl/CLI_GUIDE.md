# LCX DSL Compiler - CLI Guide

## Installation

### Global Install (Recommended)
```bash
cd dsl/
pip install -e .
```

This installs `lcx-cli` as a global command available from anywhere.

### Local Usage (Without Installation)
```bash
python3 cli/lcx_cli.py compile examples/market_data.lcx --lang python
```

---

## Commands

### 1. Compile LCX to Code
```bash
lcx-cli compile <file.lcx> --lang <language> [--output <file>]
```

**Examples:**
```bash
# Compile to Python (auto-detect filename)
lcx-cli compile market_data.lcx --lang python

# Compile to JavaScript with custom output
lcx-cli compile market_data.lcx --lang javascript -o dist/api.js

# Compile to Rust
lcx-cli compile trading_operations.lcx --lang rust

# Compile to Solidity
lcx-cli compile place_order.lcx --lang solidity
```

### 2. Run Compiled Code
```bash
lcx-cli run <file.lcx> [runtime]
```

**Examples:**
```bash
# Compile and run with Python
lcx-cli run market_data.lcx python

# Compile and run with Node.js
lcx-cli run market_data.lcx node
```

### 3. List Supported Languages
```bash
lcx-cli languages
```

**Output:**
```
[LCX DSL Supported Languages (77 total)]

Web          : python, javascript, typescript, php, ruby
Systems      : go, rust, c, cpp
JVM          : java, kotlin, scala, clojure, groovy
.NET         : csharp, vbnet
Functional   : haskell, lisp, scheme, racket, elm, purescript
Other        : abap, ada, agda, assembly, ats, bash, cobol, ... (47 more)
```

---

## Supported Languages (77 Total)

### Tier 1: Full Support (Templates + Control Flow)
- Python, JavaScript, TypeScript, Go, Java, C#, Rust

### Tier 2: Generated Support  
- PHP, Ruby, C, C++, Kotlin, Swift, Scala, and 50+ more

---

## Workflow Examples

### Generate Trading API in Multiple Languages
```bash
# Python
lcx-cli compile trading_operations.lcx --lang python -o python_api.py

# JavaScript  
lcx-cli compile trading_operations.lcx --lang javascript -o js_api.js

# Go
lcx-cli compile trading_operations.lcx --lang go -o api.go

# All in one folder
mkdir -p dist
lcx-cli compile trading_operations.lcx --lang python -o dist/api.py
lcx-cli compile trading_operations.lcx --lang javascript -o dist/api.js
lcx-cli compile trading_operations.lcx --lang rust -o dist/main.rs
```

### Execute Generated Code
```bash
# Create executable Python script
lcx-cli compile market_data.lcx --lang python -o get_data.py
python3 get_data.py

# Create Node.js script
lcx-cli compile market_data.lcx --lang javascript -o get_data.js
node get_data.js
```

---

## Tips

1. **Check Language Support**
   ```bash
   lcx-cli languages
   ```

2. **Use Custom Output Paths**
   ```bash
   lcx-cli compile file.lcx --lang python -o src/generated/api.py
   ```

3. **Batch Compile to Multiple Languages**
   ```bash
   for lang in python javascript typescript go rust; do
     lcx-cli compile market_data.lcx --lang $lang
   done
   ```

4. **Pipe to Other Tools**
   ```bash
   lcx-cli compile market_data.lcx --lang python | head -50
   ```

---

## Troubleshooting

### "lcx-cli: command not found"
Install globally first:
```bash
pip install -e .
```

### "Unsupported language"
Check available languages:
```bash
lcx-cli languages
```

### "Parse failed"
Check DSL syntax in your `.lcx` file. Common issues:
- Missing colons after operation names
- Incorrect endpoint format
- Typos in keywords (GET, POST, BUY, SELL, etc.)

---

## Output Files

Generated files are created in the current directory with appropriate extensions:
- Python: `.py`
- JavaScript: `.js`
- TypeScript: `.ts`
- Go: `.go`
- Java: `.java`
- Rust: `.rs`
- C#: `.cs`
- C++: `.cpp`
- Solidity: `.solidity`
- And 67 more...

