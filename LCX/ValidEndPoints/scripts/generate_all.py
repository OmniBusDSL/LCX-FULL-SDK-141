#!/usr/bin/env python3
"""
MASTER SCRIPT - Generează TOTUL!
- 145 SDKs (77 client + 68 server)
- 621 code samples (27 languages × 23 endpoints)
- Interactive HTML pages
"""

import subprocess
import sys
from pathlib import Path

def run_script(script_name, description):
    """Run a generation script"""
    print(f"\n{'='*60}")
    print(f"[*] {description}")
    print(f"{'='*60}\n")

    try:
        result = subprocess.run([sys.executable, script_name], cwd=Path.cwd())
        if result.returncode == 0:
            print(f"\n[OK] {description} - SUCCESS!\n")
            return True
        else:
            print(f"\n[FAIL] {description} - ERROR!\n")
            return False
    except Exception as e:
        print(f"\n[ERROR] {description}: {e}\n")
        return False

def main():
    print("\n")
    print("[" + "="*58 + "]")
    print("  LCX EXCHANGE API - COMPLETE GENERATION SCRIPT")
    print("[" + "="*58 + "]")
    print("\n")

    scripts = [
        ("generate_sdks_clean.py", "1. Generating 145 SDKs (77 client + 68 server)"),
        ("generate_samples_simple.py", "2. Generating core samples (12 endpoints × 6 languages)"),
        ("generate_final_samples.py", "3. Generating FINAL samples (23 endpoints × 27 languages)"),
        ("generate_77language_final_samples.py", "4. Generating samples for ALL 77 languages (23 endpoints × 77 languages)"),
        ("generate_final_html.py", "5. Generating interactive HTML pages"),
    ]

    results = {}
    for script, desc in scripts:
        if Path(script).exists():
            results[desc] = run_script(script, desc)
        else:
            print(f"\n[SKIP] {desc} - Script not found: {script}\n")
            results[desc] = False

    # Summary
    print("\n")
    print("[" + "="*58 + "]")
    print("  GENERATION COMPLETE - SUMMARY")
    print("[" + "="*58 + "]")
    print("\n")

    for desc, success in results.items():
        status = "[OK]" if success else "[FAIL]"
        print(f"  {status}  {desc}")

    print("\n")
    print("OUTPUT DIRECTORIES:")
    print("  [DIR] generated_sdks/             - 145 SDKs")
    print("  [DIR] lcx_samplesGood/           - Reference samples")
    print("  [DIR] lcx_samples_final/         - 621 final samples")
    print("  [FILE] lcx_samples.html           - Interactive HTML")
    print("\n")
    print("GITHUB REPOSITORY:")
    print("  https://github.com/OmniBusDSL/LCX-FULL-SDK-141")
    print("\n")

if __name__ == "__main__":
    main()
