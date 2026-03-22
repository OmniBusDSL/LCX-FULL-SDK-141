var axios = require('axios')

var config = {
  method: 'get',
  url: 'https://exchange-api.lcx.com/api/balances',
  headers: {
    // auth headers
  },
}

axios(config)
  .then(function (response) {
    console.log(JSON.stringify(response.data))
  })
  .catch(function (error) {
    console.log(error)
  })
