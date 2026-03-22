$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com/api/tickers"
Write-Host $response.Content
