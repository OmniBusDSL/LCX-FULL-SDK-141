const ws = require('ws')
const w = new ws('wss://exchange-api.lcx.com/ws')

w.on('message', (msg) => console.log(msg))

let msg = JSON.stringify({
  Topic: 'subscribe',
  Type: 'ticker',
})

w.on('open', () => w.send(msg))
