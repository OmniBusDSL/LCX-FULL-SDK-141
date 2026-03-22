import axios from 'axios'

const config = {
  method: 'get',
  url: 'https://exchange-api.lcx.com/api/open',
  headers: {
    'Content-Type': 'application/json',
  },
}

axios(config)
  .then((response) => {
    console.log(JSON.stringify(response.data))
  })
  .catch((error) => {
    console.log(error)
  })
