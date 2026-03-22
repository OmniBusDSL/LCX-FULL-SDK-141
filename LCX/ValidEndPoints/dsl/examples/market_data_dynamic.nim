import httpclient
import json
import hmac
import base64


proc fetch_all_pairs_data*(pair): JsonNode =
  ## GET /api/ticker
  let url = "https://exchange-api.lcx.com/api/ticker"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)
  echo data

  return data

# Workflow: FetchAllPairsData (sequence)

proc get_ethusdc_ticker*(pair): JsonNode =
  ## GET /api/ticker
  let url = "https://exchange-api.lcx.com/api/ticker"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)
  echo data

  return data

proc get_lcxusdc_ticker*(pair): JsonNode =
  ## GET /api/ticker
  let url = "https://exchange-api.lcx.com/api/ticker"

  let client = newHttpClient()
  let response = client.get(url)
  let data = parseJson(response.body)
  echo data

  return data

