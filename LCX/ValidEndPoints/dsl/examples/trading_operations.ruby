require 'net/http'
require 'uri'
require 'json'
require 'openssl'


# POST method not supported for ruby
# POST method not supported for ruby
# POST method not supported for ruby
# PUT method not supported for ruby
# PUT method not supported for ruby
# PUT method not supported for ruby
# DELETE method not supported for ruby
# DELETE method not supported for ruby
def get_all_open_orders(offset)
  # GET /api/open
  uri = URI('https://exchange-api.lcx.com/api/open')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/open'
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

def get_open_orders_for_pair(offset, pair)
  # GET /api/open
  uri = URI('https://exchange-api.lcx.com/api/open')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/open'
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

def get_open_orders_with_date_range(offset, pair, fromDate, toDate)
  # GET /api/open
  uri = URI('https://exchange-api.lcx.com/api/open')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/open'
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

def get_single_order_status(orderId)
  # GET /api/order
  uri = URI('https://exchange-api.lcx.com/api/order')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/order'
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

def get_complete_order_history(offset)
  # GET /api/orderHistory
  uri = URI('https://exchange-api.lcx.com/api/orderHistory')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/orderHistory'
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

def get_order_history_for_pair(offset, pair)
  # GET /api/orderHistory
  uri = URI('https://exchange-api.lcx.com/api/orderHistory')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/orderHistory'
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

def get_order_history_by_status(offset, orderStatus)
  # GET /api/orderHistory
  uri = URI('https://exchange-api.lcx.com/api/orderHistory')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/orderHistory'
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

def get_order_history_by_type(offset, orderType)
  # GET /api/orderHistory
  uri = URI('https://exchange-api.lcx.com/api/orderHistory')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/orderHistory'
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

def get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType)
  # GET /api/orderHistory
  uri = URI('https://exchange-api.lcx.com/api/orderHistory')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/orderHistory'
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

def get_all_trade_history(offset)
  # GET /api/uHistory
  uri = URI('https://exchange-api.lcx.com/api/uHistory')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/uHistory'
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

def get_trade_history_for_pair(offset, pair)
  # GET /api/uHistory
  uri = URI('https://exchange-api.lcx.com/api/uHistory')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/uHistory'
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

def get_trade_history_by_date_range(offset, pair, fromDate, toDate)
  # GET /api/uHistory
  uri = URI('https://exchange-api.lcx.com/api/uHistory')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/uHistory'
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

def simple_buy_workflow(order_result)
  # GET /api/order
  uri = URI('https://exchange-api.lcx.com/api/order')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/order'
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

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for ruby
# PUT method not supported for ruby
def get_history(0, BTC/USDC)
  # GET /api/orderHistory
  uri = URI('https://exchange-api.lcx.com/api/orderHistory')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/orderHistory'
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

def get_trades(0, BTC/USDC)
  # GET /api/uHistory
  uri = URI('https://exchange-api.lcx.com/api/uHistory')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/uHistory'
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

# None method not supported for ruby
# DELETE method not supported for ruby
def confirm_cancelled(first_order_from_list)
  # GET /api/order
  uri = URI('https://exchange-api.lcx.com/api/order')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/order'
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

# None method not supported for ruby
