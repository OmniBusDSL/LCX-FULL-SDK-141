using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/tickers")
println(String(response.body))
