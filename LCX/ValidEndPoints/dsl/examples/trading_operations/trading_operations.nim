import httpclient
import json
import hmac
import base64


# POST method not supported for nim
# POST method not supported for nim
# POST method not supported for nim
# PUT method not supported for nim
# PUT method not supported for nim
# PUT method not supported for nim
# DELETE method not supported for nim
# DELETE method not supported for nim
proc get_all_open_orders*(offset): JsonNode =
  ## GET /api/open
  let url = "https://exchange-api.lcx.com/api/open"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_open_orders_for_pair*(offset, pair): JsonNode =
  ## GET /api/open
  let url = "https://exchange-api.lcx.com/api/open"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_open_orders_with_date_range*(offset, pair, fromDate, toDate): JsonNode =
  ## GET /api/open
  let url = "https://exchange-api.lcx.com/api/open"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_single_order_status*(orderId): JsonNode =
  ## GET /api/order
  let url = "https://exchange-api.lcx.com/api/order"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_complete_order_history*(offset): JsonNode =
  ## GET /api/orderHistory
  let url = "https://exchange-api.lcx.com/api/orderHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_order_history_for_pair*(offset, pair): JsonNode =
  ## GET /api/orderHistory
  let url = "https://exchange-api.lcx.com/api/orderHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_order_history_by_status*(offset, orderStatus): JsonNode =
  ## GET /api/orderHistory
  let url = "https://exchange-api.lcx.com/api/orderHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_order_history_by_type*(offset, orderType): JsonNode =
  ## GET /api/orderHistory
  let url = "https://exchange-api.lcx.com/api/orderHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_filtered_order_history*(offset, pair, fromDate, toDate, side, orderStatus, orderType): JsonNode =
  ## GET /api/orderHistory
  let url = "https://exchange-api.lcx.com/api/orderHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_all_trade_history*(offset): JsonNode =
  ## GET /api/uHistory
  let url = "https://exchange-api.lcx.com/api/uHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_trade_history_for_pair*(offset, pair): JsonNode =
  ## GET /api/uHistory
  let url = "https://exchange-api.lcx.com/api/uHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_trade_history_by_date_range*(offset, pair, fromDate, toDate): JsonNode =
  ## GET /api/uHistory
  let url = "https://exchange-api.lcx.com/api/uHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc simple_buy_workflow*(order_result): JsonNode =
  ## GET /api/order
  let url = "https://exchange-api.lcx.com/api/order"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for nim
# PUT method not supported for nim
proc get_history*(0, BTC/USDC): JsonNode =
  ## GET /api/orderHistory
  let url = "https://exchange-api.lcx.com/api/orderHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

proc get_trades*(0, BTC/USDC): JsonNode =
  ## GET /api/uHistory
  let url = "https://exchange-api.lcx.com/api/uHistory"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# None method not supported for nim
# DELETE method not supported for nim
proc confirm_cancelled*(first_order_from_list): JsonNode =
  ## GET /api/order
  let url = "https://exchange-api.lcx.com/api/order"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# None method not supported for nim
