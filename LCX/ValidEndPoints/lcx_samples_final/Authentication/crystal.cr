require "http/client"
puts HTTP::Client.get("https://exchange-api.lcx.com").body
