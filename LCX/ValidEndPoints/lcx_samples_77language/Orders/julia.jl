using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/orderHistory")
println(String(response.body))
