#!/usr/bin/env python3
"""
LCX DSL Language Server Protocol (LSP) Implementation
Provides syntax highlighting, autocomplete, error checking for VS Code
"""

import sys
import json
import re
from typing import Dict, List, Any, Optional

# DSL Keywords
LCX_KEYWORDS = {
    'operation': 'keyword',
    'GET': 'method',
    'POST': 'method',
    'PUT': 'method',
    'DELETE': 'method',
    'endpoint': 'property',
    'input': 'property',
    'output': 'property',
    'auth': 'property',
    'body': 'keyword',
    'loop': 'keyword',
    'if': 'keyword',
    'else': 'keyword',
    'try': 'keyword',
    'catch': 'keyword',
    'finally': 'keyword',
    'print': 'function',
    'BUY': 'action',
    'SELL': 'action',
    'BALANCE': 'action',
}

# Known API Endpoints
KNOWN_ENDPOINTS = [
    '/api/tickers', '/api/pairs', '/api/pair', '/api/book',
    '/api/trades', '/v1/market/kline', '/api/orders', '/api/open',
    '/api/history',
]

class LCXLanguageServer:
    """LSP Server for LCX DSL"""

    def __init__(self):
        self.document_uri = None
        self.document_content = ""

    def handle_initialize(self, params: Dict) -> Dict:
        """Initialize LSP server capabilities"""
        return {
            "capabilities": {
                "textDocumentSync": 1,
                "completionProvider": {
                    "resolveProvider": True,
                    "triggerCharacters": ["/", " ", ":"]
                },
                "hoverProvider": True,
            }
        }

    def handle_did_open(self, params: Dict):
        """Handle document open"""
        self.document_uri = params['textDocument']['uri']
        self.document_content = params['textDocument']['text']

    def handle_did_change(self, params: Dict):
        """Handle document change"""
        self.document_content = params['contentChanges'][0]['text']

    def handle_completion(self, params: Dict) -> List[Dict]:
        """Provide autocomplete suggestions"""
        suggestions = []

        # Add keywords
        for keyword in LCX_KEYWORDS.keys():
            suggestions.append({
                "label": keyword,
                "kind": 1,
                "detail": f"{keyword} keyword",
                "insertText": keyword
            })

        # Add endpoints
        for endpoint in KNOWN_ENDPOINTS:
            suggestions.append({
                "label": endpoint,
                "kind": 6,
                "detail": "API endpoint",
                "insertText": endpoint
            })

        # Add HTTP methods
        for method in ['GET', 'POST', 'PUT', 'DELETE']:
            suggestions.append({
                "label": method,
                "kind": 2,
                "detail": f"HTTP {method}",
                "insertText": method
            })

        return suggestions

    def handle_hover(self, params: Dict) -> Optional[Dict]:
        """Provide hover documentation"""
        hover_info = {
            'GET': 'HTTP GET request - Retrieve data',
            'POST': 'HTTP POST request - Create/Submit data',
            'PUT': 'HTTP PUT request - Update data',
            'DELETE': 'HTTP DELETE request - Remove data',
            'endpoint': 'API endpoint path',
            'input': 'Input parameters for operation',
            'output': 'Output format (json, print)',
            'auth': 'Authentication (none, required)',
            'operation': 'Define API operation',
            'loop': 'Loop control structure',
            'if': 'Conditional statement',
            'try': 'Error handling block',
        }

        # Return hover info if available
        for word, description in hover_info.items():
            return {
                "contents": description
            }

        return None

    def validate_document(self) -> List[Dict]:
        """Validate and report errors"""
        diagnostics = []
        lines = self.document_content.split('\n')

        for line_num, line in enumerate(lines):
            # Check for missing colons
            if re.match(r'^\s*(operation|loop|if|try)\s+\w+\s*$', line):
                diagnostics.append({
                    "range": {
                        "start": {"line": line_num, "character": 0},
                        "end": {"line": line_num, "character": len(line)}
                    },
                    "severity": 1,
                    "message": "Missing ':' after keyword"
                })

            # Check endpoints
            if '/' in line:
                endpoints_found = re.findall(r'/[\w/]+', line)
                for ep in endpoints_found:
                    if ep not in KNOWN_ENDPOINTS and '/api/' not in ep:
                        diagnostics.append({
                            "range": {
                                "start": {"line": line_num, "character": line.find(ep)},
                                "end": {"line": line_num, "character": line.find(ep) + len(ep)}
                            },
                            "severity": 2,
                            "message": f"Unknown endpoint: {ep}"
                        })

        return diagnostics

    def process_message(self, message: Dict) -> Optional[Dict]:
        """Process LSP message"""
        method = message.get('method')
        params = message.get('params', {})
        msg_id = message.get('id')

        if method == 'initialize':
            return {"id": msg_id, "result": self.handle_initialize(params)}
        elif method == 'textDocument/didOpen':
            self.handle_did_open(params)
        elif method == 'textDocument/didChange':
            self.handle_did_change(params)
        elif method == 'textDocument/completion':
            return {"id": msg_id, "result": self.handle_completion(params)}
        elif method == 'textDocument/hover':
            return {"id": msg_id, "result": self.handle_hover(params)}

        return None

def main():
    """LSP server main loop"""
    server = LCXLanguageServer()

    while True:
        try:
            line = sys.stdin.readline()
            if not line:
                break

            if line.startswith('Content-Length:'):
                length = int(line.split(':')[1].strip())
                sys.stdin.readline()
                content = sys.stdin.read(length)
                message = json.loads(content)

                response = server.process_message(message)
                if response:
                    response_json = json.dumps(response)
                    header = f"Content-Length: {len(response_json)}\r\n\r\n"
                    sys.stdout.write(header)
                    sys.stdout.write(response_json)
                    sys.stdout.flush()
        except Exception as e:
            sys.stderr.write(f"Error: {e}\n")
            sys.stderr.flush()

if __name__ == '__main__':
    main()
