#!/usr/bin/env python3
"""
DSL Lexer (Tokenizer)
Converts .lcx DSL source code into tokens
"""

import re
from enum import Enum, auto
from dataclasses import dataclass
from typing import List, Optional, Union

class TokenType(Enum):
    """Token types for DSL"""
    # Literals
    STRING = auto()
    NUMBER = auto()
    IDENTIFIER = auto()

    # Keywords
    ENDPOINT = auto()
    AUTH = auto()
    INPUT = auto()
    OUTPUT = auto()
    SEQUENCE = auto()
    LOOP = auto()
    IF = auto()
    THEN = auto()
    ELSE = auto()
    TRY = auto()
    CATCH = auto()
    FINALLY = auto()
    SET = auto()
    PRINT = auto()
    LOG = auto()
    NOTIFY = auto()
    BREAK = auto()
    CONTINUE = auto()
    SLEEP = auto()

    # HTTP Methods
    GET = auto()
    POST = auto()
    PUT = auto()
    DELETE = auto()
    PATCH = auto()
    HEAD = auto()
    OPTIONS = auto()

    # Auth values
    REQUIRED = auto()
    OPTIONAL = auto()
    NONE = auto()

    # Operators
    COLON = auto()          # :
    EQUALS = auto()         # =
    DOT = auto()            # .
    COMMA = auto()          # ,
    LPAREN = auto()         # (
    RPAREN = auto()         # )
    LBRACKET = auto()       # [
    RBRACKET = auto()       # ]
    LBRACE = auto()         # {
    RBRACE = auto()         # }

    # Comparison
    EQ = auto()             # ==
    NE = auto()             # !=
    LT = auto()             # <
    LE = auto()             # <=
    GT = auto()             # >
    GE = auto()             # >=

    # Logical
    AND = auto()            # and
    OR = auto()             # or
    NOT = auto()            # not

    # Special
    COMMENT = auto()        # #
    NEWLINE = auto()
    EOF = auto()
    INDENT = auto()
    DEDENT = auto()

    # Path/URL
    PATH = auto()           # /api/...

@dataclass
class Token:
    """Single token"""
    type: TokenType
    value: Union[str, int, float]
    line: int
    column: int

    def __repr__(self):
        return f"Token({self.type.name}, {self.value!r}, {self.line}:{self.column})"

