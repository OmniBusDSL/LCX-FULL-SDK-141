const axios = require('axios');
const crypto = require('crypto');
const os = require('os');


async function fetch_all_pairs_data(pair) {
  // GET /api/ticker
  const url = 'https://exchange-api.lcx.com/api/ticker';
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

# Workflow: FetchAllPairsData (sequence)

async function get_ethusdc_ticker(pair) {
  // GET /api/ticker
  const url = 'https://exchange-api.lcx.com/api/ticker';
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

async function get_lcxusdc_ticker(pair) {
  // GET /api/ticker
  const url = 'https://exchange-api.lcx.com/api/ticker';
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

