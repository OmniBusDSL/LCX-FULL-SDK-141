require 'net/http'
require 'uri'
require 'json'
require 'openssl'


def fetch_all_tickers()
  # GET /api/tickers
  uri = URI('https://exchange-api.lcx.com/api/tickers')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
    data = JSON.parse(response.body)
    puts JSON.pretty_generate(data)
    data

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

def get_ticker_for_pair(pair)
  # GET /api/ticker
  uri = URI('https://exchange-api.lcx.com/api/ticker')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
    JSON.parse(response.body)

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

def fetch_all_pairs()
  # GET /api/pairs
  uri = URI('https://exchange-api.lcx.com/api/pairs')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
    data = JSON.parse(response.body)
    puts JSON.pretty_generate(data)
    data

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

def get_pair_info(pair_symbol)
  # GET /api/pair/BTC/USDC
  uri = URI('https://exchange-api.lcx.com/api/pair/BTC/USDC')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
    JSON.parse(response.body)

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

def get_order_book(pair)
  # GET /api/book
  uri = URI('https://exchange-api.lcx.com/api/book')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
    data = JSON.parse(response.body)
    puts JSON.pretty_generate(data)
    data

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

def get_recent_trades(pair, offset)
  # GET /api/trades
  uri = URI('https://exchange-api.lcx.com/api/trades')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
    JSON.parse(response.body)

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

def get_candle_data(pair, resolution, from_ts, to_ts)
  # GET /v1/market/kline
  uri = URI('https://api-kline.lcx.com/v1/market/kline')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
    data = JSON.parse(response.body)
    puts JSON.pretty_generate(data)
    data

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

def market_overview()
  # GET /api/book
  uri = URI('https://exchange-api.lcx.com/api/book')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

def get_trades()
  # GET /api/trades
  uri = URI('https://exchange-api.lcx.com/api/trades')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)

  else
    raise StandardError, "HTTP #{response.code}: #{response.body}"
  end
end

# None method not supported for ruby
