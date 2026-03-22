require "http/client"
puts HTTP::Client.get("https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}").body
