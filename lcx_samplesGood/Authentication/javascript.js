const CryptoJS = require('crypto-js')
const axios = require('axios')
let base_url = 'https://exchange-api.lcx.com'
let end_point = '/api/create'
let method = 'POST'
let api = 'ADD YOUR LCX EXCHANGE API KEY'
let secret = 'ADD YOUR LCX EXCHANGE SECRET KEY'
const EXAMPLE_PAYLOAD = {
  OrderType: 'LIMIT',
  Pair: 'LCX/ETH',
  Side: 'BUY',
  Price: 0.03033486,
  Amount: 500,
}
// If No Payload, then it is important to pass empty object in EXAMPLE_PAYLOAD, ie. {}

let requestString = method + end_point + JSON.stringify(EXAMPLE_PAYLOAD)
let hash = CryptoJS.HmacSHA256(requestString, secret)
let signature = CryptoJS.enc.Base64.stringify(hash)
let headers = {
  'x-access-key': api,
  'x-access-sign': signature,
  'x-access-timestamp': Date.now(),
}
let url = base_url + end_point
axios
  .post(url, JSON.stringify(EXAMPLE_PAYLOAD), { headers: headers })
  .then((result) => {
    console.log(result)
    // ... result
  })
  .catch((error) => {
    console.log(error)
    // ... error
  })