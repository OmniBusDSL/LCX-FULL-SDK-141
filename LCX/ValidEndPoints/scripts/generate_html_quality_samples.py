#!/usr/bin/env python3
"""
Generează HTML cu samples de calitate (lcx_samplesGood style)
Pentru fiecare endpoint din lcx_samplesGood, cu taburi pentru toate limbajele
"""

from pathlib import Path
import json

HTML_TEMPLATE = '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LCX API - Quality Code Samples</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/atom-one-dark.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js"></script>
    <style>
        * {{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }}
        body {{
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            color: #2c3e50;
        }}
        .container {{
            max-width: 1400px;
            margin: 0 auto;
        }}
        .header {{
            background: white;
            border-radius: 16px;
            padding: 40px;
            margin-bottom: 30px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            text-align: center;
        }}
        h1 {{
            color: #667eea;
            margin-bottom: 15px;
            font-size: 3em;
            font-weight: 800;
        }}
        .subtitle {{
            color: #7f8c8d;
            font-size: 1.2em;
            margin-bottom: 30px;
        }}
        .stats {{
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }}
        .stat {{
            text-align: center;
            padding: 20px;
        }}
        .stat-number {{
            font-size: 2.5em;
            color: #667eea;
            font-weight: bold;
        }}
        .stat-label {{
            color: #7f8c8d;
            font-size: 0.95em;
            margin-top: 8px;
        }}

        /* Navigation */
        .nav-container {{
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            flex-wrap: wrap;
            background: white;
            padding: 15px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }}

        .nav-category {{
            font-weight: 600;
            color: #667eea;
            padding: 8px 0;
            min-width: 150px;
        }}

        .endpoint-tabs {{
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }}

        .endpoint-tab {{
            padding: 10px 18px;
            cursor: pointer;
            background: #ecf0f1;
            border-radius: 8px;
            transition: 0.3s;
            border: 2px solid transparent;
            font-weight: 500;
            font-size: 0.9em;
        }}
        .endpoint-tab:hover {{
            background: #dde4ea;
            transform: translateY(-2px);
        }}
        .endpoint-tab.active {{
            background: #667eea;
            color: white;
            border-color: #5568d3;
        }}

        /* Content area */
        .content-area {{
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            padding: 40px;
            margin-bottom: 30px;
        }}

        .endpoint-content {{
            display: none;
        }}
        .endpoint-content.active {{
            display: block;
            animation: slideIn 0.3s ease;
        }}

        @keyframes slideIn {{
            from {{
                opacity: 0;
                transform: translateY(10px);
            }}
            to {{
                opacity: 1;
                transform: translateY(0);
            }}
        }}

        .endpoint-title {{
            font-size: 2em;
            color: #667eea;
            margin-bottom: 10px;
            padding-bottom: 15px;
            border-bottom: 3px solid #667eea;
        }}

        .endpoint-meta {{
            color: #7f8c8d;
            font-size: 0.95em;
            margin-bottom: 25px;
        }}

        /* Language tabs */
        .lang-tabs {{
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            margin-bottom: 20px;
            border-bottom: 2px solid #ecf0f1;
            padding-bottom: 12px;
        }}

        .lang-tab {{
            padding: 9px 16px;
            cursor: pointer;
            background: #f0f2f5;
            border-radius: 6px;
            transition: 0.2s;
            border: 2px solid transparent;
            font-weight: 500;
            font-size: 0.9em;
        }}
        .lang-tab:hover {{
            background: #e0e5ed;
        }}
        .lang-tab.active {{
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-color: #667eea;
        }}

        .lang-content {{
            display: none;
        }}
        .lang-content.active {{
            display: block;
        }}

        /* Code area */
        .code-wrapper {{
            position: relative;
            background: #2d2d2d;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.3);
        }}

        .code-header {{
            background: #1a1a1a;
            padding: 12px 16px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #444;
        }}

        .code-filename {{
            color: #f8f8f2;
            font-weight: 600;
            font-size: 0.9em;
        }}

        .copy-button {{
            background: #667eea;
            color: white;
            border: none;
            padding: 6px 14px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            font-size: 0.85em;
            transition: 0.2s;
        }}
        .copy-button:hover {{
            background: #764ba2;
        }}
        .copy-button.copied {{
            background: #27ae60;
        }}

        pre {{
            margin: 0;
            padding: 20px;
            overflow-x: auto;
            font-family: 'Courier New', 'Monaco', 'Ubuntu Mono', monospace;
            font-size: 13px;
            line-height: 1.6;
        }}

        code {{
            font-family: 'Courier New', 'Monaco', 'Ubuntu Mono', monospace;
        }}

        .hljs {{
            background: none !important;
        }}

        footer {{
            text-align: center;
            padding: 30px 20px;
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.9em;
        }}

        footer a {{
            color: white;
            text-decoration: none;
            font-weight: 600;
        }}
        footer a:hover {{
            text-decoration: underline;
        }}

        .info-box {{
            background: #e8f4f8;
            border-left: 4px solid #667eea;
            padding: 16px;
            margin-bottom: 20px;
            border-radius: 6px;
            color: #2c3e50;
        }}
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>LCX Exchange API</h1>
            <p class="subtitle">Production-Ready Code Samples</p>
            <div class="stats">
                <div class="stat">
                    <div class="stat-number">{endpoint_count}</div>
                    <div class="stat-label">Endpoints</div>
                </div>
                <div class="stat">
                    <div class="stat-number">{language_count}</div>
                    <div class="stat-label">Languages</div>
                </div>
                <div class="stat">
                    <div class="stat-number">{total_count}</div>
                    <div class="stat-label">Examples</div>
                </div>
            </div>
        </div>

        <div class="content-area">
            <div id="navContainer"></div>
            <div id="contentContainer"></div>
        </div>

        <footer>
            <p>LCX Exchange API - Open Source Code Samples</p>
            <p>Visit <a href="https://lcx.com">lcx.com</a> | <a href="https://github.com/OmniBusDSL/LCX-FULL-SDK-141">GitHub Repository</a></p>
            <p style="margin-top: 15px; opacity: 0.7;">Generated with Python | Last updated: 2026-03-21</p>
        </footer>
    </div>

    <script>
        const endpoints = {json_data};

        function initUI() {{
            const navContainer = document.getElementById('navContainer');
            const contentContainer = document.getElementById('contentContainer');

            const categories = {{}};

            // Group endpoints by first word (Market/Trading/Account)
            Object.keys(endpoints).forEach(ep => {{
                const cat = ep.includes('_') ? ep.split('_')[0] : 'Other';
                if (!categories[cat]) categories[cat] = [];
                categories[cat].push(ep);
            }});

            let isFirst = true;

            // Create navigation
            Object.entries(categories).forEach(([category, eps]) => {{
                const nav = document.createElement('div');
                nav.style.marginBottom = '20px';

                const catLabel = document.createElement('div');
                catLabel.className = 'nav-category';
                catLabel.textContent = category.toUpperCase() + ' API';
                nav.appendChild(catLabel);

                const tabsDiv = document.createElement('div');
                tabsDiv.className = 'endpoint-tabs';

                eps.forEach(ep => {{
                    const tab = document.createElement('button');
                    tab.className = 'endpoint-tab' + (isFirst ? ' active' : '');
                    tab.textContent = ep.replace(/_/g, ' ').toUpperCase();
                    tab.onclick = () => switchEndpoint(ep);
                    tabsDiv.appendChild(tab);

                    if (isFirst) {{
                        createEndpointContent(contentContainer, ep, endpoints[ep]);
                        isFirst = false;
                    }}
                }});

                nav.appendChild(tabsDiv);
                navContainer.appendChild(nav);
            }});

            // Create all endpoint contents
            Object.entries(endpoints).forEach(([ep, langs]) => {{
                if (!document.getElementById('ep-' + ep)) {{
                    createEndpointContent(contentContainer, ep, langs);
                }}
            }});
        }}

        function createEndpointContent(container, epName, languages) {{
            const content = document.createElement('div');
            content.className = 'endpoint-content' + (document.querySelectorAll('.endpoint-content').length === 0 ? ' active' : '');
            content.id = 'ep-' + epName;

            const title = document.createElement('h2');
            title.className = 'endpoint-title';
            title.textContent = epName.replace(/_/g, ' ').toUpperCase();
            content.appendChild(title);

            const meta = document.createElement('div');
            meta.className = 'endpoint-meta';
            meta.textContent = Object.keys(languages).length + ' language examples available';
            content.appendChild(meta);

            const langTabs = document.createElement('div');
            langTabs.className = 'lang-tabs';

            let isFirstLang = true;
            Object.entries(languages).forEach(([lang, code]) => {{
                const tab = document.createElement('button');
                tab.className = 'lang-tab' + (isFirstLang ? ' active' : '');
                tab.textContent = lang;
                tab.onclick = () => switchLanguage(epName, lang);
                langTabs.appendChild(tab);

                const langContent = document.createElement('div');
                langContent.className = 'lang-content' + (isFirstLang ? ' active' : '');
                langContent.id = 'lang-' + epName + '-' + lang;

                const codeWrapper = document.createElement('div');
                codeWrapper.className = 'code-wrapper';

                const codeHeader = document.createElement('div');
                codeHeader.className = 'code-header';

                const filename = document.createElement('div');
                filename.className = 'code-filename';
                filename.textContent = lang + '.' + getExt(lang);
                codeHeader.appendChild(filename);

                const copyBtn = document.createElement('button');
                copyBtn.className = 'copy-button';
                copyBtn.textContent = '📋 Copy';
                copyBtn.onclick = (e) => {{
                    const codeText = code;
                    navigator.clipboard.writeText(codeText).then(() => {{
                        const btn = e.target;
                        const origText = btn.textContent;
                        btn.textContent = '✓ Copied!';
                        btn.classList.add('copied');
                        setTimeout(() => {{
                            btn.textContent = origText;
                            btn.classList.remove('copied');
                        }}, 2000);
                    }});
                }};
                codeHeader.appendChild(copyBtn);

                codeWrapper.appendChild(codeHeader);

                const pre = document.createElement('pre');
                const codeEl = document.createElement('code');
                codeEl.className = 'language-' + getLangClass(lang);
                codeEl.textContent = code;
                pre.appendChild(codeEl);
                codeWrapper.appendChild(pre);

                langContent.appendChild(codeWrapper);
                content.appendChild(langContent);
                isFirstLang = false;
            }});

            content.insertBefore(langTabs, content.querySelector('.lang-tabs') || content.firstChild);
            container.appendChild(content);

            // Highlight code
            setTimeout(() => {{
                document.querySelectorAll('pre code').forEach(block => {{
                    hljs.highlightElement(block);
                }});
            }}, 100);
        }}

        function getExt(lang) {{
            const exts = {{
                'python': 'py', 'javascript': 'js', 'java': 'java',
                'golang': 'go', 'php': 'php', 'typescript': 'ts',
                'csharp': 'cs', 'rust': 'rs', 'kotlin': 'kt', 'swift': 'swift',
                'ruby': 'rb', 'scala': 'scala', 'dart': 'dart', 'bash': 'sh',
                'perl': 'pl', 'lua': 'lua', 'r': 'r', 'elixir': 'ex',
                'clojure': 'clj', 'haskell': 'hs', 'julia': 'jl', 'crystal': 'cr',
                'nim': 'nim', 'c': 'c', 'ada': 'ada', 'erlang': 'erl',
                'groovy': 'groovy', 'powershell': 'ps1', 'objective-c': 'm',
                'ocaml': 'ml', 'n4js': 'n4js', 'apex': 'apex', 'eiffel': 'e',
            }};
            return exts[lang] || lang;
        }}

        function getLangClass(lang) {{
            const classes = {{
                'python': 'python', 'javascript': 'javascript', 'java': 'java',
                'golang': 'go', 'go': 'go', 'php': 'php', 'typescript': 'typescript',
                'csharp': 'csharp', 'rust': 'rust', 'kotlin': 'kotlin', 'swift': 'swift',
                'ruby': 'ruby', 'scala': 'scala', 'dart': 'dart', 'bash': 'bash',
                'perl': 'perl', 'lua': 'lua', 'r': 'r', 'elixir': 'elixir',
                'clojure': 'clojure', 'haskell': 'haskell', 'julia': 'julia', 'crystal': 'crystal',
            }};
            return classes[lang] || 'plaintext';
        }}

        function switchEndpoint(name) {{
            document.querySelectorAll('.endpoint-content').forEach(el => {{
                el.classList.remove('active');
            }});
            document.querySelectorAll('.endpoint-tab').forEach(el => {{
                el.classList.remove('active');
            }});

            document.getElementById('ep-' + name).classList.add('active');
            event.target.classList.add('active');
        }}

        function switchLanguage(ep, lang) {{
            const parent = document.getElementById('ep-' + ep);
            parent.querySelectorAll('.lang-content').forEach(el => {{
                el.classList.remove('active');
            }});
            parent.querySelectorAll('.lang-tab').forEach(el => {{
                el.classList.remove('active');
            }});

            document.getElementById('lang-' + ep + '-' + lang).classList.add('active');
            event.target.classList.add('active');
        }}

        document.addEventListener('DOMContentLoaded', initUI);
    </script>
