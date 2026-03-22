$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com/api/orderHistory"
Write-Host $response.Content
