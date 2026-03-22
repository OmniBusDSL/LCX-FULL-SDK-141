require 'net/http'

uri = URI('https://exchange-api.lcx.com/api/test')
response = Net::HTTP.get_response(uri)
puts response.body
