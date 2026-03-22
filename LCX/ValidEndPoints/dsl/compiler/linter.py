#!/usr/bin/env python3
"""
LCX DSL Linter - Validates DSL files for logical and structural errors
"""

import re
from typing import List, Dict, Tuple
from dataclasses import dataclass

@dataclass
class LintError:
    """Linting error/warning"""
    level: str  # 'error' or 'warning'
    line: int
    code: str
    message: str

class LCXLinter:
    """DSL Linter for validation"""

    VALID_METHODS = ['GET', 'POST', 'PUT', 'DELETE', 'PATCH']
    VALID_ACTIONS = ['BUY', 'SELL', 'CANCEL', 'BALANCE']
    TRADING_ACTIONS = ['BUY', 'SELL']

    def __init__(self):
        self.errors: List[LintError] = []

    def lint(self, content: str) -> List[LintError]:
        """Run all linting checks"""
        self.errors = []
        lines = content.split('\n')

        for line_num, line in enumerate(lines, 1):
            stripped = line.strip()

            # Skip comments and empty lines
            if not stripped or stripped.startswith('#'):
                continue

            # Check operation declaration
            if stripped.startswith('operation '):
                self._check_operation_declaration(stripped, line_num)

            # Check endpoint format
            if 'endpoint:' in stripped:
                self._check_endpoint(stripped, line_num)

            # Check method
            if 'method:' in stripped:
                self._check_method(stripped, line_num)

            # Check trading action requires amount
            if any(action in stripped for action in self.TRADING_ACTIONS):
                self._check_buy_sell_has_amount(lines, line_num)

            # Check control flow syntax
            for keyword in ['loop', 'if', 'try']:
                if stripped.startswith(keyword):
                    self._check_control_flow(stripped, keyword, line_num)

        return self.errors

    def _check_operation_declaration(self, line: str, line_num: int):
        """Validate operation declaration"""
        if not re.match(r'operation\s+[A-Za-z_]\w*:', line):
            self.errors.append(LintError('error', line_num, 'LCX001',
                'Invalid operation declaration. Use: operation Name:'))

    def _check_endpoint(self, line: str, line_num: int):
        """Validate endpoint format"""
        # Accept both: endpoint: /api/path or endpoint: METHOD /api/path
        if not re.search(r'endpoint:\s*(?:[A-Z]+\s+)?/[a-zA-Z0-9/_-]*', line):
            self.errors.append(LintError('error', line_num, 'LCX002',
                'Invalid endpoint. Use: endpoint: /api/path or endpoint: GET /api/path'))

    def _check_method(self, line: str, line_num: int):
        """Validate HTTP method"""
        found = any(method in line for method in self.VALID_METHODS)
        if not found:
            methods_str = ', '.join(self.VALID_METHODS)
            self.errors.append(LintError('error', line_num, 'LCX003',
                f'Invalid method. Use one of: {methods_str}'))

    def _check_buy_sell_has_amount(self, lines: List[str], line_num: int):
        """Check BUY/SELL has amount specified"""
        context = '\n'.join(lines[max(0, line_num-5):line_num])

        if 'BUY' in context or 'SELL' in context:
            if 'amount' not in context.lower() and 'size' not in context.lower():
                self.errors.append(LintError('error', line_num, 'LCX004',
                    'BUY/SELL requires amount or size parameter'))

    def _check_control_flow(self, line: str, keyword: str, line_num: int):
        """Check control flow syntax"""
        if not line.endswith(':'):
            self.errors.append(LintError('warning', line_num, 'LCX005',
                f'{keyword.capitalize()} statement should end with colon (:)'))

    def report(self) -> str:
        """Generate report"""
        if not self.errors:
            return "[OK] No linting errors found"

        lines = [f"\n[LINTER REPORT] Found {len(self.errors)} issues:\n"]

        errors = [e for e in self.errors if e.level == 'error']
        warnings = [e for e in self.errors if e.level == 'warning']

        if errors:
            lines.append(f"ERRORS ({len(errors)}):")
            for err in errors:
                lines.append(f"  Line {err.line}: [{err.code}] {err.message}")

        if warnings:
            if errors:
                lines.append("")
            lines.append(f"WARNINGS ({len(warnings)}):")
            for warn in warnings:
                lines.append(f"  Line {warn.line}: [{warn.code}] {warn.message}")

        return "\n".join(lines)

    def has_errors(self) -> bool:
        """Check for errors (not warnings)"""
        return any(e.level == 'error' for e in self.errors)

def lint_file(filepath: str) -> Tuple[bool, str]:
    """Lint a DSL file and return (success, report)"""
    try:
        with open(filepath, 'r') as f:
            content = f.read()

        linter = LCXLinter()
        linter.lint(content)

        return not linter.has_errors(), linter.report()
    except Exception as e:
        return False, f"[ERROR] Failed to read file: {e}"

if __name__ == '__main__':
    import sys
    if len(sys.argv) > 1:
        success, report = lint_file(sys.argv[1])
        print(report)
        sys.exit(0 if success else 1)
