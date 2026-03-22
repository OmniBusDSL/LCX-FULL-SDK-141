#!/usr/bin/env python3
"""Generate Client SDKs and Server Stubs for LCX API across all languages"""

import subprocess
import sys
import os
import re
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime
from collections import defaultdict

# Configuration
INPUT_SPEC = "lcx_openapi.json"
OUTPUT_DIR = Path("generated_sdks")
LOG_FILE = Path("generation_log.txt")
REPORT_FILE = OUTPUT_DIR / "report.html"
MAX_WORKERS = 3

# Client SDK generators
CLIENT_GENERATORS = [
    "python", "java", "go", "typescript", "csharp", "php", "rust", "swift", "kotlin",
    "javascript", "dart", "scala", "ruby", "cpp", "c", "r", "lua", "perl", "bash",
    "powershell", "haskell", "clojure", "crystal", "elixir", "elm", "erlang", "groovy",
    "julia", "nim", "objective-c", "ocaml", "actionscript", "ada", "apex", "eiffel",
    "xojo", "nodejs"
]

# Server generators
SERVER_GENERATORS = [
    "nodejs-express", "python-flask", "python-fastapi", "go-server", "java-spring-boot",
    "php-symfony", "csharp-nancyfx", "rust-rocket"
]

def find_generator_command():
    """Find openapi-generator command"""
    import shutil

    # Priority 1: Local JAR
    jar_path = Path("openapi-generator-cli.jar")
    if jar_path.is_file():
        return ["java", "-jar", str(jar_path)]

    # Priority 2: CLI from PATH
    if shutil.which("openapi-generator-cli"):
        return ["openapi-generator-cli"]

    return None

def run_command(cmd, timeout=300):
    """Run command and return stdout, stderr, return code"""
    try:
        result = subprocess.run(
            cmd, capture_output=True, text=True, timeout=timeout, check=False
        )
        return result.stdout, result.stderr, result.returncode
    except subprocess.TimeoutExpired:
        return "", "TIMEOUT", -1
    except Exception as e:
        return "", str(e), -1

def get_available_generators(gen_cmd):
    """Get list of available generators"""
    print("[*] Detecting available generators...")
    stdout, stderr, rc = run_command(gen_cmd + ["list"])

    if rc != 0:
        print("[!] Error listing generators")
        return [], []

    client_available = []
    server_available = []
    lines = stdout.splitlines()
    in_client = False
    in_server = False

    for line in lines:
        if "CLIENT generators:" in line:
            in_client, in_server = True, False
            continue
        if "SERVER generators:" in line:
            in_client, in_server = False, True
            continue
        if line.strip() and not line.startswith(" ") and (in_client or in_server):
            break

        if (in_client or in_server) and line.strip().startswith("- "):
            name = line.strip()[2:].split()[0].strip()
            if name:
                if in_client:
                    client_available.append(name)
                else:
                    server_available.append(name)

    return sorted(client_available), sorted(server_available)

def generate_sdk(gen_cmd, generator_name, output_path, sdk_type="client"):
    """Generate SDK for specific generator"""
    output_path.mkdir(parents=True, exist_ok=True)

    cmd = gen_cmd + [
        "generate",
        "-i", INPUT_SPEC,
        "-g", generator_name,
        "-o", str(output_path),
        "--skip-validate-spec"  # Skip validation - spec has some issues
    ]

    stdout, stderr, rc = run_command(cmd)
    success = rc == 0

    # Log result
    with open(LOG_FILE, "a", encoding="utf-8") as log:
        log.write("\n" + "="*70 + "\n")
        log.write(f"[{datetime.now().isoformat()}] {sdk_type.upper()}: {generator_name}\n")
        log.write(f"Path: {output_path}\n")
        log.write(f"Status: {'SUCCESS' if success else f'FAILED (rc={rc})'}\n")
        log.write(f"Cmd: {' '.join(cmd)}\n")
        if stdout:
            log.write(f"\nSTDOUT:\n{stdout[:500]}\n")
        if stderr:
            log.write(f"\nSTDERR:\n{stderr[:500]}\n")

    return {
        "generator": generator_name,
        "type": sdk_type,
        "success": success,
        "path": str(output_path),
        "rc": rc
    }

