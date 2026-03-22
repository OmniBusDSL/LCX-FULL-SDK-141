local http = require("socket.http")
local json = require("cjson")


# POST method not supported for lua
function check_order_status(order_id)
  -- GET /api/trading/order/{order_id}
  local url = "https://exchange-api.lcx.com/api/trading/order/{order_id}"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end

# POST method not supported for lua
function complete_order_flow(currency)
  -- GET /api/account/balance
  local url = "https://exchange-api.lcx.com/api/account/balance"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then

  else
    error("HTTP " .. code)
  end
end



# POST method not supported for lua
# None method not supported for lua
# None method not supported for lua
# None method not supported for lua
# None method not supported for lua
# None method not supported for lua
# None method not supported for lua
# None method not supported for lua
# None method not supported for lua
# None method not supported for lua
# None method not supported for lua
