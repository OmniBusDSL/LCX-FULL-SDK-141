using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/create")
println(String(response.body))
