using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/balances")
println(String(response.body))
