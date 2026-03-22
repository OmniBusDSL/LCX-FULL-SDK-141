#!/usr/bin/env python3
"""
LCX DSL Compiler CLI
Usage: lcx-compile file.lcx --target python [--output output.py]
"""

import argparse
import sys
from pathlib import Path
from parser import parse_dsl
from templates import generate_code

def main():
    parser = argparse.ArgumentParser(
        description='LCX DSL Compiler - Compile .lcx files to any language',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  lcx-compile market_data.lcx --target python
  lcx-compile market_data.lcx --target javascript --output market.js
  lcx-compile place_order.lcx --target all --output-dir ./generated
        '''
    )

    parser.add_argument('file', help='DSL file to compile (.lcx)')
    parser.add_argument('-t', '--target', required=True,
                        help='Target language (python, javascript, go, java)')
    parser.add_argument('-o', '--output', help='Output filename')
    parser.add_argument('-d', '--output-dir', help='Output directory')
    parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')

    args = parser.parse_args()

    # Validate input file
    input_file = Path(args.file)
    if not input_file.exists():
        print(f"[ERROR] File not found: {args.file}", file=sys.stderr)
        return 1

    if args.verbose:
        print(f"[*] Input file: {input_file}")
        print(f"[*] Target language: {args.target}")

    # Read DSL file
    try:
        dsl_source = input_file.read_text()
        if args.verbose:
            print(f"[*] Read {len(dsl_source)} bytes")
    except Exception as e:
        print(f"[ERROR] Failed to read file: {e}", file=sys.stderr)
        return 1

    # Parse DSL
    try:
        ast = parse_dsl(dsl_source)
        if args.verbose:
            print(f"[OK] Parsed {len(ast.get('operations', []))} operations")
    except Exception as e:
        print(f"[ERROR] Failed to parse DSL: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1

    # Generate code
    try:
        code = generate_code(ast, args.target)
        if args.verbose:
            print(f"[OK] Generated {len(code)} bytes of code")
    except Exception as e:
        print(f"[ERROR] Failed to generate code: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1

    # Determine output file
    if args.output:
        output_file = Path(args.output)
    elif args.output_dir:
        output_dir = Path(args.output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)
        # Determine extension based on language
        extensions = {
            'python': 'py',
            'javascript': 'js',
            'go': 'go',
            'java': 'java',
            'csharp': 'cs',
            'rust': 'rs',
            'php': 'php',
            'typescript': 'ts',
        }
        ext = extensions.get(args.target, args.target)
        output_file = output_dir / f"{input_file.stem}.{ext}"
    else:
        # Default: same name as input with target extension
        extensions = {
            'python': 'py',
            'javascript': 'js',
            'go': 'go',
            'java': 'java',
            'csharp': 'cs',
            'rust': 'rs',
            'php': 'php',
            'typescript': 'ts',
        }
        ext = extensions.get(args.target, args.target)
        output_file = input_file.parent / f"{input_file.stem}.{ext}"

    # Write output
    try:
        output_file.write_text(code)
        print(f"[OK] Generated {args.target} code: {output_file}")
        print(f"[OK] {len(code)} bytes written")

        if args.verbose:
            print(f"\n--- Generated Code Preview ---")
            preview = code[:500] + ("..." if len(code) > 500 else "")
            print(preview)

        return 0
    except Exception as e:
        print(f"[ERROR] Failed to write output: {e}", file=sys.stderr)
        return 1

if __name__ == '__main__':
    sys.exit(main())
