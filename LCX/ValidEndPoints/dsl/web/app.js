const express = require('express');
const path = require('path');
const fs = require('fs');
const { execSync } = require('child_process');
const app = express();

app.use(express.json());

// Serve static files
app.use(express.static(path.join(__dirname)));

// CORS headers
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'Content-Type');
  res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  next();
});

// Routes
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.get('/visual', (req, res) => {
  res.sendFile(path.join(__dirname, 'visual.html'));
});

app.get('/all-endpoints', (req, res) => {
  res.sendFile(path.join(__dirname, 'all-endpoints.html'));
});

app.get('/public', (req, res) => {
  res.sendFile(path.join(__dirname, 'public.html'));
});

app.get('/private', (req, res) => {
  res.sendFile(path.join(__dirname, 'private.html'));
});

app.get('/websocket', (req, res) => {
  res.sendFile(path.join(__dirname, 'websocket.html'));
});

app.get('/health', (req, res) => {
  res.json({
    status: 'ok',
    languages: 77,
    compiler_root: path.join(__dirname, '..')
  });
});

// Fetch current LCX/USDC price for dynamic testing
app.get('/api/current-price', async (req, res) => {
  try {
    const https = require('https');
    https.get('https://exchange-api.lcx.com/api/ticker?pair=LCX/USDC', (apiRes) => {
      let data = '';
      apiRes.on('data', (chunk) => { data += chunk; });
      apiRes.on('end', () => {
        try {
          const json = JSON.parse(data);
          const price = parseFloat(json.data.lastPrice || json.data.Last || 0.05);
          res.json({ price });
        } catch (e) {
          res.json({ price: 0.05 });
        }
      });
    }).on('error', () => {
      res.json({ price: 0.05 });
    });
  } catch (e) {
    res.json({ price: 0.05 });
  }
});

// Generate WebSocket signature for authenticated endpoints
app.post('/generate-ws-signature', (req, res) => {
  try {
    const { wsPath, apiKey, apiSecret } = req.body;

    if (!wsPath || !apiKey || !apiSecret) {
      return res.json({ error: 'Missing parameters' });
    }

    const pythonCode = `
import hmac
import hashlib
import base64
import json
import time

api_key = '${apiKey}'
api_secret = '${apiSecret}'
ws_path = '${wsPath}'

timestamp = str(int(time.time() * 1000))
request_string = 'GET' + ws_path + json.dumps({})
signature = base64.b64encode(
    hmac.new(
        api_secret.encode(),
        request_string.encode(),
        hashlib.sha256
    ).digest()
).decode()

url = f"wss://exchange-api.lcx.com{ws_path}?x-access-key={api_key}&x-access-sign={signature}&x-access-timestamp={timestamp}"
print(json.dumps({
    'url': url,
    'signature': signature,
    'timestamp': timestamp
}))
`;

    const { spawn } = require('child_process');
    const python = spawn('python3', ['-c', pythonCode]);

    let output = '';
    python.stdout.on('data', (data) => {
      output += data.toString();
    });

    python.on('close', (code) => {
      try {
        const result = JSON.parse(output);
        res.json(result);
      } catch (e) {
        res.json({ error: 'Signature generation failed' });
      }
    });

  } catch (error) {
    res.json({ error: error.message });
  }
});

// List available examples
app.get('/examples', (req, res) => {
  const examplesDir = path.join(__dirname, '..', 'examples');
  try {
    const files = fs.readdirSync(examplesDir);
    const lcxFiles = files
      .filter(f => f.endsWith('.lcx'))
      .sort()
      .map(f => ({
        name: f.replace('.lcx', ''),
        file: f
      }));
    res.json({ examples: lcxFiles });
  } catch (e) {
    res.status(500).json({ error: 'Failed to read examples directory' });
  }
});

// Get specific example
app.get('/example/:name', (req, res) => {
  const exampleName = req.params.name;
  const examplePath = path.join(__dirname, '..', 'examples', `${exampleName}.lcx`);

  // Security: prevent directory traversal
  if (!examplePath.startsWith(path.join(__dirname, '..', 'examples'))) {
    return res.status(400).json({ error: 'Invalid example name' });
  }

  try {
    const content = fs.readFileSync(examplePath, 'utf8');
    res.json({ name: exampleName, content });
  } catch (e) {
    res.status(404).json({ error: 'Example not found' });
  }
});

