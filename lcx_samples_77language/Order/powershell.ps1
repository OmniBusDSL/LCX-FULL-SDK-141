$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com/api/order"
Write-Host $response.Content
