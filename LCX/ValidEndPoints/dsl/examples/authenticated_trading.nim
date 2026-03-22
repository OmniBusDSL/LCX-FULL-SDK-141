import httpclient
import json
import hmac
import base64


proc get_account_info*(): JsonNode =
  ## GET /api/account
  let url = "https://exchange-api.lcx.com/api/account"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_balances*(): JsonNode =
  ## GET /api/balances
  let url = "https://exchange-api.lcx.com/api/balances"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_asset_balance*(asset): JsonNode =
  ## GET /api/balance
  let url = "https://exchange-api.lcx.com/api/balance"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_trading_fees*(): JsonNode =
  ## GET /api/fees
  let url = "https://exchange-api.lcx.com/api/fees"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_open_orders*(offset, pair): JsonNode =
  ## GET /api/open
  let url = "https://exchange-api.lcx.com/api/open"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_order_details*(orderId): JsonNode =
  ## GET /api/order
  let url = "https://exchange-api.lcx.com/api/order"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_order_history*(offset, pair, fromDate, toDate, side, orderStatus, orderType): JsonNode =
  ## GET /api/orderHistory
  let url = "https://exchange-api.lcx.com/api/orderHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_user_trade_history*(offset, pair, fromDate, toDate): JsonNode =
  ## GET /api/uHistory
  let url = "https://exchange-api.lcx.com/api/uHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# POST method not supported for nim
# PUT method not supported for nim
# DELETE method not supported for nim
# DELETE method not supported for nim
proc check_balance_workflow*(): JsonNode =
  ## GET /api/balances
  let url = "https://exchange-api.lcx.com/api/balances"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for nim
proc place_order_workflow*(BTC/USDC): JsonNode =
  ## GET /api/ticker
  let url = "https://exchange-api.lcx.com/api/ticker"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for nim
proc get_order_info*(order_response): JsonNode =
  ## GET /api/order
  let url = "https://exchange-api.lcx.com/api/order"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# None method not supported for nim
proc manage_open_orders_workflow*(0): JsonNode =
  ## GET /api/orderHistory
  let url = "https://exchange-api.lcx.com/api/orderHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# Workflow: ManageOpenOrdersWorkflow (sequence)

proc get_trade_history*(0): JsonNode =
  ## GET /api/uHistory
  let url = "https://exchange-api.lcx.com/api/uHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# None method not supported for nim
# PUT method not supported for nim
# DELETE method not supported for nim
# None method not supported for nim
proc account_monitoring_workflow*(): JsonNode =
  ## GET /api/balances
  let url = "https://exchange-api.lcx.com/api/balances"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# Workflow: AccountMonitoringWorkflow (sequence)

proc get_open_orders*(0): JsonNode =
  ## GET /api/open
  let url = "https://exchange-api.lcx.com/api/open"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_fees*(): JsonNode =
  ## GET /api/fees
  let url = "https://exchange-api.lcx.com/api/fees"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# None method not supported for nim
