require 'net/http'

uri = URI('https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}')
response = Net::HTTP.get_response(uri)
puts response.body
