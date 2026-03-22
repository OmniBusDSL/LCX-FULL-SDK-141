import json
import sys
import os
from pathlib import Path

def main():
    if len(sys.argv) != 2:
        print("Usage: python lcx-api-wrapper.py <openapi_json_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_dir = Path('lcx_samples')
    output_dir.mkdir(exist_ok=True)

    try:
        with open(input_file, 'r', encoding='utf-8') as f:
            spec = json.load(f)
    except Exception as e:
        print(f"Eroare la citirea fișierului {input_file}: {e}")
        sys.exit(1)

    # Mapează numele limbajului la extensia fișierului
    ext_map = {
        'javascript': 'js',
        'python': 'py',
        'java': 'java',
        'golang': 'go',
        'php': 'php'
    }

    total_saved = 0
    for path, methods in spec['paths'].items():
        for method, operation in methods.items():
            # Folosește summary-ul endpoint-ului sau calea curățată
            endpoint_name = operation.get('summary', path).replace(' ', '_').replace('/', '_')
            samples = operation.get('x-codeSamples', [])
            if not samples:
                continue
            endpoint_dir = output_dir / endpoint_name
            endpoint_dir.mkdir(exist_ok=True)
            for sample in samples:
                lang = sample.get('lang', '').lower()
                if lang not in ext_map:
                    continue
                code = sample.get('source', '')
                ext = ext_map[lang]
                file_path = endpoint_dir / f"{lang}.{ext}"
                file_path.write_text(code, encoding='utf-8')
                total_saved += 1
            print(f"Salvat {len(samples)} mostre pentru {endpoint_name}")

    print(f"\n✅ Procesare finalizată. {total_saved} fișiere salvate în {output_dir.absolute()}")

if __name__ == '__main__':
    main()