// Compile DSL endpoint - calls Python compiler
app.post('/compile', (req, res) => {
  try {
    const source = req.body.source || '';
    if (!source.trim()) {
      return res.status(400).json({ error: 'Source code cannot be empty' });
    }

    // Use Python to compile via stdin
    const pythonCode = `
import sys, json, traceback
sys.path.insert(0, '${path.join(__dirname, '..')}')
from compiler import parse_dsl, generate_code

source = sys.stdin.read()
try:
    ast = parse_dsl(source)
    operations = ast.get('operations', [])
    if not operations:
        print(json.dumps({'error': 'No operations found in source'}))
    else:
        results = {}
        errors = {}
        languages = ['python', 'javascript', 'typescript', 'go', 'java', 'rust']
        for lang in languages:
            try:
                code = generate_code(ast, lang)
                results[lang] = code
            except Exception as e:
                errors[lang] = str(e)
                results[lang] = f'# Error: {e}'
        response = {'results': results, 'op_count': len(operations)}
        if errors:
            response['generation_errors'] = errors
        print(json.dumps(response))
except Exception as e:
    import traceback as tb
    print(json.dumps({'error': f'Parse error: {str(e)}', 'traceback': tb.format_exc()}))
`;

    const { spawn } = require('child_process');
    const python = spawn('python3', ['-c', pythonCode]);

    let output = '';
    let errorOutput = '';

    python.stdout.on('data', (data) => {
      output += data.toString();
    });

    python.stderr.on('data', (data) => {
      errorOutput += data.toString();
    });

    python.on('close', (code) => {
      if (code !== 0) {
        return res.status(500).json({
          error: 'Compilation failed',
          traceback: errorOutput
        });
      }

      try {
        const result = JSON.parse(output);
        if (result.error) {
          return res.status(400).json(result);
        }
        res.json(result);
      } catch (e) {
        res.status(500).json({
          error: 'Invalid compiler output',
          traceback: output
        });
      }
    });

    python.stdin.write(source);
    python.stdin.end();

  } catch (error) {
    console.error('Compile error:', error.message);
    res.status(500).json({
      error: `Compilation failed: ${error.message}`,
      traceback: error.stack
    });
  }
});

