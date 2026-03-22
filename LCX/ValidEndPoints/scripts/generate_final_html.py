#!/usr/bin/env python3
from pathlib import Path
import json

def main():
    final_dir = Path('lcx_samples_77language')
    endpoints = {}

    for ep_dir in sorted(final_dir.iterdir()):
        if ep_dir.is_dir():
            ep_name = ep_dir.name
            endpoints[ep_name] = {}
            for code_file in sorted(ep_dir.iterdir()):
                if code_file.is_file():
                    lang = code_file.stem
                    endpoints[ep_name][lang] = code_file.read_text()

    json_data = json.dumps(endpoints)

    html = f'''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LCX API - Code Samples</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/atom-one-dark.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js"></script>
    <style>
        * {{ margin: 0; padding: 0; box-sizing: border-box; }}
        body {{ font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; padding: 20px; }}
        .container {{ max-width: 1400px; margin: 0 auto; }}
        .header {{ background: white; border-radius: 16px; padding: 40px; margin-bottom: 30px; box-shadow: 0 20px 60px rgba(0,0,0,0.3); text-align: center; }}
        h1 {{ color: #667eea; font-size: 2.5em; margin-bottom: 15px; }}
        .subtitle {{ color: #7f8c8d; font-size: 1.1em; margin-bottom: 30px; }}
        .stats {{ display: flex; justify-content: space-around; flex-wrap: wrap; gap: 20px; }}
        .stat {{ text-align: center; }}
        .stat-number {{ font-size: 2em; color: #667eea; font-weight: bold; }}
        .stat-label {{ color: #7f8c8d; margin-top: 5px; }}
        .nav {{ background: white; padding: 15px; border-radius: 12px; margin-bottom: 20px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }}
        .nav-tabs {{ display: flex; flex-wrap: wrap; gap: 8px; }}
        .nav-tab {{ padding: 10px 18px; background: #ecf0f1; border-radius: 8px; cursor: pointer; transition: 0.2s; border: 2px solid transparent; font-weight: 500; }}
        .nav-tab:hover {{ background: #dde4ea; }}
        .nav-tab.active {{ background: #667eea; color: white; }}
        .content {{ background: white; border-radius: 16px; box-shadow: 0 10px 40px rgba(0,0,0,0.2); padding: 40px; }}
        .endpoint {{ display: none; }}
        .endpoint.active {{ display: block; }}
        .ep-title {{ font-size: 1.8em; color: #667eea; margin-bottom: 20px; padding-bottom: 15px; border-bottom: 3px solid #667eea; }}
        .lang-tabs {{ display: flex; flex-wrap: wrap; gap: 6px; margin-bottom: 20px; border-bottom: 2px solid #ecf0f1; padding-bottom: 12px; }}
        .lang-tab {{ padding: 8px 14px; background: #f0f2f5; border-radius: 6px; cursor: pointer; transition: 0.2s; border: 2px solid transparent; }}
        .lang-tab:hover {{ background: #e0e5ed; }}
        .lang-tab.active {{ background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; }}
        .lang-content {{ display: none; }}
        .lang-content.active {{ display: block; }}
        .code-wrap {{ background: #2d2d2d; border-radius: 10px; overflow: hidden; }}
        .code-header {{ background: #1a1a1a; padding: 12px 16px; border-bottom: 1px solid #444; display: flex; justify-content: space-between; align-items: center; }}
        .code-name {{ color: #f8f8f2; font-weight: 600; }}
        .copy-btn {{ background: #667eea; color: white; border: none; padding: 6px 14px; border-radius: 4px; cursor: pointer; font-weight: 500; transition: 0.2s; }}
        .copy-btn:hover {{ background: #764ba2; }}
        pre {{ margin: 0; padding: 20px; overflow-x: auto; }}
        footer {{ text-align: center; color: rgba(255,255,255,0.8); padding: 30px; }}
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>LCX Exchange API</h1>
            <p class="subtitle">Production-Ready Code Samples - All 77 Languages</p>
            <div class="stats">
                <div class="stat"><div class="stat-number">23</div><div class="stat-label">API Endpoints</div></div>
                <div class="stat"><div class="stat-number">77</div><div class="stat-label">Programming Languages</div></div>
                <div class="stat"><div class="stat-number">{sum(len(e) for e in endpoints.values())}</div><div class="stat-label">Code Examples</div></div>
                <div class="stat"><div class="stat-number">23×77</div><div class="stat-label">Complete Coverage</div></div>
            </div>
        </div>
        <div class="nav"><div class="nav-tabs" id="navTabs"></div></div>
        <div class="content" id="content"></div>
        <footer><p>LCX Exchange API - Code Samples</p><p>Visit <a href="https://lcx.com" style="color:white;">lcx.com</a></p></footer>
    </div>
    <script>
        const endpoints = {json_data};
        function init() {{
            const nav = document.getElementById('navTabs');
            const content = document.getElementById('content');
            let first = true;
            Object.entries(endpoints).forEach(([epName, langs]) => {{
                const tab = document.createElement('button');
                tab.className = 'nav-tab' + (first ? ' active' : '');
                tab.textContent = epName.replace(/_/g, ' ').toUpperCase();
                tab.onclick = () => switchEp(epName);
                nav.appendChild(tab);

                const ep = document.createElement('div');
                ep.className = 'endpoint' + (first ? ' active' : '');
                ep.id = 'ep-' + epName;

                const title = document.createElement('div');
                title.className = 'ep-title';
                title.textContent = epName.replace(/_/g, ' ').toUpperCase();
                ep.appendChild(title);

                const lTabs = document.createElement('div');
                lTabs.className = 'lang-tabs';

                let fLang = true;
                Object.entries(langs).forEach(([lang, code]) => {{
                    const lTab = document.createElement('button');
                    lTab.className = 'lang-tab' + (fLang ? ' active' : '');
                    lTab.textContent = lang;
                    lTab.onclick = () => switchLang(epName, lang);
                    lTabs.appendChild(lTab);

                    const lDiv = document.createElement('div');
                    lDiv.className = 'lang-content' + (fLang ? ' active' : '');
                    lDiv.id = 'l-' + epName + '-' + lang;

                    const wrap = document.createElement('div');
                    wrap.className = 'code-wrap';

                    const hdr = document.createElement('div');
                    hdr.className = 'code-header';

                    const nm = document.createElement('div');
                    nm.className = 'code-name';
                    nm.textContent = lang;
                    hdr.appendChild(nm);

                    const btn = document.createElement('button');
                    btn.className = 'copy-btn';
                    btn.textContent = 'Copy';
                    btn.onclick = (e) => {{
                        navigator.clipboard.writeText(code);
                        e.target.textContent = 'Copied!';
                        setTimeout(() => e.target.textContent = 'Copy', 2000);
                    }};
                    hdr.appendChild(btn);
                    wrap.appendChild(hdr);

                    const pre = document.createElement('pre');
                    const codeEl = document.createElement('code');
                    codeEl.textContent = code;
                    pre.appendChild(codeEl);
                    wrap.appendChild(pre);

                    lDiv.appendChild(wrap);
                    ep.appendChild(lDiv);
                    fLang = false;
                }});
                ep.insertBefore(lTabs, ep.querySelector('.lang-content'));
                content.appendChild(ep);
                first = false;
            }});
        }}
        function switchEp(name) {{
            document.querySelectorAll('.endpoint').forEach(e => e.classList.remove('active'));
            document.querySelectorAll('.nav-tab').forEach(e => e.classList.remove('active'));
            document.getElementById('ep-' + name).classList.add('active');
            event.target.classList.add('active');
        }}
        function switchLang(ep, lang) {{
            const p = document.getElementById('ep-' + ep);
            p.querySelectorAll('.lang-content').forEach(e => e.classList.remove('active'));
            p.querySelectorAll('.lang-tab').forEach(e => e.classList.remove('active'));
            document.getElementById('l-' + ep + '-' + lang).classList.add('active');
            event.target.classList.add('active');
        }}
        document.addEventListener('DOMContentLoaded', init);
    </script>
</body>
</html>'''

    Path('lcx_samples.html').write_text(html)
    print(f"[OK] Generated lcx_samples.html")
    print(f"[OK] Endpoints: {len(endpoints)}")
    print(f"[OK] Total samples: {sum(len(e) for e in endpoints.values())}")

if __name__ == '__main__':
    main()
