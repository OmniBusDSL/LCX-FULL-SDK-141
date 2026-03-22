const axios = require('axios');
const crypto = require('crypto');
const os = require('os');


async function place_order(symbol, quantity, price) {
  // POST /api/trading/order/create
  const url = 'https://exchange-api.lcx.com/api/trading/order/create';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'POST' + '/api/trading/order/create';
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

async function check_order_status(order_id) {
  // GET /api/trading/order/{order_id}
  const url = 'https://exchange-api.lcx.com/api/trading/order/{order_id}';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/trading/order/{order_id}';
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

async function cancel_order(order_id) {
  // POST /api/trading/order/cancel
  const url = 'https://exchange-api.lcx.com/api/trading/order/cancel';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'POST' + '/api/trading/order/cancel';
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

async function complete_order_flow(currency) {
  // GET /api/account/balance
  const url = 'https://exchange-api.lcx.com/api/account/balance';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/account/balance';
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



async function ifbalanceavailablepricequantity(symbol, quantity, price, order_type) {
  // POST /api/trading/order/create
  const url = 'https://exchange-api.lcx.com/api/trading/order/create';
  const headers = {'Content-Type': 'application/json'};
  // HMAC-SHA256 Authentication
  const apiKey = process.env.LCX_API_KEY;
  const apiSecret = process.env.LCX_API_SECRET;
  const timestamp = Date.now().toString();
  const message = timestamp + 'POST' + '/api/trading/order/create';
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

# None method not supported for javascript
# None method not supported for javascript
# None method not supported for javascript
# None method not supported for javascript
# None method not supported for javascript
# None method not supported for javascript
# None method not supported for javascript
# None method not supported for javascript
# None method not supported for javascript
# None method not supported for javascript
