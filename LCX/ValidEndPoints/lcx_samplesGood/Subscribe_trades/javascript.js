const ws = require('ws')
const w = new ws(
  'wss://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={timestamp}',
)

w.on('message', (msg) => console.log(msg))

let msg = JSON.stringify({
  Topic: 'update',
  Type: 'user_trades',
})

w.on('open', () => w.send(msg))
