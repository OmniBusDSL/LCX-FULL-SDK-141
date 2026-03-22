$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com/api/balances"
Write-Host $response.Content
