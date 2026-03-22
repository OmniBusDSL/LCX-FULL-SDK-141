using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/test")
println(String(response.body))
