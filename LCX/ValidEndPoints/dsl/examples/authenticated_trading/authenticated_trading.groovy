import groovy.json.JsonSlurper
import java.security.MessageDigest


def get_account_info() {
  // GET /api/account
  def url = new URL("https://exchange-api.lcx.com/api/account")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_balances() {
  // GET /api/balances
  def url = new URL("https://exchange-api.lcx.com/api/balances")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_asset_balance(asset) {
  // GET /api/balance
  def url = new URL("https://exchange-api.lcx.com/api/balance")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_trading_fees() {
  // GET /api/fees
  def url = new URL("https://exchange-api.lcx.com/api/fees")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_open_orders(offset, pair) {
  // GET /api/open
  def url = new URL("https://exchange-api.lcx.com/api/open")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_order_details(orderId) {
  // GET /api/order
  def url = new URL("https://exchange-api.lcx.com/api/order")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) {
  // GET /api/orderHistory
  def url = new URL("https://exchange-api.lcx.com/api/orderHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_user_trade_history(offset, pair, fromDate, toDate) {
  // GET /api/uHistory
  def url = new URL("https://exchange-api.lcx.com/api/uHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# POST method not supported for groovy
# PUT method not supported for groovy
# DELETE method not supported for groovy
# DELETE method not supported for groovy
def check_balance_workflow() {
  // GET /api/balances
  def url = new URL("https://exchange-api.lcx.com/api/balances")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for groovy
def place_order_workflow(BTC/USDC) {
  // GET /api/ticker
  def url = new URL("https://exchange-api.lcx.com/api/ticker")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for groovy
def get_order_info(order_response) {
  // GET /api/order
  def url = new URL("https://exchange-api.lcx.com/api/order")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# None method not supported for groovy
def manage_open_orders_workflow(0) {
  // GET /api/orderHistory
  def url = new URL("https://exchange-api.lcx.com/api/orderHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# Workflow: ManageOpenOrdersWorkflow (sequence)

def get_trade_history(0) {
  // GET /api/uHistory
  def url = new URL("https://exchange-api.lcx.com/api/uHistory")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# None method not supported for groovy
# PUT method not supported for groovy
# DELETE method not supported for groovy
# None method not supported for groovy
def account_monitoring_workflow() {
  // GET /api/balances
  def url = new URL("https://exchange-api.lcx.com/api/balances")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# Workflow: AccountMonitoringWorkflow (sequence)

def get_open_orders(0) {
  // GET /api/open
  def url = new URL("https://exchange-api.lcx.com/api/open")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_fees() {
  // GET /api/fees
  def url = new URL("https://exchange-api.lcx.com/api/fees")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# None method not supported for groovy
