using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/order")
println(String(response.body))
