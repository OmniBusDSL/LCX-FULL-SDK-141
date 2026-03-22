$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com"
Write-Host $response.Content
