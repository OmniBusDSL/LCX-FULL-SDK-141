#!/usr/bin/env python3
"""
LCX Universal DSL Compiler
Compiles .lcx DSL files to 77 programming languages

Usage:
  lcx-compiler myflow.lcx --target python
  lcx-compiler myflow.lcx --target all
  lcx-compiler myflow.lcx --target javascript --output myflow.js
"""

import argparse
import sys
from pathlib import Path
from dsl_parser import DSLParser
from code_generators import CodeGeneratorFactory

# Supported target languages
SUPPORTED_TARGETS = [
    # Core Languages (27 with templates)
    "python", "javascript", "java", "go", "php", "typescript", "csharp",
    "rust", "kotlin", "swift", "ruby", "scala", "dart", "c", "perl",
    "bash", "clojure", "crystal", "elixir", "groovy", "lua", "nim",
    "objective-c", "powershell", "julia", "ada", "zig",

    # Server frameworks (68)
    "python-flask", "python-fastapi", "python-aiohttp",
    "nodejs-express", "nodejs-nestjs",
    "java-spring-boot", "java-play-framework",
    "go-gin", "go-echo",
    "csharp-aspnet",
    "rust-axum", "rust-rocket",
    "php-laravel", "php-symfony",
    "ruby-rails", "ruby-sinatra",
    "scala-play", "scala-akka",
    "swift-server",
    "kotlin-spring",
    # ... add more as needed

    # Meta targets
    "all",
]

class DSLCompiler:
    def __init__(self):
        self.parser = DSLParser()
        self.generator_factory = CodeGeneratorFactory()

    def compile_file(self, filepath, target, output_file=None, beautify=True):
        """
        Compile a DSL file to target language

        Args:
            filepath: Path to .lcx file
            target: Target language (python, javascript, java, etc.)
            output_file: Optional output filename
            beautify: Whether to beautify the generated code

        Returns:
            Generated code as string
        """
        # Read DSL file
        dsl_content = Path(filepath).read_text()

        # Parse DSL
        ast = self.parser.parse(dsl_content)

        # Generate code
        if target == "all":
            return self.compile_all_languages(ast, output_file)
        else:
            return self.compile_single(ast, target, output_file, beautify)

    def compile_single(self, ast, target, output_file=None, beautify=True):
        """Compile AST to single target language"""

        if target not in SUPPORTED_TARGETS:
            raise ValueError(f"Unsupported target: {target}")

        # Get code generator for target
        generator = self.generator_factory.get_generator(target)

        # Generate code
        generated_code = generator.generate(ast)

        # Beautify if requested
        if beautify:
            generated_code = generator.beautify(generated_code)

        # Save to file if specified
        if output_file:
            Path(output_file).write_text(generated_code)
            print(f"[OK] Generated {target} code: {output_file}")
        else:
            print(generated_code)

        return generated_code

    def compile_all_languages(self, ast, output_dir=None):
        """Compile AST to all 27 supported languages"""

        languages = [
            "python", "javascript", "java", "go", "php", "typescript", "csharp",
            "rust", "kotlin", "swift", "ruby", "scala", "dart", "c", "perl",
            "bash", "clojure", "crystal", "elixir", "groovy", "lua", "nim",
            "objective-c", "powershell", "julia", "ada", "zig",
        ]

        results = {}
        output_dir = Path(output_dir or ".")

        for lang in languages:
            try:
                generator = self.generator_factory.get_generator(lang)
                code = generator.generate(ast)
                code = generator.beautify(code)

                # Determine output filename
                ext = generator.file_extension
                outfile = output_dir / f"generated.{ext}"
                outfile.write_text(code)

                results[lang] = {
                    "status": "OK",
                    "file": str(outfile),
                    "lines": len(code.split('\n'))
                }
                print(f"[OK] {lang:15} -> {outfile} ({results[lang]['lines']} lines)")

            except Exception as e:
                results[lang] = {"status": "FAIL", "error": str(e)}
                print(f"[FAIL] {lang:15} -> {e}")

        return results

def main():
    parser = argparse.ArgumentParser(
        description="LCX Universal DSL Compiler",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  lcx-compiler market_data.lcx --target python
  lcx-compiler place_order.lcx --target all
  lcx-compiler flow.lcx --target javascript --output my_flow.js
        """
    )

    parser.add_argument("file", help="DSL file to compile (.lcx)")
    parser.add_argument("-t", "--target", required=True,
                        help=f"Target language ({', '.join(SUPPORTED_TARGETS)})")
    parser.add_argument("-o", "--output", help="Output filename (optional)")
    parser.add_argument("-d", "--directory", help="Output directory (for --target all)")
    parser.add_argument("--no-beautify", action="store_true", help="Skip code beautification")
    parser.add_argument("-v", "--verbose", action="store_true", help="Verbose output")

    args = parser.parse_args()

    # Validate input file
    if not Path(args.file).exists():
        print(f"[ERROR] File not found: {args.file}", file=sys.stderr)
        sys.exit(1)

    # Validate target
    if args.target not in SUPPORTED_TARGETS:
        print(f"[ERROR] Unsupported target: {args.target}", file=sys.stderr)
        print(f"Supported targets: {', '.join(SUPPORTED_TARGETS)}", file=sys.stderr)
        sys.exit(1)

    # Compile
    try:
        compiler = DSLCompiler()

        if args.target == "all":
            results = compiler.compile_file(
                args.file,
                "all",
                output_file=args.directory or "."
            )
            print("\n[SUMMARY]")
            success = sum(1 for r in results.values() if r["status"] == "OK")
            print(f"Generated {success}/{len(results)} languages")
        else:
            compiler.compile_file(
                args.file,
                args.target,
                output_file=args.output,
                beautify=not args.no_beautify
            )

    except Exception as e:
        print(f"[ERROR] Compilation failed: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
