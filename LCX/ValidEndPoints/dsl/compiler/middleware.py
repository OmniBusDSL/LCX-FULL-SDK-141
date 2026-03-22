#!/usr/bin/env python3
"""
LCX DSL Middleware & Hooks System
Allows injecting logic before/after operations: logging, security checks, etc.
"""

import json
import logging
from datetime import datetime
from typing import Dict, Any, Callable, List, Optional
from pathlib import Path

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

class Hook:
    """Base hook class"""

    def __init__(self, name: str):
        self.name = name
        self.logger = logging.getLogger(f"hook.{name}")

    def before_operation(self, operation: Dict[str, Any]) -> bool:
        """Called before operation execution. Return False to cancel"""
        return True

    def after_operation(self, operation: Dict[str, Any], result: Any) -> Any:
        """Called after operation execution"""
        return result

    def on_error(self, operation: Dict[str, Any], error: Exception):
        """Called on operation error"""
        pass

class LoggingHook(Hook):
    """Logging hook - logs all operations and transactions"""

    def __init__(self, log_file: str = "lcx_transactions.log"):
        super().__init__("logging")
        self.log_file = log_file
        self.transactions = []

    def before_operation(self, operation: Dict[str, Any]) -> bool:
        """Log operation start"""
        self.logger.info(f"Starting operation: {operation.get('name', 'unknown')}")
        self.logger.info(f"  Endpoint: {operation.get('endpoint', 'N/A')}")
        self.logger.info(f"  Method: {operation.get('method', 'N/A')}")
        return True

    def after_operation(self, operation: Dict[str, Any], result: Any) -> Any:
        """Log operation completion"""
        self.logger.info(f"Completed operation: {operation.get('name', 'unknown')}")

        # Log transaction
        transaction = {
            "timestamp": datetime.now().isoformat(),
            "operation": operation.get('name'),
            "endpoint": operation.get('endpoint'),
            "method": operation.get('method'),
            "status": "success"
        }
        self.transactions.append(transaction)

        # Write to log file
        self._write_log(transaction)

        return result

    def on_error(self, operation: Dict[str, Any], error: Exception):
        """Log operation error"""
        self.logger.error(f"Error in operation {operation.get('name')}: {error}")

        transaction = {
            "timestamp": datetime.now().isoformat(),
            "operation": operation.get('name'),
            "endpoint": operation.get('endpoint'),
            "method": operation.get('method'),
            "status": "error",
            "error": str(error)
        }
        self.transactions.append(transaction)
        self._write_log(transaction)

    def _write_log(self, transaction: Dict):
        """Write transaction to log file"""
        try:
            with open(self.log_file, 'a') as f:
                f.write(json.dumps(transaction) + '\n')
        except Exception as e:
            self.logger.error(f"Failed to write log: {e}")

    def export_summary(self) -> Dict:
        """Export transaction summary"""
        total = len(self.transactions)
        successful = sum(1 for t in self.transactions if t['status'] == 'success')
        failed = total - successful

        return {
            "total_operations": total,
            "successful": successful,
            "failed": failed,
            "success_rate": f"{(successful / total * 100):.1f}%" if total > 0 else "0%"
        }

class SecurityHook(Hook):
    """Security hook - enforces transaction limits and safety checks"""

    def __init__(self, max_transaction_amount: float = 10000, max_daily_amount: float = 50000):
        super().__init__("security")
        self.max_transaction_amount = max_transaction_amount
        self.max_daily_amount = max_daily_amount
        self.daily_spent = 0
        self.last_check_date = None

    def before_operation(self, operation: Dict[str, Any]) -> bool:
        """Security checks before operation"""
        # Check if it's a trading operation
        if operation.get('action') in ['BUY', 'SELL']:
            amount = operation.get('amount', 0)

            # Check transaction limit
            if amount > self.max_transaction_amount:
                self.logger.error(
                    f"SECURITY: Transaction amount {amount} exceeds limit {self.max_transaction_amount}"
                )
                return False

            # Check daily limit
            today = datetime.now().date()
            if self.last_check_date != today:
                self.daily_spent = 0
                self.last_check_date = today

            if self.daily_spent + amount > self.max_daily_amount:
                self.logger.error(
                    f"SECURITY: Daily limit exceeded. Spent: {self.daily_spent}, "
                    f"Requested: {amount}, Limit: {self.max_daily_amount}"
                )
                return False

            self.logger.warning(
                f"SECURITY: Approving transaction of {amount}. "
                f"Daily spent: {self.daily_spent + amount}/{self.max_daily_amount}"
            )
            self.daily_spent += amount

        return True

    def on_error(self, operation: Dict[str, Any], error: Exception):
        """Log security-related errors"""
        self.logger.error(f"SECURITY: Error in operation {operation.get('name')}: {error}")

