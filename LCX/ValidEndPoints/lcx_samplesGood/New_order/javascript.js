var axios = require('axios')
var data = JSON.stringify({
  Pair: 'LCX/ETH',
  Amount: 100,
  Price: 0.004,
  OrderType: 'MARKET',
  Side: 'SELL',
})

var config = {
  method: 'post',
  url: 'https://exchange-api.lcx.com/api/create',
  headers: {
    // auth headers
  },
  data: data,
}

axios(config)
  .then(function (response) {
    console.log(JSON.stringify(response.data))
  })
  .catch(function (error) {
    console.log(error)
  })
