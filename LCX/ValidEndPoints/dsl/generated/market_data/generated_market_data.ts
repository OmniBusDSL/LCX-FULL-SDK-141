import crypto from 'crypto';
import fetch from 'node-fetch';


async function fetch_all_tickers(): Promise<any> {
  // GET /api/tickers
  const url = 'https://exchange-api.lcx.com/api/tickers';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    console.log(JSON.stringify(data, null, 2));
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_ticker_for_pair(pair): Promise<any> {
  // GET /api/ticker
  const url = 'https://exchange-api.lcx.com/api/ticker';
  const headers = {'Content-Type': 'application/json'};

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

async function fetch_all_pairs(): Promise<any> {
  // GET /api/pairs
  const url = 'https://exchange-api.lcx.com/api/pairs';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    console.log(JSON.stringify(data, null, 2));
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_pair_info(pair_symbol): Promise<any> {
  // GET /api/pair/BTC/USDC
  const url = 'https://exchange-api.lcx.com/api/pair/BTC/USDC';
  const headers = {'Content-Type': 'application/json'};

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

async function get_order_book(pair): Promise<any> {
  // GET /api/book
  const url = 'https://exchange-api.lcx.com/api/book';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    console.log(JSON.stringify(data, null, 2));
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function get_recent_trades(pair, offset): Promise<any> {
  // GET /api/trades
  const url = 'https://exchange-api.lcx.com/api/trades';
  const headers = {'Content-Type': 'application/json'};

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

async function get_candle_data(pair, resolution, from_ts, to_ts): Promise<any> {
  // GET /v1/market/kline
  const url = 'https://api-kline.lcx.com/v1/market/kline';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    const data = await response.json();
    console.log(JSON.stringify(data, null, 2));
    return data;

  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

async function market_overview(): Promise<any> {
  // GET /api/book
  const url = 'https://exchange-api.lcx.com/api/book';
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

async function get_trades(): Promise<any> {
  // GET /api/trades
  const url = 'https://exchange-api.lcx.com/api/trades';
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

# None method not supported for typescript
