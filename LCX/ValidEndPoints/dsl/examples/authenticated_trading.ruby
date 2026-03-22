require 'net/http'
require 'uri'
require 'json'
require 'openssl'


def get_account_info()
  # GET /api/account
  uri = URI('https://exchange-api.lcx.com/api/account')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/account'
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

def get_balances()
  # GET /api/balances
  uri = URI('https://exchange-api.lcx.com/api/balances')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/balances'
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

def get_asset_balance(asset)
  # GET /api/balance
  uri = URI('https://exchange-api.lcx.com/api/balance')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/balance'
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

def get_trading_fees()
  # GET /api/fees
  uri = URI('https://exchange-api.lcx.com/api/fees')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/fees'
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

def get_open_orders(offset, pair)
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

def get_order_details(orderId)
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

def get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType)
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

def get_user_trade_history(offset, pair, fromDate, toDate)
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

# POST method not supported for ruby
# PUT method not supported for ruby
# DELETE method not supported for ruby
# DELETE method not supported for ruby
def check_balance_workflow()
  # GET /api/balances
  uri = URI('https://exchange-api.lcx.com/api/balances')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/balances'
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

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for ruby
def place_order_workflow(BTC/USDC)
  # GET /api/ticker
  uri = URI('https://exchange-api.lcx.com/api/ticker')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for ruby
def get_order_info(order_response)
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
def manage_open_orders_workflow(0)
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

# Workflow: ManageOpenOrdersWorkflow (sequence)

def get_trade_history(0)
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
# PUT method not supported for ruby
# DELETE method not supported for ruby
# None method not supported for ruby
def account_monitoring_workflow()
  # GET /api/balances
  uri = URI('https://exchange-api.lcx.com/api/balances')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/balances'
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

# Workflow: AccountMonitoringWorkflow (sequence)

def get_open_orders(0)
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

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

def get_fees()
  # GET /api/fees
  uri = URI('https://exchange-api.lcx.com/api/fees')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  api_key = ENV['LCX_API_KEY']
  api_secret = ENV['LCX_API_SECRET']
  timestamp = (Time.now.to_f * 1000).to_i.to_s
  message = timestamp + 'GET' + '/api/fees'
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
