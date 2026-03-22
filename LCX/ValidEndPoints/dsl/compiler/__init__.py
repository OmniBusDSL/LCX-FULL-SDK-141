"""
LCX DSL Compiler
Convert .lcx files to 77 programming languages
"""

from .parser import parse_dsl
from .templates import generate_code

__version__ = '0.1.0'
__all__ = ['parse_dsl', 'generate_code']