def generate_html_report(results):
    """Generate HTML report"""
    success_count = sum(1 for r in results if r["success"])

    by_type = defaultdict(list)
    for r in results:
        by_type[r["type"]].append(r)

    html = f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LCX SDK Generation Report</title>
    <style>
        body {{ font-family: Arial, sans-serif; background: #f5f5f5; padding: 20px; }}
        .container {{ max-width: 1200px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; }}
        h1 {{ color: #1e88e5; border-bottom: 3px solid #1e88e5; padding-bottom: 10px; }}
        .stats {{ display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; margin: 20px 0; }}
        .stat {{ background: #f9f9f9; padding: 20px; border-radius: 8px; text-align: center; }}
        .stat-number {{ font-size: 2em; font-weight: bold; color: #1e88e5; }}
        table {{ width: 100%; border-collapse: collapse; margin-top: 20px; }}
        th, td {{ padding: 12px; text-align: left; border-bottom: 1px solid #eee; }}
        th {{ background: #f5f5f5; font-weight: bold; }}
        tr:hover {{ background: #fafafa; }}
        .success {{ color: #43a047; font-weight: bold; }}
        .failed {{ color: #e53935; font-weight: bold; }}
    </style>
</head>
<body>
    <div class="container">
        <h1>LCX SDK Generation Report</h1>
        <p>Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}</p>

        <div class="stats">
            <div class="stat">
                <div class="stat-number">{len(results)}</div>
                <div>Total Generators</div>
            </div>
            <div class="stat">
                <div class="stat-number success">{success_count}</div>
                <div>Generated</div>
            </div>
            <div class="stat">
                <div class="stat-number failed">{len(results) - success_count}</div>
                <div>Failed</div>
            </div>
            <div class="stat">
                <div class="stat-number">{int(success_count/len(results)*100)}%</div>
                <div>Success Rate</div>
            </div>
        </div>
"""

    if by_type.get("client"):
        html += "<h2>Client SDKs</h2>\n<table><thead><tr><th>Generator</th><th>Status</th></tr></thead><tbody>\n"
        for r in sorted(by_type["client"], key=lambda x: x["generator"]):
            status_class = "success" if r["success"] else "failed"
            status_text = "OK" if r["success"] else "FAILED"
            html += f'<tr><td>{r["generator"]}</td><td><span class="{status_class}">{status_text}</span></td></tr>\n'
        html += "</tbody></table>\n"

    if by_type.get("server"):
        html += "<h2>Server Stubs</h2>\n<table><thead><tr><th>Generator</th><th>Status</th></tr></thead><tbody>\n"
        for r in sorted(by_type["server"], key=lambda x: x["generator"]):
            status_class = "success" if r["success"] else "failed"
            status_text = "OK" if r["success"] else "FAILED"
            html += f'<tr><td>{r["generator"]}</td><td><span class="{status_class}">{status_text}</span></td></tr>\n'
        html += "</tbody></table>\n"

    html += """
    </div>
</body>
</html>
"""

    with open(REPORT_FILE, "w", encoding="utf-8") as f:
        f.write(html)

def main():
    if not os.path.isfile(INPUT_SPEC):
        print(f"[ERROR] File '{INPUT_SPEC}' not found")
        sys.exit(1)

    # Find generator
    gen_cmd = find_generator_command()
    if not gen_cmd:
        print("[ERROR] openapi-generator not found!")
        print("[INFO] Install: npm install @openapitools/openapi-generator-cli -g")
        sys.exit(1)

    # Check version
    stdout, stderr, rc = run_command(gen_cmd + ["version"])
    if rc != 0:
        print(f"[ERROR] Generator check failed: {stderr}")
        sys.exit(1)

    print(f"[OK] Generator version: {stdout.strip()}\n")

    # Get available generators
    available_clients, available_servers = get_available_generators(gen_cmd)
    print(f"[OK] Found {len(available_clients)} client + {len(available_servers)} server generators\n")

    # Prepare output
    OUTPUT_DIR.mkdir(exist_ok=True)
    if LOG_FILE.exists():
        LOG_FILE.unlink()

    tasks = []

    # Add client SDKs
    for gen in CLIENT_GENERATORS:
        if gen in available_clients:
            safe_name = re.sub(r'[\\/*?:"<>|]', "_", gen)
            out_path = OUTPUT_DIR / f"client_{safe_name}"
            tasks.append((gen_cmd, gen, out_path, "client"))

    # Add remaining clients
    for gen in available_clients:
        if gen not in CLIENT_GENERATORS:
            safe_name = re.sub(r'[\\/*?:"<>|]', "_", gen)
            out_path = OUTPUT_DIR / f"client_{safe_name}"
            tasks.append((gen_cmd, gen, out_path, "client"))

    # Add server SDKs
    for gen in SERVER_GENERATORS:
        if gen in available_servers:
            safe_name = re.sub(r'[\\/*?:"<>|]', "_", gen)
            out_path = OUTPUT_DIR / f"server_{safe_name}"
            tasks.append((gen_cmd, gen, out_path, "server"))

    # Add remaining servers
    for gen in available_servers:
        if gen not in SERVER_GENERATORS:
            safe_name = re.sub(r'[\\/*?:"<>|]', "_", gen)
            out_path = OUTPUT_DIR / f"server_{safe_name}"
            tasks.append((gen_cmd, gen, out_path, "server"))

    print(f"[*] Total tasks: {len(tasks)} generators")
    print(f"[*] Parallel workers: {MAX_WORKERS}\n")

    results = []
    completed = 0

    # Execute in parallel
    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
        futures = {
            executor.submit(generate_sdk, t[0], t[1], t[2], t[3]): t
            for t in tasks
        }

        for future in as_completed(futures):
            try:
                result = future.result()
                results.append(result)
                completed += 1
                status = "OK" if result["success"] else "FAIL"
                print(f"[{completed:3d}/{len(tasks)}] {status} {result['type']:6s} | {result['generator']}")
            except Exception as e:
                completed += 1
                print(f"[{completed:3d}/{len(tasks)}] ERROR | {str(e)[:50]}")

    # Generate report
    print("\n" + "="*70)
    generate_html_report(results)

    success = sum(1 for r in results if r["success"])
    print(f"\n[OK] COMPLETED: {success}/{len(results)} SDKs generated successfully")
    print(f"[*] Output directory: {OUTPUT_DIR.absolute()}")
    print(f"[*] Report file: {REPORT_FILE.absolute()}")
    print(f"[*] Log file: {LOG_FILE.absolute()}")

if __name__ == "__main__":
    main()
