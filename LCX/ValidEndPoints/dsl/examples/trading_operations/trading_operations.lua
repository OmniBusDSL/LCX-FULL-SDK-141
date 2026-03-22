local http = require("socket.http")
local json = require("cjson")


# POST method not supported for lua
# POST method not supported for lua
# POST method not supported for lua
# PUT method not supported for lua
# PUT method not supported for lua
# PUT method not supported for lua
# DELETE method not supported for lua
# DELETE method not supported for lua
function get_all_open_orders(offset)
  -- GET /api/open
  local url = "https://exchange-api.lcx.com/api/open"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_open_orders_for_pair(offset, pair)
  -- GET /api/open
  local url = "https://exchange-api.lcx.com/api/open"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_open_orders_with_date_range(offset, pair, fromDate, toDate)
  -- GET /api/open
  local url = "https://exchange-api.lcx.com/api/open"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_single_order_status(orderId)
  -- GET /api/order
  local url = "https://exchange-api.lcx.com/api/order"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_complete_order_history(offset)
  -- GET /api/orderHistory
  local url = "https://exchange-api.lcx.com/api/orderHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_order_history_for_pair(offset, pair)
  -- GET /api/orderHistory
  local url = "https://exchange-api.lcx.com/api/orderHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_order_history_by_status(offset, orderStatus)
  -- GET /api/orderHistory
  local url = "https://exchange-api.lcx.com/api/orderHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_order_history_by_type(offset, orderType)
  -- GET /api/orderHistory
  local url = "https://exchange-api.lcx.com/api/orderHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType)
  -- GET /api/orderHistory
  local url = "https://exchange-api.lcx.com/api/orderHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_all_trade_history(offset)
  -- GET /api/uHistory
  local url = "https://exchange-api.lcx.com/api/uHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_trade_history_for_pair(offset, pair)
  -- GET /api/uHistory
  local url = "https://exchange-api.lcx.com/api/uHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_trade_history_by_date_range(offset, pair, fromDate, toDate)
  -- GET /api/uHistory
  local url = "https://exchange-api.lcx.com/api/uHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function simple_buy_workflow(order_result)
  -- GET /api/order
  local url = "https://exchange-api.lcx.com/api/order"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for lua
# PUT method not supported for lua
function get_history(0, BTC/USDC)
  -- GET /api/orderHistory
  local url = "https://exchange-api.lcx.com/api/orderHistory"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

function get_trades(0, BTC/USDC)
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
# DELETE method not supported for lua
function confirm_cancelled(first_order_from_list)
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
