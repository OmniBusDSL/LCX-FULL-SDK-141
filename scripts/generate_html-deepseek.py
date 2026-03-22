import os
import html
from pathlib import Path

def generate_html_samples(root_dir='lcx_samples', output_file='lcx_samples.html'):
    root = Path(root_dir)
    if not root.exists():
        print(f"Directorul {root_dir} nu există.")
        return

    # Colectează toate endpoint-urile și fișierele
    endpoints = {}
    for ep_dir in root.iterdir():
        if ep_dir.is_dir():
            ep_name = ep_dir.name
            files = {}
            for lang_file in ep_dir.glob('*'):
                ext = lang_file.suffix.lower()
                lang_map = {'.js': 'javascript', '.py': 'python', '.java': 'java', '.go': 'golang', '.php': 'php'}
                lang = lang_map.get(ext)
                if lang:
                    try:
                        content = lang_file.read_text(encoding='utf-8')
                        files[lang] = content
                    except Exception as e:
                        print(f"Eroare la citirea {lang_file}: {e}")
            if files:
                endpoints[ep_name] = files

    if not endpoints:
        print("Nu s-au găsit endpoint-uri cu exemple.")
        return

    # Construiește HTML-ul
    # Header
    html_content = """<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LCX API - Request Samples</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            padding: 20px;
            color: #2c3e50;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #1e3c72;
        }
        /* Tabs pentru endpoint-uri */
        .endpoint-tabs {
            display: flex;
            flex-wrap: wrap;
            border-bottom: 2px solid #ddd;
            margin-bottom: 20px;
        }
        .endpoint-tab {
            padding: 10px 20px;
            cursor: pointer;
            background: #ecf0f1;
            margin-right: 5px;
            border-radius: 8px 8px 0 0;
            transition: 0.2s;
        }
        .endpoint-tab.active {
            background: #3498db;
            color: white;
            font-weight: bold;
        }
        /* Container pentru conținutul endpoint-ului */
        .endpoint-content {
            display: none;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 20px;
        }
        .endpoint-content.active {
            display: block;
        }
        /* Tabs pentru limbaje (în interior) */
        .lang-tabs {
            display: flex;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
        }
        .lang-tab {
            padding: 8px 16px;
            cursor: pointer;
            background: #f8f9fa;
            margin-right: 5px;
            border-radius: 6px 6px 0 0;
            transition: 0.2s;
        }
        .lang-tab.active {
            background: #2ecc71;
            color: white;
            font-weight: bold;
        }
        .lang-content {
            display: none;
        }
        .lang-content.active {
            display: block;
        }
        pre {
            background: #2d2d2d;
            color: #f8f8f2;
            padding: 15px;
            border-radius: 6px;
            overflow-x: auto;
            font-family: 'Courier New', monospace;
            font-size: 14px;
        }
        code {
            font-family: 'Courier New', monospace;
        }
        .endpoint-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>LCX API v1.1.0 – Request Samples</h1>

    <div class="endpoint-tabs">
"""

    # Adaugă tab-urile pentru fiecare endpoint
    endpoint_ids = []
    for i, ep_name in enumerate(endpoints.keys()):
        ep_id = f"ep_{i}"
        endpoint_ids.append(ep_id)
        active_class = ' active' if i == 0 else ''
        html_content += f'        <div class="endpoint-tab{active_class}" data-endpoint="{ep_id}">{ep_name}</div>\n'

    html_content += '    </div>\n'

    # Adaugă conținutul pentru fiecare endpoint
    for i, (ep_name, files) in enumerate(endpoints.items()):
        ep_id = endpoint_ids[i]
        active_class = ' active' if i == 0 else ''
        html_content += f'    <div id="{ep_id}" class="endpoint-content{active_class}">\n'
        html_content += f'        <div class="endpoint-title">{ep_name}</div>\n'
        html_content += '        <div class="lang-tabs">\n'

        # Crează lista limbajelor disponibile (pastrând o ordine)
        order = ['javascript', 'python', 'java', 'golang', 'php']
        lang_names = {'javascript': 'JavaScript', 'python': 'Python', 'java': 'Java', 'golang': 'Golang', 'php': 'PHP'}
        lang_list = [(lang, lang_names[lang]) for lang in order if lang in files]

        # Adaugă tab-urile pentru limbaje
        for j, (lang_key, lang_display) in enumerate(lang_list):
            active_tab = ' active' if j == 0 else ''
            html_content += f'            <div class="lang-tab{active_tab}" data-lang="{lang_key}">{lang_display}</div>\n'
        html_content += '        </div>\n'

        # Adaugă conținutul pentru fiecare limbaj
        for j, (lang_key, lang_display) in enumerate(lang_list):
            active_content = ' active' if j == 0 else ''
            code = files[lang_key]
            # Escape pentru caractere speciale (deși pre va păstra, dar pentru siguranță)
            code_escaped = html.escape(code)
            html_content += f'        <div class="lang-content{active_content}" data-lang="{lang_key}">\n'
            html_content += f'            <pre><code>{code_escaped}</code></pre>\n'
            html_content += '        </div>\n'

        html_content += '    </div>\n'

    # Adaugă JavaScript pentru interacțiune
    html_content += """
</div>

<script>
    // Comută între endpoint-uri
    const endpointTabs = document.querySelectorAll('.endpoint-tab');
    const endpointContents = document.querySelectorAll('.endpoint-content');

    endpointTabs.forEach(tab => {
        tab.addEventListener('click', () => {
            const target = tab.dataset.endpoint;
            endpointTabs.forEach(t => t.classList.remove('active'));
            endpointContents.forEach(c => c.classList.remove('active'));
            tab.classList.add('active');
            document.getElementById(target).classList.add('active');
        });
    });

    // Comută între limbaje în interiorul fiecărui endpoint
    document.querySelectorAll('.endpoint-content').forEach(content => {
        const langTabs = content.querySelectorAll('.lang-tab');
        const langContents = content.querySelectorAll('.lang-content');

        langTabs.forEach(tab => {
            tab.addEventListener('click', () => {
                const lang = tab.dataset.lang;
                langTabs.forEach(t => t.classList.remove('active'));
                langContents.forEach(c => c.classList.remove('active'));
                tab.classList.add('active');
                content.querySelector(`.lang-content[data-lang="${lang}"]`).classList.add('active');
            });
        });
    });
</script>
</body>
</html>
"""

    # Scrie fișierul HTML
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(html_content)

    print(f"Fișier HTML generat: {output_file}")

if __name__ == '__main__':
    generate_html_samples()