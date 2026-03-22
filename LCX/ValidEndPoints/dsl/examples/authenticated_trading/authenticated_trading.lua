local http = require("socket.http")
local json = require("cjson")


function get_account_info()
  -- GET /api/account
  local url = "https://exchange-api.lcx.com/api/account"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_balances()
  -- GET /api/balances
  local url = "https://exchange-api.lcx.com/api/balances"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_asset_balance(asset)
  -- GET /api/balance
  local url = "https://exchange-api.lcx.com/api/balance"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_trading_fees()
  -- GET /api/fees
  local url = "https://exchange-api.lcx.com/api/fees"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_open_orders(offset, pair)
  -- GET /api/open
  local url = "https://exchange-api.lcx.com/api/open"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_order_details(orderId)
  -- GET /api/order
  local url = "https://exchange-api.lcx.com/api/order"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType)
  -- GET /api/orderHistory
  local url = "https://exchange-api.lcx.com/api/orderHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_user_trade_history(offset, pair, fromDate, toDate)
  -- GET /api/uHistory
  local url = "https://exchange-api.lcx.com/api/uHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

# POST method not supported for lua
# PUT method not supported for lua
# DELETE method not supported for lua
# DELETE method not supported for lua
function check_balance_workflow()
  -- GET /api/balances
  local url = "https://exchange-api.lcx.com/api/balances"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for lua
function place_order_workflow(BTC/USDC)
  -- GET /api/ticker
  local url = "https://exchange-api.lcx.com/api/ticker"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for lua
function get_order_info(order_response)
  -- GET /api/order
  local url = "https://exchange-api.lcx.com/api/order"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

# None method not supported for lua
function manage_open_orders_workflow(0)
  -- GET /api/orderHistory
  local url = "https://exchange-api.lcx.com/api/orderHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

# Workflow: ManageOpenOrdersWorkflow (sequence)

function get_trade_history(0)
  -- GET /api/uHistory
  local url = "https://exchange-api.lcx.com/api/uHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

# None method not supported for lua
# PUT method not supported for lua
# DELETE method not supported for lua
# None method not supported for lua
function account_monitoring_workflow()
  -- GET /api/balances
  local url = "https://exchange-api.lcx.com/api/balances"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

# Workflow: AccountMonitoringWorkflow (sequence)

function get_open_orders(0)
  -- GET /api/open
  local url = "https://exchange-api.lcx.com/api/open"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_fees()
  -- GET /api/fees
  local url = "https://exchange-api.lcx.com/api/fees"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

# None method not supported for lua
