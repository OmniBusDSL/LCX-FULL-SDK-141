# LCX DSL Validation & Security Guide

Complete reference for linting, validation, and middleware/hooks system.

---

## Part 1: Linter (Validation Before Execution)

### Overview
The LCX Linter checks DSL files for logical errors **before** code generation, preventing broken code.

### Usage

```bash
# Lint a DSL file
python3 compiler/linter.py examples/market_data.lcx

# Lint all examples
for file in examples/*.lcx; do
  python3 compiler/linter.py "$file"
done
```

### Validation Rules

| Rule | Code | Level | Example |
|------|------|-------|---------|
| Invalid operation declaration | LCX001 | Error | `operation BuyOrders:` ✅ vs `operation BuyOrders` ❌ |
| Invalid endpoint format | LCX002 | Error | `endpoint: GET /api/orders` ✅ vs `endpoint: GET orders` ❌ |
| Invalid HTTP method | LCX003 | Error | `method: GET` ✅ vs `method: FETCH` ❌ |
| BUY/SELL requires amount | LCX004 | Error | `BUY amount: 100` ✅ vs just `BUY` ❌ |
| Missing colon in control flow | LCX005 | Warning | `loop i in items:` ✅ vs `loop i in items` ⚠️ |

### Error vs Warning

- **ERRORS**: Block execution (critical issues)
- **WARNINGS**: Allow execution but indicate potential issues

### Example Output

```
[LINTER REPORT] Found 1 issues:

ERRORS (1):
  Line 15: [LCX004] BUY/SELL requires amount or size parameter

WARNINGS (0):
```

---

## Part 2: JSON Schema Validation

### Schema Location
`compiler/lcx_schema.json`

### Features
- ✅ Operation name validation (alphanumeric + underscore)
- ✅ Endpoint format validation (must start with `/`)
- ✅ HTTP method enforcement (GET, POST, PUT, DELETE, PATCH)
- ✅ Input parameter validation
- ✅ Required field checking
- ✅ Enum validation (auth, output, action)

### Schema Structure

```json
{
  "operations": [
    {
      "name": "OperationName",      // Required: alphanumeric + underscore
      "endpoint": "/api/path",      // Required: starts with /
      "method": "GET",              // Required: valid HTTP method
      "input": ["param1", "param2"],// Optional: parameter list
      "output": "json",             // Optional: json|print|save
      "auth": "required",           // Optional: none|required
      "action": "BUY",              // Optional: BUY|SELL|CANCEL|BALANCE
      "amount": 100                 // Required if action is BUY/SELL
    }
  ]
}
```

---

## Part 3: Middleware & Hooks System

### Overview
Middleware allows injecting logic **before/after** operations for logging, security, auditing.

### Available Hooks

#### 1. LoggingHook - Transaction Logging
Automatically logs all operations and transactions to file.

```python
from compiler.middleware import LoggingHook, HookManager

hook = LoggingHook(log_file="lcx_transactions.log")
manager = HookManager()
manager.register(hook)
```

**Features:**
- Logs operation start/completion
- Records transaction details (timestamp, endpoint, method, status)
- Maintains transaction history
- Generates summary reports

**Log File Format (JSON):**
```json
{
  "timestamp": "2026-03-22T14:30:45.123456",
  "operation": "BuyCrypto",
  "endpoint": "/api/orders",
  "method": "POST",
  "status": "success"
}
```

**Example:**
```python
hook = LoggingHook("trading_log.log")
summary = hook.export_summary()
# Output:
# {
#   "total_operations": 150,
#   "successful": 147,
#   "failed": 3,
#   "success_rate": "98.0%"
# }
```

#### 2. SecurityHook - Safety Limits
Enforces transaction limits and safety checks.

```python
from compiler.middleware import SecurityHook

hook = SecurityHook(
    max_transaction_amount=10000,    # Max per trade
    max_daily_amount=50000           # Max per day
)
manager.register(hook)
```

**Features:**
- ✅ Transaction amount limits
- ✅ Daily spending limits
- ✅ Automatic cancellation of oversized orders
- ✅ Daily reset at midnight

**Security Checks:**
```python
# Blocks if transaction > max_transaction_amount
# Blocks if daily_spent + transaction > max_daily_amount
# Logs all security decisions
```

#### 3. AuditHook - Compliance Logging
Logs all operations for compliance and audit trails.

```python
from compiler.middleware import AuditHook

hook = AuditHook(audit_file="lcx_audit.log")
manager.register(hook)
```

**Features:**
- Logs operation start/completion
- Records user (system) and timestamp
- Maintains compliance trail
- JSON format for easy parsing

