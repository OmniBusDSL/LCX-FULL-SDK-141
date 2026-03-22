const axios = require('axios');
const crypto = require('crypto');
const os = require('os');


async function fetch_all_tickers() {
  // GET /api/tickers
  const url = 'https://exchange-api.lcx.com/api/tickers';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});
    console.log(JSON.stringify(response.data, null, 2));
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_ticker_for_pair(pair) {
  // GET /api/ticker
  const url = 'https://exchange-api.lcx.com/api/ticker';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function fetch_all_pairs() {
  // GET /api/pairs
  const url = 'https://exchange-api.lcx.com/api/pairs';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});
    console.log(JSON.stringify(response.data, null, 2));
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_pair_info(pair_symbol) {
  // GET /api/pair/BTC/USDC
  const url = 'https://exchange-api.lcx.com/api/pair/BTC/USDC';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_order_book(pair) {
  // GET /api/book
  const url = 'https://exchange-api.lcx.com/api/book';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});
    console.log(JSON.stringify(response.data, null, 2));
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_recent_trades(pair, offset) {
  // GET /api/trades
  const url = 'https://exchange-api.lcx.com/api/trades';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_candle_data(pair, resolution, from_ts, to_ts) {
  // GET /v1/market/kline
  const url = 'https://api-kline.lcx.com/v1/market/kline';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});
    console.log(JSON.stringify(response.data, null, 2));
    return response.data;

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function market_overview() {
  // GET /api/book
  const url = 'https://exchange-api.lcx.com/api/book';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

async function get_trades() {
  // GET /api/trades
  const url = 'https://exchange-api.lcx.com/api/trades';
  const headers = {'Content-Type': 'application/json'};

  try {
    const response = await axios.get(url, {headers});

  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

# None method not supported for javascript
