import groovy.json.JsonSlurper
import java.security.MessageDigest


# POST method not supported for groovy
# POST method not supported for groovy
# POST method not supported for groovy
# PUT method not supported for groovy
# PUT method not supported for groovy
# PUT method not supported for groovy
# DELETE method not supported for groovy
# DELETE method not supported for groovy
def get_all_open_orders(offset) {
  // GET /api/open
  def url = new URL("https://exchange-api.lcx.com/api/open")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_open_orders_for_pair(offset, pair) {
  // GET /api/open
  def url = new URL("https://exchange-api.lcx.com/api/open")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_open_orders_with_date_range(offset, pair, fromDate, toDate) {
  // GET /api/open
  def url = new URL("https://exchange-api.lcx.com/api/open")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_single_order_status(orderId) {
  // GET /api/order
  def url = new URL("https://exchange-api.lcx.com/api/order")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_complete_order_history(offset) {
  // GET /api/orderHistory
  def url = new URL("https://exchange-api.lcx.com/api/orderHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_order_history_for_pair(offset, pair) {
  // GET /api/orderHistory
  def url = new URL("https://exchange-api.lcx.com/api/orderHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_order_history_by_status(offset, orderStatus) {
  // GET /api/orderHistory
  def url = new URL("https://exchange-api.lcx.com/api/orderHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_order_history_by_type(offset, orderType) {
  // GET /api/orderHistory
  def url = new URL("https://exchange-api.lcx.com/api/orderHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) {
  // GET /api/orderHistory
  def url = new URL("https://exchange-api.lcx.com/api/orderHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_all_trade_history(offset) {
  // GET /api/uHistory
  def url = new URL("https://exchange-api.lcx.com/api/uHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_trade_history_for_pair(offset, pair) {
  // GET /api/uHistory
  def url = new URL("https://exchange-api.lcx.com/api/uHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_trade_history_by_date_range(offset, pair, fromDate, toDate) {
  // GET /api/uHistory
  def url = new URL("https://exchange-api.lcx.com/api/uHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def simple_buy_workflow(order_result) {
  // GET /api/order
  def url = new URL("https://exchange-api.lcx.com/api/order")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for groovy
# PUT method not supported for groovy
def get_history(0, BTC/USDC) {
  // GET /api/orderHistory
  def url = new URL("https://exchange-api.lcx.com/api/orderHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_trades(0, BTC/USDC) {
  // GET /api/uHistory
  def url = new URL("https://exchange-api.lcx.com/api/uHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# None method not supported for groovy
# DELETE method not supported for groovy
def confirm_cancelled(first_order_from_list) {
  // GET /api/order
  def url = new URL("https://exchange-api.lcx.com/api/order")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# None method not supported for groovy
