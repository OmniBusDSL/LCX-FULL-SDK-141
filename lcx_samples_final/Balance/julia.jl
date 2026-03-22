using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/balance")
println(String(response.body))
