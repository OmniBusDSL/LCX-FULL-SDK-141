const axios = require('axios');
const crypto = require('crypto');
const os = require('os');


async function analyze_portfolio() {
  // GET /api/pairs
  const url = 'https://exchange-api.lcx.com/api/pairs';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_pair_metrics(pair) {
  // GET /api/pair
  const url = 'https://exchange-api.lcx.com/api/pair';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function calculate_portfolio_value() {
  // GET /api/pairs
  const url = 'https://exchange-api.lcx.com/api/pairs';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

# None method not supported for javascript
async function monitor_risk_levels(pair) {
  // GET /api/book
  const url = 'https://exchange-api.lcx.com/api/book';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function rebalance_portfolio(pair, size, direction) {
  // POST /api/orders
  const url = 'https://exchange-api.lcx.com/api/orders';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'POST' + '/api/orders';
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
    try {
            validate_balance()
            calculate_order_size()
            place_order()
    }
    catch (Exception) {
            cancel_pending_orders()
            print "Rebalance failed"
    }