</body>
</html>
'''

def main():
    # Load lcx_samples_practical (quality samples, 25 practical languages with HTTP)
    good_dir = Path("lcx_samples_practical")

    if not good_dir.exists():
        print("[FAIL] lcx_samplesGood directory not found")
        return

    endpoints = {}

    # Load good samples
    for endpoint_dir in sorted(good_dir.iterdir()):
        if not endpoint_dir.is_dir():
            continue

        ep_name = endpoint_dir.name.lower().replace(" ", "_")
        endpoints[ep_name] = {}

        for code_file in sorted(endpoint_dir.iterdir()):
            if code_file.is_file() and code_file.suffix in ['.py', '.js', '.java', '.go', '.php', '.rs', '.kt', '.swift', '.rb', '.scala', '.ts', '.cs', '.pl', '.lua', '.sh', '.clj', '.hs', '.jl', '.cr', '.nim', '.c', '.ada', '.erl', '.groovy', '.ps1', '.m', '.ml', '.n4js', '.apex', '.e']:
                lang_name = code_file.stem
                try:
                    code = code_file.read_text(encoding='utf-8')
                    endpoints[ep_name][lang_name] = code
                except:
                    pass

    if not endpoints:
        print("[FAIL] No samples found in lcx_samples_practical")
        return

    endpoint_count = len(endpoints)
    language_count = len(set(lang for ep in endpoints.values() for lang in ep.keys()))
    total_count = sum(len(ep) for ep in endpoints.values())

    json_data = json.dumps(endpoints)

    html_content = HTML_TEMPLATE.format(
        endpoint_count=endpoint_count,
        language_count=language_count,
        total_count=total_count,
        json_data=json_data
    )

    output_file = Path("lcx_samples_quality.html")
    output_file.write_text(html_content, encoding='utf-8')

    size_kb = len(html_content) / 1024
    print(f"[OK] Generated lcx_samples_quality.html ({size_kb:.1f} KB)")
    print(f"[OK] Endpoints: {endpoint_count}")
    print(f"[OK] Languages: {language_count}")
    print(f"[OK] Total samples: {total_count}")

if __name__ == "__main__":
    main()
