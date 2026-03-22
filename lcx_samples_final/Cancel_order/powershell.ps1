$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com/api/cancel"
Write-Host $response.Content
