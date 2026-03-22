using HTTP
response = HTTP.get("https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}")
println(String(response.body))
