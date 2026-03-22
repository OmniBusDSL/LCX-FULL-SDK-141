import crypto from 'crypto';
import fetch from 'node-fetch';


# POST method not supported for typescript
# POST method not supported for typescript
# POST method not supported for typescript
# PUT method not supported for typescript
# PUT method not supported for typescript
# PUT method not supported for typescript
# DELETE method not supported for typescript
# DELETE method not supported for typescript
async function get_all_open_orders(offset): Promise<any> {
  // GET /api/open
  const url = 'https://exchange-api.lcx.com/api/open';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/open';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_open_orders_for_pair(offset, pair): Promise<any> {
  // GET /api/open
  const url = 'https://exchange-api.lcx.com/api/open';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/open';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_open_orders_with_date_range(offset, pair, fromDate, toDate): Promise<any> {
  // GET /api/open
  const url = 'https://exchange-api.lcx.com/api/open';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/open';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_single_order_status(orderId): Promise<any> {
  // GET /api/order
  const url = 'https://exchange-api.lcx.com/api/order';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/order';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_complete_order_history(offset): Promise<any> {
  // GET /api/orderHistory
  const url = 'https://exchange-api.lcx.com/api/orderHistory';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/orderHistory';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_order_history_for_pair(offset, pair): Promise<any> {
  // GET /api/orderHistory
  const url = 'https://exchange-api.lcx.com/api/orderHistory';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/orderHistory';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_order_history_by_status(offset, orderStatus): Promise<any> {
  // GET /api/orderHistory
  const url = 'https://exchange-api.lcx.com/api/orderHistory';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/orderHistory';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_order_history_by_type(offset, orderType): Promise<any> {
  // GET /api/orderHistory
  const url = 'https://exchange-api.lcx.com/api/orderHistory';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/orderHistory';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType): Promise<any> {
  // GET /api/orderHistory
  const url = 'https://exchange-api.lcx.com/api/orderHistory';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/orderHistory';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_all_trade_history(offset): Promise<any> {
  // GET /api/uHistory
  const url = 'https://exchange-api.lcx.com/api/uHistory';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/uHistory';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_trade_history_for_pair(offset, pair): Promise<any> {
  // GET /api/uHistory
  const url = 'https://exchange-api.lcx.com/api/uHistory';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/uHistory';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_trade_history_by_date_range(offset, pair, fromDate, toDate): Promise<any> {
  // GET /api/uHistory
  const url = 'https://exchange-api.lcx.com/api/uHistory';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/uHistory';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function simple_buy_workflow(order_result): Promise<any> {
  // GET /api/order
  const url = 'https://exchange-api.lcx.com/api/order';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/order';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for typescript
# PUT method not supported for typescript
async function get_history(0, BTC/USDC): Promise<any> {
  // GET /api/orderHistory
  const url = 'https://exchange-api.lcx.com/api/orderHistory';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/orderHistory';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_trades(0, BTC/USDC): Promise<any> {
  // GET /api/uHistory
  const url = 'https://exchange-api.lcx.com/api/uHistory';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/uHistory';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

# None method not supported for typescript
# DELETE method not supported for typescript
async function confirm_cancelled(first_order_from_list): Promise<any> {
  // GET /api/order
  const url = 'https://exchange-api.lcx.com/api/order';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/order';
  const signature = crypto.createHmac('sha256', apiSecret).update(message).digest('base64');
  headers['x-access-key'] = apiKey;
  headers['x-access-sign'] = signature;
  headers['x-access-timestamp'] = timestamp;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

# None method not supported for typescript
