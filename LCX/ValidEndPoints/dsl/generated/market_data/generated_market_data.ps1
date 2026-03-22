# PowerShell API Client


function fetch_all_tickers() {
    # GET /api/tickers
    $url = "https://exchange-api.lcx.com/api/tickers"
    $headers = @{"Content-Type" = "application/json"}

    try {
        $response = Invoke-WebRequest -Uri $url -Method Get -Headers $headers
        Write-Host $response.Content
        return $response.Content | ConvertFrom-Json
    } catch {
        Write-Error "Request failed: $_"
    }
}

function get_ticker_for_pair(pair) {
    # GET /api/ticker
    $url = "https://exchange-api.lcx.com/api/ticker"
    $headers = @{"Content-Type" = "application/json"}

    try {
        $response = Invoke-WebRequest -Uri $url -Method Get -Headers $headers
        Write-Host $response.Content
        return $response.Content | ConvertFrom-Json
    } catch {
        Write-Error "Request failed: $_"
    }
}

function fetch_all_pairs() {
    # GET /api/pairs
    $url = "https://exchange-api.lcx.com/api/pairs"
    $headers = @{"Content-Type" = "application/json"}

    try {
        $response = Invoke-WebRequest -Uri $url -Method Get -Headers $headers
        Write-Host $response.Content
        return $response.Content | ConvertFrom-Json
    } catch {
        Write-Error "Request failed: $_"
    }
}

function get_pair_info(pair_symbol) {
    # GET /api/pair/BTC/USDC
    $url = "https://exchange-api.lcx.com/api/pair/BTC/USDC"
    $headers = @{"Content-Type" = "application/json"}

    try {
        $response = Invoke-WebRequest -Uri $url -Method Get -Headers $headers
        Write-Host $response.Content
        return $response.Content | ConvertFrom-Json
    } catch {
        Write-Error "Request failed: $_"
    }
}

function get_order_book(pair) {
    # GET /api/book
    $url = "https://exchange-api.lcx.com/api/book"
    $headers = @{"Content-Type" = "application/json"}

    try {
        $response = Invoke-WebRequest -Uri $url -Method Get -Headers $headers
        Write-Host $response.Content
        return $response.Content | ConvertFrom-Json
    } catch {
        Write-Error "Request failed: $_"
    }
}

function get_recent_trades(pair, offset) {
    # GET /api/trades
    $url = "https://exchange-api.lcx.com/api/trades"
    $headers = @{"Content-Type" = "application/json"}

    try {
        $response = Invoke-WebRequest -Uri $url -Method Get -Headers $headers
        Write-Host $response.Content
        return $response.Content | ConvertFrom-Json
    } catch {
        Write-Error "Request failed: $_"
    }
}

function get_candle_data(pair, resolution, from_ts, to_ts) {
    # GET /v1/market/kline
    $url = "https://api-kline.lcx.com/v1/market/kline"
    $headers = @{"Content-Type" = "application/json"}

    try {
        $response = Invoke-WebRequest -Uri $url -Method Get -Headers $headers
        Write-Host $response.Content
        return $response.Content | ConvertFrom-Json
    } catch {
        Write-Error "Request failed: $_"
    }
}

function market_overview() {
    # GET /api/book
    $url = "https://exchange-api.lcx.com/api/book"
    $headers = @{"Content-Type" = "application/json"}

    try {
        $response = Invoke-WebRequest -Uri $url -Method Get -Headers $headers
        Write-Host $response.Content
        return $response.Content | ConvertFrom-Json
    } catch {
        Write-Error "Request failed: $_"
    }
}

function get_trades() {
    # GET /api/trades
    $url = "https://exchange-api.lcx.com/api/trades"
    $headers = @{"Content-Type" = "application/json"}

    try {
        $response = Invoke-WebRequest -Uri $url -Method Get -Headers $headers
        Write-Host $response.Content
        return $response.Content | ConvertFrom-Json
    } catch {
        Write-Error "Request failed: $_"
    }
}

# None method not supported for powershell
