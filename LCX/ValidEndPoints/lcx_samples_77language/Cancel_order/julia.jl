using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/cancel")
println(String(response.body))
