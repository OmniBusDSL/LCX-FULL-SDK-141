using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/modify")
println(String(response.body))
