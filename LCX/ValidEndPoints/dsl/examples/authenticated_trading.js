const axios = require('axios');
const crypto = require('crypto');
const os = require('os');


async function get_account_info() {
  // GET /api/account
  const url = 'https://exchange-api.lcx.com/api/account';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/account';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_balances() {
  // GET /api/balances
  const url = 'https://exchange-api.lcx.com/api/balances';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/balances';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_asset_balance(asset) {
  // GET /api/balance
  const url = 'https://exchange-api.lcx.com/api/balance';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/balance';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_trading_fees() {
  // GET /api/fees
  const url = 'https://exchange-api.lcx.com/api/fees';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/fees';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_open_orders(offset, pair) {
  // GET /api/open
  const url = 'https://exchange-api.lcx.com/api/open';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/open';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_order_details(orderId) {
  // GET /api/order
  const url = 'https://exchange-api.lcx.com/api/order';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/order';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) {
  // GET /api/orderHistory
  const url = 'https://exchange-api.lcx.com/api/orderHistory';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/orderHistory';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_user_trade_history(offset, pair, fromDate, toDate) {
  // GET /api/uHistory
  const url = 'https://exchange-api.lcx.com/api/uHistory';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/uHistory';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function place_order(Pair, Amount, Price, OrderType, Side, ClientOrderId) {
  // POST /api/create
  const url = 'https://exchange-api.lcx.com/api/create';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'POST' + '/api/create';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.post(url, {}, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

# PUT method not supported for javascript
# DELETE method not supported for javascript
# DELETE method not supported for javascript
async function check_balance_workflow() {
  // GET /api/balances
  const url = 'https://exchange-api.lcx.com/api/balances';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/balances';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for javascript
async function place_order_workflow(BTC/USDC) {
  // GET /api/ticker
  const url = 'https://exchange-api.lcx.com/api/ticker';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

# Workflow: PlaceOrderWorkflow (sequence)

async function place_limit_order(BTC/USDC, 0.01, 40000, LIMIT, BUY) {
  // POST /api/create
  const url = 'https://exchange-api.lcx.com/api/create';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'POST' + '/api/create';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.post(url, {}, {headers});

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_order_info(order_response) {
  // GET /api/order
  const url = 'https://exchange-api.lcx.com/api/order';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/order';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

# None method not supported for javascript
async function manage_open_orders_workflow(0) {
  // GET /api/orderHistory
  const url = 'https://exchange-api.lcx.com/api/orderHistory';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/orderHistory';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

# Workflow: ManageOpenOrdersWorkflow (sequence)

async function get_trade_history(0) {
  // GET /api/uHistory
  const url = 'https://exchange-api.lcx.com/api/uHistory';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/uHistory';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

# None method not supported for javascript
# PUT method not supported for javascript
# DELETE method not supported for javascript
# None method not supported for javascript
async function account_monitoring_workflow() {
  // GET /api/balances
  const url = 'https://exchange-api.lcx.com/api/balances';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/balances';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

# Workflow: AccountMonitoringWorkflow (sequence)

async function get_open_orders(0) {
  // GET /api/open
  const url = 'https://exchange-api.lcx.com/api/open';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/open';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_fees() {
  // GET /api/fees
  const url = 'https://exchange-api.lcx.com/api/fees';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/fees';
  const signature = crypto
    .createHmac('sha256', apiSecret)
    .update(message)
    .digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await axios.get(url, {headers});

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

# None method not supported for javascript
