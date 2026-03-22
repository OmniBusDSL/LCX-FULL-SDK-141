var axios = require('axios')
var data = JSON.stringify({
  OrderId: '9f898d18-0980-4fb3-b18c-eeb39fc20324',
  Amount: 100,
  Price: 0.004
})

var config = {
  method: 'put',
  url: 'https://exchange-api.lcx.com/api/modify',
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
