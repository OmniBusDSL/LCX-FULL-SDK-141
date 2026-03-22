using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/pairs")
println(String(response.body))
