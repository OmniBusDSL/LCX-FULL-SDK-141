import crypto from 'crypto';
import fetch from 'node-fetch';


async function fetch_all_pairs_data(pair): Promise<any> {
  // GET /api/ticker
  const url = 'https://exchange-api.lcx.com/api/ticker';
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

# Workflow: FetchAllPairsData (sequence)

async function get_ethusdc_ticker(pair): Promise<any> {
  // GET /api/ticker
  const url = 'https://exchange-api.lcx.com/api/ticker';
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

async function get_lcxusdc_ticker(pair): Promise<any> {
  // GET /api/ticker
  const url = 'https://exchange-api.lcx.com/api/ticker';
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

