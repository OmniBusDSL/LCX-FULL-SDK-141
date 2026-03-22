$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com/api/open"
Write-Host $response.Content