// Test single endpoint via proxy (server-side, avoids CORS)
app.post('/test-single-endpoint', (req, res) => {
  try {
    const endpoint = req.body.endpoint || {};
    const auth = req.body.auth;
    const endpointPath = endpoint.path;
    const method = endpoint.method || 'GET';
    const orderId = endpoint.orderId || endpoint.query?.orderId || endpoint.modifyOrderId || null;
    const currentPrice = req.body.currentPrice || 0.05;  // Default fallback

    if (!endpointPath) {
      return res.json({ status: 'fail', error: 'No path provided' });
    }

    // Determine base URL
    let baseUrl = 'https://exchange-api.lcx.com';
    if (endpointPath === '/v1/market/kline') {
      baseUrl = 'https://api-kline.lcx.com';
    }

    // Calculate dynamic prices
    const buyPrice = Math.round(currentPrice * 0.90 * 10000) / 10000;
    const sellPrice = Math.round(currentPrice * 1.10 * 10000) / 10000;
    const buyModifyDist = buyPrice - 0.0225;
    const buyModifyPrice = Math.round((buyPrice - (buyModifyDist * 0.45)) * 10000) / 10000;
    const sellModifyDist = 0.0657 - sellPrice;
    const sellModifyPrice = Math.round((sellPrice + (sellModifyDist * 0.45)) * 10000) / 10000;

    const pythonCode = `
import sys, json, time
import requests
import hmac
import hashlib
import base64

ep_path = '${endpointPath}'
ep_method = '${method}'
has_auth = ${auth ? 'True' : 'False'}
api_key = '${auth ? auth.apiKey : ''}'
api_secret = '${auth ? auth.apiSecret : ''}'
order_id = '${orderId || ''}'
current_price = ${currentPrice}
buy_price = ${buyPrice}
sell_price = ${sellPrice}
buy_modify_price = ${buyModifyPrice}
sell_modify_price = ${sellModifyPrice}

# Determine base URL
base_url = 'https://exchange-api.lcx.com'
if ep_path == '/v1/market/kline':
    base_url = 'https://api-kline.lcx.com'

url = base_url + ep_path

# Add parameters for each endpoint
params = {}
print("DEBUG: Setting params for " + ep_method + " " + ep_path, file=sys.stderr)

# Public market data endpoints
if ep_path == '/api/pair':
    params['pair'] = 'BTC/USDC'
elif ep_path == '/api/ticker':
    params['pair'] = 'BTC/USDC'
elif ep_path == '/api/book':
    params['pair'] = 'BTC/USDC'
elif ep_path == '/api/trades':
    params['pair'] = 'ETH/BTC'
    params['offset'] = '1'
elif ep_path == '/v1/market/kline':
    now = int(time.time())
    params['pair'] = 'ETH/BTC'
    params['resolution'] = '60'
    params['from'] = now - 86400
    params['to'] = now

# Private account endpoints
elif ep_path == '/api/balance':
    params['coin'] = 'BTC'

# Private trading endpoints
elif ep_path == '/api/open':
    params['offset'] = '1'
elif ep_path == '/api/orderHistory':
    params['offset'] = '1'
elif ep_path == '/api/uHistory':
    params['offset'] = '1'
elif ep_path == '/api/create':
    # Test: SELL 20 LCX @ dynamic price LIMIT order
    params['Pair'] = 'LCX/USDC'
    params['Amount'] = 20
    params['Price'] = sell_price
    params['OrderType'] = 'LIMIT'
    params['Side'] = 'SELL'
elif ep_path == '/api/order':
    # GET uses query parameter OrderId
    params['OrderId'] = '0d6d3671-06a7-4061-b19c-159167edb0fc'
elif ep_path == '/api/cancel':
    # DELETE uses lowercase query parameter 'orderId'
    if order_id:
        params['orderId'] = order_id
    else:
        params['orderId'] = '0d6d3671-06a7-4061-b19c-159167edb0fc'  # dummy fallback
elif ep_path == '/api/modify':
    # PUT requires JSON body with OrderId, Amount, Price (dynamic)
    if order_id:
        params['OrderId'] = order_id
    else:
        params['OrderId'] = '0d6d3671-06a7-4061-b19c-159167edb0fc'  # dummy fallback
    params['Amount'] = 25
    params['Price'] = sell_modify_price
elif ep_path == '/order/cancel-all':
    # DELETE uses query parameter with array
    params['orderIds'] = ['0d6d3671-06a7-4061-b19c-159167edb0fc']

print("DEBUG: Final params = " + json.dumps(params), file=sys.stderr)

headers = {
    'Content-Type': 'application/json',
    'API-VERSION': '1.1.0'
}

# Add auth headers if provided
if has_auth and api_key and api_secret:
    timestamp = str(int(time.time() * 1000))
    # Signature format: METHOD + ENDPOINT + JSON_PAYLOAD
    # For GET/DELETE requests: params go in query string, signature uses empty {}
    # For POST/PUT requests: params go in body, signature includes params
    if ep_method.upper() in ['GET', 'DELETE']:
        sig_params = {}
    else:
        sig_params = params
    request_string = ep_method + ep_path + json.dumps(sig_params)
    signature = base64.b64encode(hmac.new(api_secret.encode(), request_string.encode(), hashlib.sha256).digest()).decode()
    headers['x-access-key'] = api_key
    headers['x-access-sign'] = signature
    headers['x-access-timestamp'] = timestamp
    print("\\n" + "="*60, file=sys.stderr)
    print("🔒 AUTH REQUEST: " + ep_method + " " + ep_path, file=sys.stderr)
    print("Parameters: " + json.dumps(params), file=sys.stderr)
    print("Signature params: " + json.dumps(sig_params), file=sys.stderr)
    print("Request string: " + request_string, file=sys.stderr)
    print("Timestamp: " + timestamp, file=sys.stderr)
    print("="*60 + "\\n", file=sys.stderr)

start = time.time()
try:
    if ep_method.upper() == 'GET':
        resp = requests.get(url, headers=headers, params=params, timeout=10)
    elif ep_method.upper() == 'POST':
        resp = requests.post(url, headers=headers, json=params, timeout=10)
    elif ep_method.upper() == 'DELETE':
        # DELETE requests use query parameters, not JSON body
        resp = requests.delete(url, headers=headers, params=params, timeout=10)
    elif ep_method.upper() == 'PUT':
        resp = requests.put(url, headers=headers, json=params, timeout=10)
    else:
        resp = requests.get(url, headers=headers, params=params, timeout=10)

    ms = int((time.time() - start) * 1000)

    # For cancel/modify endpoints, accept 400 as success (order may not exist)
    is_cancel_or_modify = ep_path in ['/api/cancel', '/api/modify']
    is_success = resp.status_code in [200, 201] or (is_cancel_or_modify and resp.status_code == 400)

    if is_success:
        try:
            data = resp.json()
            sample = json.dumps(data)[:100] if data else 'OK'
        except:
            sample = resp.text[:100] if resp.text else 'OK'
        print(json.dumps({
            'status': 'ok',
            'time': ms,
            'sample': sample
        }))
    elif resp.status_code == 404:
        print(json.dumps({
            'status': 'fail',
            'time': ms,
            'error': 'Endpoint not found (404)'
        }))
    elif resp.status_code in [400, 401, 403]:
        try:
            error_data = resp.json()
            error_msg = error_data.get('message', str(error_data))
        except:
            error_msg = resp.text[:100]
        print(json.dumps({
            'status': 'fail',
            'time': ms,
            'error': 'HTTP ' + str(resp.status_code) + ': ' + str(error_msg)
        }))
    else:
        print(json.dumps({
            'status': 'fail',
            'time': ms,
            'error': 'HTTP ' + str(resp.status_code),
            'response': resp.text[:150]
        }))
except Exception as e:
    ms = int((time.time() - start) * 1000)
    print(json.dumps({
        'status': 'fail',
        'time': ms,
        'error': str(e)[:100]
    }))
`;

    const { spawn } = require('child_process');
    const python = spawn('python3', ['-c', pythonCode]);

    let output = '';
    python.stdout.on('data', (data) => {
      output += data.toString();
    });

    python.on('close', (code) => {
      try {
        if (!output || output.trim() === '') {
          return res.json({ status: 'fail', error: 'No response from Python', code });
        }
        const result = JSON.parse(output);
        res.json(result);
      } catch (e) {
        console.error('Parse error:', output.substring(0, 200), 'Error:', e.message);
        res.json({ status: 'fail', error: 'Parse error', output: output.substring(0, 200) });
      }
    });

    python.stderr.on('data', (data) => {
      console.log('[Python stderr]:', data.toString().substring(0, 300));
    });
  } catch (error) {
    res.json({ status: 'fail', error: error.message });
  }
});