class Lexer:
    """Tokenizes DSL source code"""

    # Keywords mapping
    KEYWORDS = {
        'endpoint': TokenType.ENDPOINT,
        'auth': TokenType.AUTH,
        'input': TokenType.INPUT,
        'output': TokenType.OUTPUT,
        'sequence': TokenType.SEQUENCE,
        'loop': TokenType.LOOP,
        'if': TokenType.IF,
        'then': TokenType.THEN,
        'else': TokenType.ELSE,
        'try': TokenType.TRY,
        'catch': TokenType.CATCH,
        'finally': TokenType.FINALLY,
        'set': TokenType.SET,
        'print': TokenType.PRINT,
        'log': TokenType.LOG,
        'notify': TokenType.NOTIFY,
        'break': TokenType.BREAK,
        'continue': TokenType.CONTINUE,
        'sleep': TokenType.SLEEP,

        # HTTP Methods
        'GET': TokenType.GET,
        'POST': TokenType.POST,
        'PUT': TokenType.PUT,
        'DELETE': TokenType.DELETE,
        'PATCH': TokenType.PATCH,
        'HEAD': TokenType.HEAD,
        'OPTIONS': TokenType.OPTIONS,

        # Auth values
        'required': TokenType.REQUIRED,
        'optional': TokenType.OPTIONAL,
        'none': TokenType.NONE,

        # Logical
        'and': TokenType.AND,
        'or': TokenType.OR,
        'not': TokenType.NOT,
        'in': TokenType.IDENTIFIER,  # 'in' is identifier, handled in parser
        'range': TokenType.IDENTIFIER,
    }

    def __init__(self, source: str):
        self.source = source
        self.position = 0
        self.line = 1
        self.column = 1
        self.tokens: List[Token] = []
        self.indent_stack = [0]

    def error(self, message: str):
        """Raise lexer error"""
        raise SyntaxError(f"Lexer error at {self.line}:{self.column}: {message}")

    def peek(self, offset: int = 0) -> Optional[str]:
        """Peek at character without consuming"""
        pos = self.position + offset
        if pos < len(self.source):
            return self.source[pos]
        return None

    def advance(self) -> Optional[str]:
        """Consume and return next character"""
        if self.position >= len(self.source):
            return None

        char = self.source[self.position]
        self.position += 1

        if char == '\n':
            self.line += 1
            self.column = 1
        else:
            self.column += 1

        return char

    def skip_whitespace(self):
        """Skip spaces and tabs (not newlines)"""
        while self.peek() in (' ', '\t'):
            self.advance()

    def skip_comment(self):
        """Skip comment line"""
        if self.peek() == '#':
            while self.peek() and self.peek() != '\n':
                self.advance()

    def read_string(self, quote_char: str) -> str:
        """Read string literal"""
        value = ''
        self.advance()  # Skip opening quote

        while self.peek() and self.peek() != quote_char:
            if self.peek() == '\\':
                self.advance()
                next_char = self.advance()
                if next_char == 'n':
                    value += '\n'
                elif next_char == 't':
                    value += '\t'
                elif next_char == 'r':
                    value += '\r'
                elif next_char == '\\':
                    value += '\\'
                elif next_char == quote_char:
                    value += quote_char
                else:
                    value += next_char or ''
            else:
                value += self.advance() or ''

        if self.peek() != quote_char:
            self.error(f"Unterminated string")

        self.advance()  # Skip closing quote
        return value

    def read_number(self) -> Union[int, float]:
        """Read number literal"""
        value = ''
        has_dot = False

        while self.peek() and (self.peek().isdigit() or self.peek() == '.'):
            if self.peek() == '.':
                if has_dot:
                    break
                has_dot = True
            value += self.advance() or ''

        return float(value) if has_dot else int(value)

    def read_identifier(self) -> str:
        """Read identifier or keyword"""
        value = ''

        while self.peek() and (self.peek().isalnum() or self.peek() in ('_', '-')):
            value += self.advance() or ''

        return value

    def read_path(self) -> str:
        """Read API path /api/..."""
        value = ''

        while self.peek() and self.peek() not in ('\n', ' ', '\t', '#'):
            value += self.advance() or ''

        return value

    def tokenize(self) -> List[Token]:
        """Tokenize entire source"""
        while self.position < len(self.source):
            self.skip_whitespace()

            if not self.peek():
                break

            # Comments
            if self.peek() == '#':
                self.skip_comment()
                continue

            # Newlines
            if self.peek() == '\n':
                self.advance()
                self.tokens.append(Token(TokenType.NEWLINE, '\n', self.line - 1, self.column))
                continue

            # Strings
            if self.peek() in ('"', "'"):
                quote = self.peek()
                line, col = self.line, self.column
                value = self.read_string(quote)
                self.tokens.append(Token(TokenType.STRING, value, line, col))
                continue

            # Numbers
            if self.peek().isdigit():
                line, col = self.line, self.column
                value = self.read_number()
                self.tokens.append(Token(TokenType.NUMBER, value, line, col))
                continue

            # Paths (/api/...)
            if self.peek() == '/' and self.peek(1) and self.peek(1).isalpha():
                line, col = self.line, self.column
                value = self.read_path()
                self.tokens.append(Token(TokenType.PATH, value, line, col))
                continue

            # Identifiers and keywords
            if self.peek().isalpha() or self.peek() == '_':
                line, col = self.line, self.column
                value = self.read_identifier()

                # Check if keyword
                token_type = self.KEYWORDS.get(value, TokenType.IDENTIFIER)
                self.tokens.append(Token(token_type, value, line, col))
                continue

            # Two-character operators
            two_char = self.peek() + (self.peek(1) or '')
            two_char_tokens = {
                '==': TokenType.EQ,
                '!=': TokenType.NE,
                '<=': TokenType.LE,
                '>=': TokenType.GE,
            }

            if two_char in two_char_tokens:
                line, col = self.line, self.column
                self.advance()
                self.advance()
                self.tokens.append(Token(two_char_tokens[two_char], two_char, line, col))
                continue

            # Single-character operators
            char = self.peek()
            line, col = self.line, self.column

            single_char_tokens = {
                ':': TokenType.COLON,
                '=': TokenType.EQUALS,
                '.': TokenType.DOT,
                ',': TokenType.COMMA,
                '(': TokenType.LPAREN,
                ')': TokenType.RPAREN,
                '[': TokenType.LBRACKET,
                ']': TokenType.RBRACKET,
                '{': TokenType.LBRACE,
                '}': TokenType.RBRACE,
                '<': TokenType.LT,
                '>': TokenType.GT,
            }

            if char in single_char_tokens:
                self.advance()
                self.tokens.append(Token(single_char_tokens[char], char, line, col))
                continue

            # Unknown character
            self.error(f"Unexpected character: {char!r}")

        # Add EOF
        self.tokens.append(Token(TokenType.EOF, '', self.line, self.column))
        return self.tokens

def tokenize(source: str) -> List[Token]:
    """Convenience function to tokenize source code"""
    lexer = Lexer(source)
    return lexer.tokenize()
