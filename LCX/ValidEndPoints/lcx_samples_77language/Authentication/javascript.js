var axios = require('axios')

var config = {
  method: 'post',
  url: 'https://exchange-api.lcx.com',
  headers: {
    'Content-Type': 'application/json',
  },
}

axios(config)
  .then(function (response) {
    console.log(JSON.stringify(response.data))
  })
  .catch(function (error) {
    console.log(error)
  })