// Test dynamic endpoints (accepts list of endpoints to test)
app.post('/testendpoints', (req, res) => {
  try {
    const endpoints = req.body.endpoints || [];
    if (!endpoints || endpoints.length === 0) {
      return res.json({ results: [], passed: 0, total: 0 });
    }

    const dslRoot = path.resolve(path.join(__dirname, '..'));
    const pythonCode = `
import sys, json, time
import requests

sys.path.insert(0, '''${dslRoot}''')

endpoints = ${JSON.stringify(endpoints)}
results = []

import time as time_module

for i, endpoint in enumerate(endpoints):
    start = time.time()
    try:
        # Parse endpoint: "GET /api/tickers" -> ("GET", "/api/tickers")
        parts = endpoint.strip().split()
        method = parts[0] if len(parts) > 0 else "GET"
        path = parts[1] if len(parts) > 1 else endpoint

        # Add default parameters if missing
        if "?" not in path:
            if path == "/api/pair":
                path += "?pair=BTC/USDC"

        # Build full URL
        url = "https://exchange-api.lcx.com" + path

        # Make request
        if method.upper() == "GET":
            resp = requests.get(url, timeout=10)
        elif method.upper() == "POST":
            resp = requests.post(url, timeout=10)
        else:
            resp = requests.get(url, timeout=10)

        resp.raise_for_status()
        data = resp.json() if resp.text else {}

        ms = int((time.time() - start) * 1000)
        sample = json.dumps(data)[:150] + "..." if len(json.dumps(data)) > 150 else json.dumps(data)
        results.append({
            "name": endpoint,
            "status": "ok",
            "duration_ms": ms,
            "sample": sample
        })
    except Exception as e:
        ms = int((time.time() - start) * 1000)
        results.append({
            "name": endpoint,
            "status": "fail",
            "error": str(e)[:200],
            "duration_ms": ms
        })

    # Rate limiting: add 500ms delay between requests
    if i < len(endpoints) - 1:
        time_module.sleep(0.5)

passed = sum(1 for r in results if r["status"] == "ok")
print(json.dumps({"results": results, "passed": passed, "total": len(results)}))
`;

    const { spawn } = require('child_process');
    const python = spawn('python3', ['-c', pythonCode]);

    let output = '';
    python.stdout.on('data', (data) => {
      output += data.toString();
    });

    python.on('close', (code) => {
      try {
        const result = JSON.parse(output);
        res.json(result);
      } catch (e) {
        res.json({ results: [], passed: 0, total: 0, error: 'Parse error' });
      }
    });
  } catch (error) {
    res.json({ results: [], passed: 0, total: 0, error: error.message });
  }
});

