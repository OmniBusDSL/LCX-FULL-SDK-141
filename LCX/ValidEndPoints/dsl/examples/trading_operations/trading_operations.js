const axios = require('axios');
const crypto = require('crypto');
const os = require('os');


async function place_limit_buy_order(Pair, Amount, Price, OrderType, Side) {
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

async function place_limit_sell_order(Pair, Amount, Price, OrderType, Side) {
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

async function place_market_order(Pair, Amount, OrderType, Side) {
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
# PUT method not supported for javascript
# PUT method not supported for javascript
# DELETE method not supported for javascript
# DELETE method not supported for javascript
async function get_all_open_orders(offset) {
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

async function get_open_orders_for_pair(offset, pair) {
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

async function get_open_orders_with_date_range(offset, pair, fromDate, toDate) {
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

async function get_single_order_status(orderId) {
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

async function get_complete_order_history(offset) {
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

async function get_order_history_for_pair(offset, pair) {
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

async function get_order_history_by_status(offset, orderStatus) {
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

async function get_order_history_by_type(offset, orderType) {
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

async function get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) {
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

async function get_all_trade_history(offset) {
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

async function get_trade_history_for_pair(offset, pair) {
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

async function get_trade_history_by_date_range(offset, pair, fromDate, toDate) {
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

async function simple_buy_workflow(order_result) {
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

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for javascript
# PUT method not supported for javascript
async function get_history(0, BTC/USDC) {
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

async function get_trades(0, BTC/USDC) {
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
# DELETE method not supported for javascript
async function confirm_cancelled(first_order_from_list) {
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
