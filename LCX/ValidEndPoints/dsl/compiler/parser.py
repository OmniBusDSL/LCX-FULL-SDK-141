#!/usr/bin/env python3
"""
Simple DSL Parser - Converts .lcx text to JSON AST
Uses regex-based parsing for practicality
"""

import json
import re
from typing import Dict, List, Any, Optional

class DSLParser:
    """Parse .lcx DSL files into JSON AST"""

    def __init__(self):
        self.lines = []
        self.current_line = 0
        self.indent_level = {}

    def parse(self, source: str) -> Dict[str, Any]:
        """Parse DSL source to JSON AST"""
        self.lines = source.strip().split('\n')
        self.current_line = 0

        operations = []
        while self.current_line < len(self.lines):
            raw_line = self.lines[self.current_line]
            line = raw_line.strip()

            # Skip empty lines and comments
            if not line or line.startswith('#'):
                self.current_line += 1
                continue

            # Parse operation (only if line is NOT indented)
            if ':' in line and not raw_line.startswith('  '):
                op = self.parse_operation(line)
                if op:
                    operations.append(op)

            self.current_line += 1

        return {
            'type': 'Program',
            'operations': operations
        }

    def parse_operation(self, line: str) -> Optional[Dict[str, Any]]:
        """Parse single operation definition"""
        name = line.replace(':', '').strip()
        # Remove 'operation ' prefix if present
        if name.startswith('operation '):
            name = name[10:]

        operation = {
            'type': 'Operation',
            'name': name,
            'endpoint': None,
            'method': None,
            'auth': None,
            'input': [],
            'output': None,
            'body': []
        }

        self.current_line += 1

        # Parse operation properties
        while self.current_line < len(self.lines):
            line = self.lines[self.current_line]

            # Check indentation (2 spaces = property)
            if not line.startswith('  '):
                break

            line = line.strip()

            if not line or line.startswith('#'):
                self.current_line += 1
                continue

            # Parse properties
            if line.startswith('endpoint:'):
                endpoint_value = line.replace('endpoint:', '').strip()
                parts = endpoint_value.split()
                # Check if first part is an HTTP method
                if len(parts) >= 2 and parts[0].upper() in ['GET', 'POST', 'PUT', 'DELETE', 'PATCH']:
                    operation['method'] = parts[0].upper()
                    operation['endpoint'] = ' '.join(parts[1:])
                else:
                    # endpoint only, method will be on separate line
                    operation['endpoint'] = endpoint_value

            elif line.startswith('method:'):
                method_value = line.replace('method:', '').strip().upper()
                operation['method'] = method_value

            elif line.startswith('auth:'):
                operation['auth'] = line.replace('auth:', '').strip()

            elif line.startswith('input:'):
                inputs = line.replace('input:', '').strip().split(',')
                operation['input'] = [i.strip() for i in inputs]

            elif line.startswith('output:'):
                operation['output'] = line.replace('output:', '').strip()

            elif line.startswith('body:'):
                # body: indicates that the following lines contain control flow
                # The body content is parsed by the following elif handlers
                pass

            elif line.startswith('sequence:'):
                operation['body'] = self.parse_sequence()

            elif line.startswith('if:'):
                condition = line.replace('if:', '').strip()
                operation['body'].append(self.parse_if(condition))
                continue  # parse_if manages current_line

            elif line.startswith('loop:') or line.startswith('loop '):
                operation['body'].append(self.parse_loop(line))
                continue  # parse_loop manages current_line

            elif line.startswith('try:'):
                operation['body'].append(self.parse_try())
                continue  # parse_try manages current_line

            elif line.startswith('set:'):
                var_assignment = line.replace('set:', '').strip()
                operation['body'].append({
                    'type': 'SetStatement',
                    'assignment': var_assignment
                })

            elif line.startswith('print'):
                msg = line.replace('print', '').strip().strip('"\'')
                operation['body'].append({
                    'type': 'PrintStatement',
                    'message': msg
                })

            self.current_line += 1

        return operation

    def parse_sequence(self) -> List[Dict[str, Any]]:
        """Parse sequence block with nested sub-operations"""
        sequence = []
        self.current_line += 1

        while self.current_line < len(self.lines):
            line = self.lines[self.current_line]

            if not line.startswith('    '):  # 4 spaces for sequence items
                break

            line_stripped = line.strip()

            if not line_stripped or line_stripped.startswith('#'):
                self.current_line += 1
                continue

            # Check for numbered step with operation name (e.g., "1. FetchTickers:")
            step_match = re.match(r'^(\d+)\.\s+(\w+):\s*$', line_stripped)
            if step_match:
                step_num = int(step_match.group(1))
                op_name = step_match.group(2)

                # Create sub-operation dict
                sub_op = {
                    'type': 'Operation',
                    'name': op_name,
                    'endpoint': None,
                    'method': None,
                    'auth': None,
                    'input': [],
                    'output': None,
                    'body': []
                }

                self.current_line += 1

                # Parse sub-operation properties (8+ spaces indentation)
                while self.current_line < len(self.lines):
                    prop_line = self.lines[self.current_line]

                    if not prop_line.startswith('        '):  # 8 spaces for sub-op properties
                        break

                    prop_line = prop_line.strip()

                    if not prop_line or prop_line.startswith('#'):
                        self.current_line += 1
                        continue

                    # Parse sub-op properties
                    if prop_line.startswith('endpoint:'):
                        parts = prop_line.replace('endpoint:', '').strip().split()
                        if len(parts) >= 2:
                            sub_op['method'] = parts[0]
                            sub_op['endpoint'] = ' '.join(parts[1:])

                    elif prop_line.startswith('auth:'):
                        sub_op['auth'] = prop_line.replace('auth:', '').strip()

                    elif prop_line.startswith('input:'):
                        inputs = prop_line.replace('input:', '').strip().split(',')
                        sub_op['input'] = [i.strip() for i in inputs]

                    elif prop_line.startswith('output:'):
                        sub_op['output'] = prop_line.replace('output:', '').strip()

                    self.current_line += 1

                sequence.append({
                    'step': step_num,
                    'type': 'SequenceStep',
                    'sub_op': sub_op
                })
                continue

            # Check for print statement in sequence
            if line_stripped.startswith('print'):
                msg = line_stripped.replace('print', '').strip().strip('"\'')
                sequence.append({
                    'type': 'PrintStatement',
                    'message': msg
                })
                self.current_line += 1
                continue

            # Fallback for other raw text
            sequence.append({'operation': line_stripped})
            self.current_line += 1

        return sequence

    def parse_if(self, condition: str) -> Dict[str, Any]:
        """Parse if-then-else block"""
        if_block = {
            'type': 'IfBlock',
            'condition': condition,
            'then': [],
            'else': []
        }

        self.current_line += 1
        in_then = True

        while self.current_line < len(self.lines):
            line = self.lines[self.current_line]

            if not line.startswith('      '):  # 6 spaces for if content
                if line.strip().startswith('else:'):
                    in_then = False
                    self.current_line += 1
                    continue
                else:
                    break

            line = line.strip()
            if line and not line.startswith('#'):
                if in_then:
                    if_block['then'].append(line)
                else:
                    if_block['else'].append(line)

            self.current_line += 1

        return if_block

    def parse_loop(self, line: str) -> Dict[str, Any]:
        """Parse loop block"""
        # Support both "loop: varname in expr" and "loop varname in expr"
        match = re.search(r'loop:?\s+(\w+)\s+in\s+(.+)', line)
        if not match:
            return {}

        var = match.group(1)
        collection = match.group(2)

        loop_block = {
            'type': 'LoopBlock',
            'variable': var,
            'collection': collection,
            'body': []
        }

        self.current_line += 1

        while self.current_line < len(self.lines):
            line = self.lines[self.current_line]

            if not line.startswith('      '):
                break

            line = line.strip()
            if line and not line.startswith('#'):
                loop_block['body'].append(line)

            self.current_line += 1

        return loop_block

    def parse_try(self) -> Dict[str, Any]:
        """Parse try-catch-finally block"""
        try_block = {
            'type': 'TryBlock',
            'body': [],
            'catches': [],
            'finally': []
        }

        self.current_line += 1
        current_section = 'body'  # Track which section we're in

        while self.current_line < len(self.lines):
            line = self.lines[self.current_line]

            # Check for catch: or finally: at 2-4 space indent
            if line.strip().startswith('catch:'):
                # Parse catch clause
                catch_line = line.strip()
                error_type = catch_line.replace('catch:', '').strip()

                catch_block = {
                    'error': error_type,
                    'body': []
                }

                self.current_line += 1

                # Collect catch body (4+ spaces)
                while self.current_line < len(self.lines):
                    catch_body_line = self.lines[self.current_line]

                    if not catch_body_line.startswith('      '):  # 6+ spaces
                        break

                    body_text = catch_body_line.strip()
                    if body_text and not body_text.startswith('#'):
                        catch_block['body'].append(body_text)

                    self.current_line += 1

                try_block['catches'].append(catch_block)
                current_section = 'catch'
                continue

            elif line.strip().startswith('finally:'):
                current_section = 'finally'
                self.current_line += 1

                # Collect finally body (4+ spaces)
                while self.current_line < len(self.lines):
                    finally_line = self.lines[self.current_line]

                    if not finally_line.startswith('      '):  # 6+ spaces
                        break

                    body_text = finally_line.strip()
                    if body_text and not body_text.startswith('#'):
                        try_block['finally'].append(body_text)

                    self.current_line += 1

                break

            # If we're not at a catch/finally and we're past 6 spaces, we're done
            elif not line.startswith('      '):
                break

            # Collect body lines (6+ spaces for try body)
            elif line.startswith('      '):
                body_text = line.strip()
                if body_text and not body_text.startswith('#'):
                    if current_section == 'body':
                        try_block['body'].append(body_text)

            self.current_line += 1

        return try_block

def parse_dsl(source: str) -> Dict[str, Any]:
    """Parse DSL source to AST"""
    parser = DSLParser()
    return parser.parse(source)
