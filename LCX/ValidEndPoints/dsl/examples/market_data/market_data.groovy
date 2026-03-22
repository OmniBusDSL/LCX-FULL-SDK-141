import groovy.json.JsonSlurper
import java.security.MessageDigest


def fetch_all_tickers() {
  // GET /api/tickers
  def url = new URL("https://exchange-api.lcx.com/api/tickers")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_ticker_for_pair(pair) {
  // GET /api/ticker
  def url = new URL("https://exchange-api.lcx.com/api/ticker")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def fetch_all_pairs() {
  // GET /api/pairs
  def url = new URL("https://exchange-api.lcx.com/api/pairs")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_pair_info(pair_symbol) {
  // GET /api/pair/BTC/USDC
  def url = new URL("https://exchange-api.lcx.com/api/pair/BTC/USDC")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_order_book(pair) {
  // GET /api/book
  def url = new URL("https://exchange-api.lcx.com/api/book")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_recent_trades(pair, offset) {
  // GET /api/trades
  def url = new URL("https://exchange-api.lcx.com/api/trades")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_candle_data(pair, resolution, from_ts, to_ts) {
  // GET /v1/market/kline
  def url = new URL("https://api-kline.lcx.com/v1/market/kline")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def market_overview() {
  // GET /api/book
  def url = new URL("https://exchange-api.lcx.com/api/book")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# Workflow: MarketOverview (sequence)

def get_trades() {
  // GET /api/trades
  def url = new URL("https://exchange-api.lcx.com/api/trades")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# None method not supported for groovy