**Audit Entry:**
```json
{
  "timestamp": "2026-03-22T14:30:45.123456",
  "event": "operation_started",
  "operation": "BuyCrypto",
  "user": "system",
  "details": {
    "endpoint": "/api/orders",
    "method": "POST",
    "action": "BUY",
    "auth_required": true
  }
}
```

---

## Usage Examples

### Complete Setup with All Hooks

```python
from compiler.middleware import create_default_hooks

# Create manager with all hooks
manager = create_default_hooks(
    enable_logging=True,
    enable_security=True,
    enable_audit=True
)

# Execute operation
operation = {
    'name': 'BuyCrypto',
    'endpoint': '/api/orders',
    'method': 'POST',
    'action': 'BUY',
    'amount': 5000
}

# Run hooks
if manager.before_operation(operation):
    try:
        # Execute actual operation
        result = api_call()
        manager.after_operation(operation, result)
    except Exception as e:
        manager.on_error(operation, e)
```

### Custom Hook

```python
from compiler.middleware import Hook

class NotificationHook(Hook):
    """Send alerts on specific operations"""

    def before_operation(self, operation):
        if operation.get('amount', 0) > 5000:
            self.logger.warning(f"Large transaction: {operation}")
            # send_email_alert()
        return True

    def on_error(self, operation, error):
        self.logger.critical(f"Operation failed: {error}")
        # send_emergency_alert()

manager.register(NotificationHook("notifications"))
```

---

## Workflow: Complete Validation Chain

```
DSL File
   ↓
[1] Syntax Check (Linter)
   ├─ Operation names valid?
   ├─ Endpoints valid?
   ├─ Methods valid?
   └─ Required parameters present?
   ↓
[2] Schema Validation
   ├─ JSON structure valid?
   ├─ Required fields present?
   └─ Enum values valid?
   ↓
[3] Code Generation
   ↓
[4] Pre-Execution Hooks (before_operation)
   ├─ Security check: Amount within limits?
   ├─ Audit: Log operation?
   └─ Custom checks?
   ↓
[5] Execute Operation
   ↓
[6] Post-Execution Hooks (after_operation)
   ├─ Logging: Record transaction
   ├─ Audit: Log completion
   └─ Notifications?
   ↓
[7] Result
```

---

## Error Codes Reference

| Code | Severity | Issue | Fix |
|------|----------|-------|-----|
| LCX001 | Error | Invalid operation syntax | Add colon: `operation Name:` |
| LCX002 | Error | Invalid endpoint | Use: `endpoint: /api/path` |
| LCX003 | Error | Invalid HTTP method | Use: GET, POST, PUT, DELETE, PATCH |
| LCX004 | Error | BUY/SELL without amount | Add `amount: 100` |
| LCX005 | Warning | Missing colon in control flow | Add `:` after keyword |

---

## Best Practices

### 1. Always Lint Before Execution
```bash
python3 compiler/linter.py file.lcx && \
  lcx-cli compile file.lcx --lang python
```

### 2. Enable Security Hooks for Trading
```python
manager = create_default_hooks(enable_security=True)
```

### 3. Monitor Audit Logs
```bash
# View recent transactions
tail -f lcx_transactions.log | jq '.'

# View audit trail
tail -f lcx_audit.log | jq '.'
```

### 4. Review Security Decisions
```bash
# Find blocked transactions
grep '"SECURITY"' lcx_transactions.log
```

---

## Performance Impact

| Component | Overhead | Impact |
|-----------|----------|--------|
| Linting | <100ms | Minimal |
| Schema Validation | <50ms | Negligible |
| Logging Hook | <10ms | Very low |
| Security Hook | <5ms | Very low |
| Audit Hook | <10ms | Very low |

---

## File Locations

| Component | Location |
|-----------|----------|
| Linter | `compiler/linter.py` |
| Schema | `compiler/lcx_schema.json` |
| Middleware | `compiler/middleware.py` |
| Transaction Log | `lcx_transactions.log` |
| Audit Log | `lcx_audit.log` |

---

## Troubleshooting

**"Invalid endpoint" error but endpoint looks correct?**
- Ensure endpoint starts with `/`
- Check for extra spaces

**Security hook blocks legitimate trades?**
- Increase `max_transaction_amount` or `max_daily_amount`
- Check daily reset timing

**Missing logs?**
- Verify hook is registered with `manager.register()`
- Check file permissions for log files
- Ensure `before_operation()` is called

**Performance slow?**
- Disable unnecessary hooks
- Use async logging for large volumes
- Consider batch operations

