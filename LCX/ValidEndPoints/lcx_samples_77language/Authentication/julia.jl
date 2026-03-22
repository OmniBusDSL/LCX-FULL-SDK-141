using HTTP
response = HTTP.get("https://exchange-api.lcx.com")
println(String(response.body))
