#!/usr/bin/env python3
"""
AST Node Definitions for DSL
Defines the structure of Abstract Syntax Tree
"""

from dataclasses import dataclass
from typing import List, Optional, Union, Dict, Any

# Base Node
@dataclass
class ASTNode:
    """Base class for all AST nodes"""
    pass

# Program
@dataclass
class Program(ASTNode):
    """Root node - entire DSL program"""
    operations: List['Operation']
    metadata: Optional[Dict[str, Any]] = None

# Operations
@dataclass
class Operation(ASTNode):
    """Named operation definition"""
    name: str
    body: Optional['Block'] = None
    endpoint: Optional[str] = None
    method: Optional[str] = None
    auth: Optional[str] = None  # 'required', 'optional', 'none'
    input_vars: List[str] = None
    output: Optional[str] = None  # 'print', 'json', 'save var', etc.
    auth_config: Optional['AuthConfig'] = None

    def __post_init__(self):
        if self.input_vars is None:
            self.input_vars = []

# Blocks
@dataclass
class Block(ASTNode):
    """Block of statements"""
    statements: List[Union['Statement', 'Operation', 'IfBlock', 'LoopBlock', 'SequenceBlock', 'TryBlock']]

@dataclass
class SequenceBlock(ASTNode):
    """Execute operations in sequence"""
    operations: List[Union['Operation', 'IfBlock', 'LoopBlock', 'TryBlock', int]]  # int = numbered step

@dataclass
class IfBlock(ASTNode):
    """If-then-else control flow"""
    condition: 'Expression'
    then_block: Union['Block', 'Operation', List]
    else_block: Optional[Union['Block', 'Operation', List]] = None

@dataclass
class LoopBlock(ASTNode):
    """Loop/iteration"""
    variable: str
    collection: str  # identifier, range(), etc.
    body: Union['Block', 'Operation', List]

@dataclass
class TryBlock(ASTNode):
    """Try-catch-finally error handling"""
    try_block: Union['Block', 'Operation', List]
    catch_blocks: List['CatchBlock']
    finally_block: Optional[Union['Block', 'Operation']] = None

@dataclass
class CatchBlock(ASTNode):
    """Catch clause"""
    error_type: Optional[str]  # 'NetworkError', 'NotFound', None for generic
    variable: Optional[str]  # e.g., 'error'
    body: Union['Block', List]

# Statements
@dataclass
class Statement(ASTNode):
    """Base statement"""
    pass

@dataclass
class SetStatement(Statement):
    """Variable assignment: set: var = value"""
    variable: str
    value: 'Expression'

@dataclass
class PrintStatement(Statement):
    """Print statement"""
    args: List['Expression']

@dataclass
class LogStatement(Statement):
    """Log statement"""
    args: List['Expression']

@dataclass
class NotifyStatement(Statement):
    """Notify statement"""
    message: 'Expression'

@dataclass
class BreakStatement(Statement):
    """Break from loop"""
    pass

@dataclass
class ContinueStatement(Statement):
    """Continue in loop"""
    pass

@dataclass
class SleepStatement(Statement):
    """Sleep/delay"""
    duration: 'Expression'  # in seconds

# Expressions
@dataclass
class Expression(ASTNode):
    """Base expression"""
    pass

@dataclass
class Literal(Expression):
    """Literal value"""
    value: Union[str, int, float, bool, None]
    type: str  # 'string', 'number', 'boolean', 'null'

@dataclass
class Identifier(Expression):
    """Variable or function reference"""
    name: str

@dataclass
class BinaryOp(Expression):
    """Binary operation: left op right"""
    left: Expression
    op: str  # '+', '-', '*', '/', '==', '!=', '<', '>', '<=', '>=', 'and', 'or'
    right: Expression

@dataclass
class UnaryOp(Expression):
    """Unary operation: op expr"""
    op: str  # '-', 'not'
    operand: Expression

@dataclass
class FunctionCall(Expression):
    """Function call: func(arg1, arg2)"""
    name: str
    args: List[Expression]

@dataclass
class MemberAccess(Expression):
    """Member access: obj.member or obj['key']"""
    object: Expression
    member: Union[str, Expression]  # str for dot notation, Expression for bracket

@dataclass
class ArrayLiteral(Expression):
    """Array literal: [1, 2, 3]"""
    elements: List[Expression]

@dataclass
class ObjectLiteral(Expression):
    """Object literal: {key: value}"""
    pairs: List[tuple]  # List of (key, value) tuples

# Authentication Configuration
@dataclass
class AuthConfig(ASTNode):
    """Authentication configuration"""
    type: str  # 'required', 'optional', 'none'
    key_var: Optional[str] = None  # $API_KEY or env var
    secret_var: Optional[str] = None  # $API_SECRET or env var
    headers: Dict[str, str] = None  # Custom headers

    def __post_init__(self):
        if self.headers is None:
            self.headers = {}

# Endpoint information
@dataclass
class EndpointInfo(ASTNode):
    """HTTP endpoint information"""
    method: str  # GET, POST, PUT, DELETE, etc.
    path: str  # /api/market/tickers or /api/trading/order/{id}
    full_url: str = None  # https://exchange-api.lcx.com/api/...

    def __post_init__(self):
        if not self.full_url:
            self.full_url = f"https://exchange-api.lcx.com{self.path}"

# Visitor pattern for AST traversal
class ASTVisitor:
    """Base visitor for traversing AST"""

    def visit(self, node: ASTNode):
        """Visit a node"""
        method_name = f'visit_{node.__class__.__name__}'
        visitor = getattr(self, method_name, self.generic_visit)
        return visitor(node)

    def generic_visit(self, node: ASTNode):
        """Called if no specific visit method exists"""
        pass

# Pretty printer for debugging
class ASTPrinter(ASTVisitor):
    """Print AST in human-readable format"""

    def __init__(self, indent: int = 0):
        self.indent = indent

    def _print(self, text: str):
        print('  ' * self.indent + text)

    def visit_Program(self, node: Program):
        self._print(f"Program({len(node.operations)} operations)")
        for op in node.operations:
            self.visit(op)

    def visit_Operation(self, node: Operation):
        self._print(f"Operation: {node.name}")
        if node.endpoint:
            self._print(f"  endpoint: {node.method} {node.endpoint}")
        if node.auth:
            self._print(f"  auth: {node.auth}")
        if node.input_vars:
            self._print(f"  input: {', '.join(node.input_vars)}")
        if node.output:
            self._print(f"  output: {node.output}")

    def visit_SequenceBlock(self, node: SequenceBlock):
        self._print("Sequence:")
        for stmt in node.operations:
            self.visit(stmt)

    def visit_IfBlock(self, node: IfBlock):
        self._print("If:")
        self._print(f"  condition: {node.condition}")
        self._print("  then:")
        self.visit(node.then_block)
        if node.else_block:
            self._print("  else:")
            self.visit(node.else_block)

    def visit_LoopBlock(self, node: LoopBlock):
        self._print(f"Loop: {node.variable} in {node.collection}")
        self.visit(node.body)

    def visit_SetStatement(self, node: SetStatement):
        self._print(f"Set: {node.variable} = {node.value}")

    def visit_PrintStatement(self, node: PrintStatement):
        self._print(f"Print: {node.args}")

def print_ast(node: ASTNode):
    """Pretty print an AST"""
    printer = ASTPrinter()
    printer.visit(node)
