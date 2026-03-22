#!/usr/bin/env python3
"""
LCX DSL Compiler - Command Line Interface
Global CLI tool for compiling and running LCX DSL files
"""

import sys
import os
import argparse
import subprocess
import json
from pathlib import Path

# Get DSL root directory
DSL_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
sys.path.insert(0, DSL_ROOT)

from compiler.templates import LANGUAGE_TEMPLATES
from compiler.parser import parse_dsl
from compiler.templates import generate_code

def get_all_languages():
    """Get list of all supported languages"""
    return sorted(LANGUAGE_TEMPLATES.keys())

def compile_dsl(lcx_file, target_lang, output_file=None):
    """Compile LCX file to target language"""
    
    # Read DSL file
    if not os.path.exists(lcx_file):
        print(f"[ERROR] File not found: {lcx_file}")
        return False
    
    with open(lcx_file, 'r') as f:
        dsl_content = f.read()
    
    # Parse DSL
    try:
        ast = parse_dsl(dsl_content)
    except Exception as e:
        print(f"[ERROR] Parse failed: {e}")
        return False
    
    # Generate code
    try:
        code = generate_code(ast, target_lang)
    except Exception as e:
        print(f"[ERROR] Code generation failed: {e}")
        return False
    
    # Determine output file
    if not output_file:
        base_name = Path(lcx_file).stem
        # Get file extension for language
        ext_map = {
            'python': 'py', 'javascript': 'js', 'typescript': 'ts',
            'go': 'go', 'java': 'java', 'csharp': 'cs', 'rust': 'rs',
            'php': 'php', 'cpp': 'cpp', 'c': 'c', 'solidity': 'solidity'
        }
        ext = ext_map.get(target_lang, target_lang[:3])
        output_file = f"{base_name}.{ext}"
    
    # Write output
    try:
        os.makedirs(os.path.dirname(output_file) if os.path.dirname(output_file) else '.', exist_ok=True)
        with open(output_file, 'w') as f:
            f.write(code)
        size_kb = os.path.getsize(output_file) / 1024
        print(f"[OK] Compiled: {output_file} ({size_kb:.1f} KB)")
        return True
    except Exception as e:
        print(f"[ERROR] Write failed: {e}")
        return False

def run_compiled(output_file, runtime='python'):
    """Execute compiled code"""
    if not os.path.exists(output_file):
        print(f"[ERROR] File not found: {output_file}")
        return False
    
    print(f"[*] Executing {output_file} with {runtime}...")
    try:
        if runtime == 'python':
            result = subprocess.run([sys.executable, output_file], check=True)
            return result.returncode == 0
        elif runtime == 'node':
            result = subprocess.run(['node', output_file], check=True)
            return result.returncode == 0
        else:
            print(f"[ERROR] Runtime not supported: {runtime}")
            return False
    except subprocess.CalledProcessError as e:
        print(f"[ERROR] Execution failed: {e}")
        return False
    except FileNotFoundError:
        print(f"[ERROR] Runtime not found: {runtime}")
        return False

def list_languages():
    """List all supported languages"""
    langs = get_all_languages()
    print(f"\n[LCX DSL Supported Languages ({len(langs)} total)]\n")

    # Group by category
    base_categories = {
        'Web': ['python', 'javascript', 'typescript', 'php', 'ruby'],
        'Systems': ['go', 'rust', 'c', 'cpp'],
        'JVM': ['java', 'kotlin', 'scala', 'clojure', 'groovy'],
        '.NET': ['csharp', 'vbnet'],
        'Functional': ['haskell', 'lisp', 'scheme', 'racket', 'elm', 'purescript'],
    }

    # Find languages not in any category
    categorized = set()
    for cat_langs in base_categories.values():
        categorized.update(cat_langs)
    other_langs = [l for l in langs if l not in categorized]

    categories = base_categories.copy()
    if other_langs:
        categories['Other'] = other_langs

    for category, lang_list in categories.items():
        available = [l for l in lang_list if l in langs]
        if available:
            print(f"{category:12} : {', '.join(available)}")

    print()

def main():
    parser = argparse.ArgumentParser(
        description='LCX DSL Compiler - Command Line Interface',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  lcx-cli compile market_data.lcx --lang python
  lcx-cli compile market_data.lcx --lang javascript -o dist/api.js
  lcx-cli run market_data.lcx python
  lcx-cli languages
        '''
    )
    
    subparsers = parser.add_subparsers(dest='command', help='Command to execute')
    
    # Compile command
    compile_parser = subparsers.add_parser('compile', help='Compile LCX file')
    compile_parser.add_argument('file', help='LCX source file')
    compile_parser.add_argument('--lang', '-l', required=True, help='Target language')
    compile_parser.add_argument('--output', '-o', help='Output file (optional)')
    
    # Run command
    run_parser = subparsers.add_parser('run', help='Compile and run LCX file')
    run_parser.add_argument('file', help='LCX source file')
    run_parser.add_argument('runtime', nargs='?', default='python', 
                           help='Runtime (python, node)')
    
    # Languages command
    subparsers.add_parser('languages', help='List supported languages')
    
    # Parse arguments
    args = parser.parse_args()
    
    if not args.command:
        parser.print_help()
        return 1
    
    if args.command == 'compile':
        if args.lang not in get_all_languages():
            print(f"[ERROR] Unsupported language: {args.lang}")
            print(f"[INFO] Use 'lcx-cli languages' to see supported languages")
            return 1
        
        success = compile_dsl(args.file, args.lang, args.output)
        return 0 if success else 1
    
    elif args.command == 'run':
        # First compile to temp file
        lang = 'python'  # default
        temp_output = f"/tmp/lcx_tmp_{Path(args.file).stem}.py"
        
        if not compile_dsl(args.file, lang, temp_output):
            return 1
        
        # Then run
        success = run_compiled(temp_output, args.runtime)
        return 0 if success else 1
    
    elif args.command == 'languages':
        list_languages()
        return 0
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
