import crypto from 'crypto';
import fetch from 'node-fetch';


# POST method not supported for typescript
async function check_order_status(order_id): Promise<any> {
  // GET /api/trading/order/{order_id}
  const url = 'https://exchange-api.lcx.com/api/trading/order/{order_id}';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/trading/order/{order_id}';
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
async function complete_order_flow(currency): Promise<any> {
  // GET /api/account/balance
  const url = 'https://exchange-api.lcx.com/api/account/balance';
  const headers = {'Content-Type': 'application/json'};
  const apiKey = process.env.LCX_API_KEY || '';
  const apiSecret = process.env.LCX_API_SECRET || '';
  const timestamp = Date.now().toString();
  const message = timestamp + 'GET' + '/api/account/balance';
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



# POST method not supported for typescript
# None method not supported for typescript
# None method not supported for typescript
# None method not supported for typescript
# None method not supported for typescript
# None method not supported for typescript
# None method not supported for typescript
# None method not supported for typescript
# None method not supported for typescript
# None method not supported for typescript
# None method not supported for typescript