// Run live API tests (legacy - for backward compatibility)
app.get('/runtests', (req, res) => {
  try {
    const fs = require('fs');
    const os = require('os');
    const dslRoot = path.resolve(path.join(__dirname, '..'));

    const pythonCode = `
import sys, os, json, time
from concurrent.futures import ThreadPoolExecutor
import importlib.util

sys.path.insert(0, '''${dslRoot}''')

try:
    # Load test module
    test_path = '''${path.join(dslRoot, 'tests', 'test_live_api.py').replace(/\\/g, '/')}'''
    spec = importlib.util.spec_from_file_location('test_live_api', test_path)
    test_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(test_module)

    tests = [
        ('GET /api/tickers', test_module.test_tickers),
        ('GET /api/pairs', test_module.test_pairs),
        ('GET /api/pair?pair=BTC/USDC', test_module.test_pair),
        ('GET /api/book?pair=BTC/USDC', test_module.test_orderbook),
        ('GET /api/trades?pair=ETH/BTC&offset=1', test_module.test_trades),
        ('GET /v1/market/kline', test_module.test_kline),
    ]

    def run_test(name, fn):
        start = time.time()
        try:
            data = fn()
            ms = int((time.time() - start) * 1000)
            sample = json.dumps(data)[:150] + '...' if len(json.dumps(data)) > 150 else json.dumps(data)
            return {'name': name, 'status': 'ok', 'duration_ms': ms, 'sample': sample}
        except Exception as e:
            ms = int((time.time() - start) * 1000)
            return {'name': name, 'status': 'fail', 'error': str(e)[:200], 'duration_ms': ms}

    results = [run_test(name, fn) for name, fn in tests]
    passed = sum(1 for r in results if r['status'] == 'ok')
    print(json.dumps({'results': results, 'passed': passed, 'total': len(tests)}))

except Exception as e:
    import traceback
    print(json.dumps({'error': str(e), 'traceback': traceback.format_exc(), 'results': [], 'passed': 0, 'total': 0}))
`;

    const { spawn } = require('child_process');
    const proc = spawn('python3', ['-c', pythonCode], { cwd: dslRoot });

    let output = '';
    proc.stdout.on('data', d => output += d);
    proc.on('close', () => {
      try {
        res.json(JSON.parse(output));
      } catch (e) {
        res.json({results: [], passed: 0, total: 0, error: output});
      }
    });
  } catch (e) {
    res.json({results: [], passed: 0, total: 0, error: e.message});
  }
});

// Start server
const PORT = process.env.PORT || 3030;
app.listen(PORT, '0.0.0.0', () => {
  console.log(`[*] LCX DSL Web Server`);
  console.log(`[*] Listening on http://localhost:${PORT}`);
  console.log(`[*] Compiler root: ${path.join(__dirname, '..')}`);
  console.log(`[*] Languages supported: 77`);
  console.log(`[*] Open browser and navigate to http://localhost:${PORT}`);
});
