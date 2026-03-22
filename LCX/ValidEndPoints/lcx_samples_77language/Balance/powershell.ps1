$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com/api/balance"
Write-Host $response.Content
