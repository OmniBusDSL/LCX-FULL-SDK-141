import crypto from 'crypto';
import fetch from 'node-fetch';


async function get_account_info(): Promise<any> {
  // GET /api/account
  const url = 'https://exchange-api.lcx.com/api/account';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/account';
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

async function get_balances(): Promise<any> {
  // GET /api/balances
  const url = 'https://exchange-api.lcx.com/api/balances';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/balances';
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

async function get_asset_balance(asset): Promise<any> {
  // GET /api/balance
  const url = 'https://exchange-api.lcx.com/api/balance';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/balance';
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

async function get_trading_fees(): Promise<any> {
  // GET /api/fees
  const url = 'https://exchange-api.lcx.com/api/fees';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/fees';
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

async function get_open_orders(offset, pair): Promise<any> {
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

async function get_order_details(orderId): Promise<any> {
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

async function get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType): Promise<any> {
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

async function get_user_trade_history(offset, pair, fromDate, toDate): Promise<any> {
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

# POST method not supported for typescript
# PUT method not supported for typescript
# DELETE method not supported for typescript
# DELETE method not supported for typescript
async function check_balance_workflow(): Promise<any> {
  // GET /api/balances
  const url = 'https://exchange-api.lcx.com/api/balances';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/balances';
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

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for typescript
async function place_order_workflow(BTC/USDC): Promise<any> {
  // GET /api/ticker
  const url = 'https://exchange-api.lcx.com/api/ticker';
  const headers = {'Content-Type': 'application/json'};

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

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for typescript
async function get_order_info(order_response): Promise<any> {
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
async function manage_open_orders_workflow(0): Promise<any> {
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

# Workflow: ManageOpenOrdersWorkflow (sequence)

async function get_trade_history(0): Promise<any> {
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
# PUT method not supported for typescript
# DELETE method not supported for typescript
# None method not supported for typescript
async function account_monitoring_workflow(): Promise<any> {
  // GET /api/balances
  const url = 'https://exchange-api.lcx.com/api/balances';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/balances';
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

# Workflow: AccountMonitoringWorkflow (sequence)

async function get_open_orders(0): Promise<any> {
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

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_fees(): Promise<any> {
  // GET /api/fees
  const url = 'https://exchange-api.lcx.com/api/fees';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/fees';
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
