import httpclient
import json
import hmac
import base64


# POST method not supported for nim
proc check_order_status*(order_id): JsonNode =
  ## GET /api/trading/order/{order_id}
  let url = "https://exchange-api.lcx.com/api/trading/order/{order_id}"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data

# POST method not supported for nim
proc complete_order_flow*(currency): JsonNode =
  ## GET /api/account/balance
  let url = "https://exchange-api.lcx.com/api/account/balance"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)

  return data



# POST method not supported for nim
# None method not supported for nim
# None method not supported for nim
# None method not supported for nim
# None method not supported for nim
# None method not supported for nim
# None method not supported for nim
# None method not supported for nim
# None method not supported for nim
# None method not supported for nim
# None method not supported for nim
