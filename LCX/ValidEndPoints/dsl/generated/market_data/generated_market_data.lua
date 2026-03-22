local http = require("socket.http")
local json = require("cjson")


function fetch_all_tickers()
  -- GET /api/tickers
  local url = "https://exchange-api.lcx.com/api/tickers"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then
    print(json.encode(json.decode(body)))
    return json.decode(body)

  else
    error("HTTP " .. code)
  end
end

function get_ticker_for_pair(pair)
  -- GET /api/ticker
  local url = "https://exchange-api.lcx.com/api/ticker"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function fetch_all_pairs()
  -- GET /api/pairs
  local url = "https://exchange-api.lcx.com/api/pairs"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then
    print(json.encode(json.decode(body)))
    return json.decode(body)

  else
    error("HTTP " .. code)
  end
end

function get_pair_info(pair_symbol)
  -- GET /api/pair/BTC/USDC
  local url = "https://exchange-api.lcx.com/api/pair/BTC/USDC"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_order_book(pair)
  -- GET /api/book
  local url = "https://exchange-api.lcx.com/api/book"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then
    print(json.encode(json.decode(body)))
    return json.decode(body)

  else
    error("HTTP " .. code)
  end
end

function get_recent_trades(pair, offset)
  -- GET /api/trades
  local url = "https://exchange-api.lcx.com/api/trades"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_candle_data(pair, resolution, from_ts, to_ts)
  -- GET /v1/market/kline
  local url = "https://api-kline.lcx.com/v1/market/kline"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then
    print(json.encode(json.decode(body)))
    return json.decode(body)

  else
    error("HTTP " .. code)
  end
end

function market_overview()
  -- GET /api/book
  local url = "https://exchange-api.lcx.com/api/book"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_trades()
  -- GET /api/trades
  local url = "https://exchange-api.lcx.com/api/trades"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

# None method not supported for lua
