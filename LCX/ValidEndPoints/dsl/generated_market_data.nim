import httpclient
import json
import hmac
import base64


proc fetch_all_tickers*(): JsonNode =
  ## GET /api/tickers
  let url = "https://exchange-api.lcx.com/api/tickers"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)
  echo data

  return data

proc get_ticker_for_pair*(pair): JsonNode =
  ## GET /api/ticker
  let url = "https://exchange-api.lcx.com/api/ticker"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc fetch_all_pairs*(): JsonNode =
  ## GET /api/pairs
  let url = "https://exchange-api.lcx.com/api/pairs"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)
  echo data

  return data

proc get_pair_info*(pair_symbol): JsonNode =
  ## GET /api/pair/BTC/USDC
  let url = "https://exchange-api.lcx.com/api/pair/BTC/USDC"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_order_book*(pair): JsonNode =
  ## GET /api/book
  let url = "https://exchange-api.lcx.com/api/book"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)
  echo data

  return data

proc get_recent_trades*(pair, offset): JsonNode =
  ## GET /api/trades
  let url = "https://exchange-api.lcx.com/api/trades"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_candle_data*(pair, resolution, from_ts, to_ts): JsonNode =
  ## GET /v1/market/kline
  let url = "https://api-kline.lcx.com/v1/market/kline"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)
  echo data

  return data

proc market_overview*(): JsonNode =
  ## GET /api/book
  let url = "https://exchange-api.lcx.com/api/book"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_trades*(): JsonNode =
  ## GET /api/trades
  let url = "https://exchange-api.lcx.com/api/trades"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# None method not supported for nim
