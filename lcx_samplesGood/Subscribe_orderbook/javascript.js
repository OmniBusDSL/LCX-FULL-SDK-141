const ws = require('ws')
const w = new ws('wss://exchange-api.lcx.com/ws')

w.on('message', (msg) => console.log(msg))

let msg = JSON.stringify({
  Topic: 'subscribe',
  Type: 'orderbook',
  Pair: 'LCX/USDC',
})

w.on('open', () => w.send(msg))
