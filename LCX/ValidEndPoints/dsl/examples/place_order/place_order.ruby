require 'net/http'
require 'uri'
require 'json'
require 'openssl'


# POST method not supported for ruby
def check_order_status(order_id)
  # GET /api/trading/order/{order_id}
  uri = URI('https://exchange-api.lcx.com/api/trading/order/{order_id}')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/trading/order/{order_id}'
  signature = Base64.encode64(
    OpenSSL::HMAC.digest('sha256', api_secret, message)
  ).strip
  request['x-access-key'] = api_key
  request['x-access-sign'] = signature
  request['x-access-timestamp'] = timestamp

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
    JSON.parse(response.body)

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

# POST method not supported for ruby
def complete_order_flow(currency)
  # GET /api/account/balance
  uri = URI('https://exchange-api.lcx.com/api/account/balance')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/account/balance'
  signature = Base64.encode64(
    OpenSSL::HMAC.digest('sha256', api_secret, message)
  ).strip
  request['x-access-key'] = api_key
  request['x-access-sign'] = signature
  request['x-access-timestamp'] = timestamp

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end



# POST method not supported for ruby
# None method not supported for ruby
# None method not supported for ruby
# None method not supported for ruby
# None method not supported for ruby
# None method not supported for ruby
# None method not supported for ruby
# None method not supported for ruby
# None method not supported for ruby
# None method not supported for ruby
# None method not supported for ruby
