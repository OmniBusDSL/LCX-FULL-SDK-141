import axios from 'axios'

const config = {
  method: 'post',
  url: 'https://exchange-api.lcx.com',
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
