const ws = require('ws')
const w = new ws(
  'wss://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}',
)

w.on('message', (msg) => console.log(msg))

let msg = JSON.stringify({
  Topic: 'subscribe',
  Type: 'user_wallets',
})

w.on('open', () => w.send(msg))
