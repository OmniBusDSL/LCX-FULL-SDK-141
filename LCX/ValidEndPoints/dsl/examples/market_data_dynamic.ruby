require 'net/http'
require 'uri'
require 'json'
require 'openssl'


def fetch_all_pairs_data(pair)
  # GET /api/ticker
  uri = URI('https://exchange-api.lcx.com/api/ticker')
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

# Workflow: FetchAllPairsData (sequence)

def get_ethusdc_ticker(pair)
  # GET /api/ticker
  uri = URI('https://exchange-api.lcx.com/api/ticker')
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

def get_lcxusdc_ticker(pair)
  # GET /api/ticker
  uri = URI('https://exchange-api.lcx.com/api/ticker')
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

