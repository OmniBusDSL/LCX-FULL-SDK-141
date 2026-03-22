import axios from 'axios'

const config = {
  method: 'get',
  url: 'https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}',
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
