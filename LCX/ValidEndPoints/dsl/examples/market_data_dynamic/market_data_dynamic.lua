local http = require("socket.http")
local json = require("cjson")


function fetch_all_pairs_data(pair)
  -- GET /api/ticker
  local url = "https://exchange-api.lcx.com/api/ticker"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then
    print(json.encode(json.decode(body)))
    return json.decode(body)

  else
    error("HTTP " .. code)
  end
end

# Workflow: FetchAllPairsData (sequence)

function get_ethusdc_ticker(pair)
  -- GET /api/ticker
  local url = "https://exchange-api.lcx.com/api/ticker"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then
    print(json.encode(json.decode(body)))
    return json.decode(body)

  else
    error("HTTP " .. code)
  end
end

function get_lcxusdc_ticker(pair)
  -- GET /api/ticker
  local url = "https://exchange-api.lcx.com/api/ticker"
  local http = require("socket.http")

  local body, code = http.request(url)
  if code == 200 then
    print(json.encode(json.decode(body)))
    return json.decode(body)

  else
    error("HTTP " .. code)
  end
end

