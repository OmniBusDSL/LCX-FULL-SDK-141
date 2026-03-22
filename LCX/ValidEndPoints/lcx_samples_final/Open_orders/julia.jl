using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/open")
println(String(response.body))