class AuditHook(Hook):
    """Audit hook - logs all changes for compliance"""

    def __init__(self, audit_file: str = "lcx_audit.log"):
        super().__init__("audit")
        self.audit_file = audit_file
        self.audit_entries = []

    def before_operation(self, operation: Dict[str, Any]) -> bool:
        """Create audit entry"""
        entry = {
            "timestamp": datetime.now().isoformat(),
            "event": "operation_started",
            "operation": operation.get('name'),
            "user": "system",
            "details": {
                "endpoint": operation.get('endpoint'),
                "method": operation.get('method'),
                "action": operation.get('action'),
                "auth_required": operation.get('auth') == 'required'
            }
        }
        self.audit_entries.append(entry)
        self._write_audit(entry)
        return True

    def after_operation(self, operation: Dict[str, Any], result: Any) -> Any:
        """Log operation completion"""
        entry = {
            "timestamp": datetime.now().isoformat(),
            "event": "operation_completed",
            "operation": operation.get('name'),
            "user": "system",
            "result": "success"
        }
        self.audit_entries.append(entry)
        self._write_audit(entry)
        return result

    def _write_audit(self, entry: Dict):
        """Write audit entry"""
        try:
            with open(self.audit_file, 'a') as f:
                f.write(json.dumps(entry) + '\n')
        except Exception as e:
            self.logger.error(f"Failed to write audit: {e}")

class HookManager:
    """Manages all hooks"""

    def __init__(self):
        self.hooks: List[Hook] = []
        self.logger = logging.getLogger("hooks")

    def register(self, hook: Hook):
        """Register a hook"""
        self.hooks.append(hook)
        self.logger.info(f"Registered hook: {hook.name}")

    def before_operation(self, operation: Dict[str, Any]) -> bool:
        """Run before_operation hooks"""
        for hook in self.hooks:
            if not hook.before_operation(operation):
                self.logger.warning(f"Hook {hook.name} cancelled operation")
                return False
        return True

    def after_operation(self, operation: Dict[str, Any], result: Any) -> Any:
        """Run after_operation hooks"""
        for hook in self.hooks:
            result = hook.after_operation(operation, result)
        return result

    def on_error(self, operation: Dict[str, Any], error: Exception):
        """Run on_error hooks"""
        for hook in self.hooks:
            hook.on_error(operation, error)

def create_default_hooks(enable_logging: bool = True,
                         enable_security: bool = True,
                         enable_audit: bool = True) -> HookManager:
    """Create HookManager with default hooks"""
    manager = HookManager()

    if enable_logging:
        manager.register(LoggingHook())

    if enable_security:
        manager.register(SecurityHook(max_transaction_amount=10000, max_daily_amount=50000))

    if enable_audit:
        manager.register(AuditHook())

    return manager

if __name__ == '__main__':
    # Example usage
    manager = create_default_hooks()

    # Simulate operation
    operation = {
        'name': 'BuyCrypto',
        'endpoint': '/api/orders',
        'method': 'POST',
        'action': 'BUY',
        'amount': 5000
    }

    if manager.before_operation(operation):
        try:
            result = {"status": "success", "order_id": 123}
            manager.after_operation(operation, result)
        except Exception as e:
            manager.on_error(operation, e)
