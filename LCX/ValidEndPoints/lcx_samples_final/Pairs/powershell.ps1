$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com/api/pairs"
Write-Host $response.Content
