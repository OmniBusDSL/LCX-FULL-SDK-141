# VS Code Extension Installation Guide

## Quick Start (3 steps)

### 1. Install Dependencies
```bash
cd vscode-extension
npm install
```

### 2. Build Extension
```bash
npm run build
```

### 3. Install in VS Code
```bash
code --install-extension lcx-dsl-1.0.0.vsix
```

OR manually:
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Click "..." menu → "Install from VSIX..."
4. Select the `.vsix` file from build output

---

## Features Included

✅ **Syntax Highlighting**
- Keywords, methods, endpoints with color coding
- Comment support
- Proper indentation rules

✅ **Autocomplete (IntelliSense)**
- Keywords: operation, loop, if, try, catch, finally
- HTTP methods: GET, POST, PUT, DELETE
- Known endpoints: /api/tickers, /api/pairs, /api/book, etc.
- Triggered with: `/`, Space, `:`

✅ **Hover Documentation**
- Descriptions for keywords
- API endpoint information
- Method explanations

✅ **Error Detection**
- Missing colons after keywords
- Unknown endpoint warnings
- Real-time validation

✅ **Language Configuration**
- Auto-closing brackets and quotes
- Comment syntax (#)
- Folding regions
- Indentation rules

---

## File Structure

```
vscode-extension/
├── package.json                  # Extension manifest
├── language-configuration.json   # Language rules
├── syntaxes/
│   └── lcx.tmLanguage.json      # Syntax highlighting grammar
├── server/
│   └── lsp_server.py            # Language Server Protocol
├── client/
│   └── extension.ts             # VS Code extension (TypeScript)
├── README.md                    # User documentation
└── INSTALLATION.md              # This file
```

---

## Usage

### Create LCX File
Save any file with `.lcx` extension:
```bash
market_data.lcx
trading_operations.lcx
place_order.lcx
```

### See Syntax Highlighting
File is automatically highlighted with:
- Blue: Keywords (operation, loop, if, try)
- Green: HTTP methods (GET, POST, etc.)
- Red: Actions (BUY, SELL, BALANCE)
- Purple: Endpoints (/api/...)

### Get Autocomplete Suggestions
Press `Ctrl+Space` or trigger with:
- `/` for endpoints
- Space after keywords
- `:` for properties

### View Documentation
Hover over any keyword to see its description

### Check Errors
Errors appear as red squiggles with descriptions

---

## Uninstall

```bash
code --uninstall-extension lcx.lcx-dsl
```

---

## Development

### Watch Mode (Auto-rebuild)
```bash
npm run watch
```

### Test in VS Code
1. Press F5 in VS Code while in extension folder
2. New VS Code window opens with extension
3. Create `.lcx` file to test
4. Changes auto-reload

---

## Troubleshooting

**Extension not showing?**
- Verify `.lcx` file extension
- Check Extension Activity Log (Output panel)
- Reload VS Code (Ctrl+R)

**Autocomplete not working?**
- Press Ctrl+Space manually
- Ensure file has `.lcx` extension
- Check LSP server status

**Wrong colors?**
- Verify `lcx.tmLanguage.json` exists in `syntaxes/`
- Close and reopen file
- Run `npm run build` again

**Commands not working?**
- Check that LSP server is running
- View errors in Output panel
- Verify Python 3.7+ installed

---

## Requirements

- VS Code 1.70.0 or later
- Python 3.7 or later (for LSP server)
- Node.js 14+ (for development)

---

## Performance

- **Syntax Highlighting**: Instant
- **Autocomplete**: <500ms
- **Error Check**: <200ms per file
- **Hover Info**: Instant

---

## Support

For issues or suggestions:
1. Check existing issues on GitHub
2. Report new issues with `.lcx` file example
3. Include VS Code version and Python version

---

## License

MIT - See LICENSE file
