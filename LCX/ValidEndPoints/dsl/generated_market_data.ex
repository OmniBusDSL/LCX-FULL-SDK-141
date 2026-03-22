defmodule APIClient do
  require HTTPoison
  require Jason
end


def fetch_all_tickers() do
  # GET /api/tickers
  url = "https://exchange-api.lcx.com/api/tickers"
  headers = [{"Content-Type", "application/json"}]

  case HTTPoison.get(url, headers) do
    {:ok, response} ->
      {{:ok, Jason.decode!(response.body)}}

    {:error, reason} ->
      {:error, reason}
  end
end

def get_ticker_for_pair(pair) do
  # GET /api/ticker
  url = "https://exchange-api.lcx.com/api/ticker"
  headers = [{"Content-Type", "application/json"}]

  case HTTPoison.get(url, headers) do
    {:ok, response} ->

    {:error, reason} ->
      {:error, reason}
  end
end

def fetch_all_pairs() do
  # GET /api/pairs
  url = "https://exchange-api.lcx.com/api/pairs"
  headers = [{"Content-Type", "application/json"}]

  case HTTPoison.get(url, headers) do
    {:ok, response} ->
      {{:ok, Jason.decode!(response.body)}}

    {:error, reason} ->
      {:error, reason}
  end
end

def get_pair_info(pair_symbol) do
  # GET /api/pair/BTC/USDC
  url = "https://exchange-api.lcx.com/api/pair/BTC/USDC"
  headers = [{"Content-Type", "application/json"}]

  case HTTPoison.get(url, headers) do
    {:ok, response} ->

    {:error, reason} ->
      {:error, reason}
  end
end

def get_order_book(pair) do
  # GET /api/book
  url = "https://exchange-api.lcx.com/api/book"
  headers = [{"Content-Type", "application/json"}]

  case HTTPoison.get(url, headers) do
    {:ok, response} ->
      {{:ok, Jason.decode!(response.body)}}

    {:error, reason} ->
      {:error, reason}
  end
end

def get_recent_trades(pair, offset) do
  # GET /api/trades
  url = "https://exchange-api.lcx.com/api/trades"
  headers = [{"Content-Type", "application/json"}]

  case HTTPoison.get(url, headers) do
    {:ok, response} ->

    {:error, reason} ->
      {:error, reason}
  end
end

def get_candle_data(pair, resolution, from_ts, to_ts) do
  # GET /v1/market/kline
  url = "https://api-kline.lcx.com/v1/market/kline"
  headers = [{"Content-Type", "application/json"}]

  case HTTPoison.get(url, headers) do
    {:ok, response} ->
      {{:ok, Jason.decode!(response.body)}}

    {:error, reason} ->
      {:error, reason}
  end
end

def market_overview() do
  # GET /api/book
  url = "https://exchange-api.lcx.com/api/book"
  headers = [{"Content-Type", "application/json"}]

  case HTTPoison.get(url, headers) do
    {:ok, response} ->

    {:error, reason} ->
      {:error, reason}
  end
end

def get_trades() do
  # GET /api/trades
  url = "https://exchange-api.lcx.com/api/trades"
  headers = [{"Content-Type", "application/json"}]

  case HTTPoison.get(url, headers) do
    {:ok, response} ->

    {:error, reason} ->
      {:error, reason}
  end
end

# None method not supported for elixir
