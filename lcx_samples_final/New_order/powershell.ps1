$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com/api/create"
Write-Host $response.Content
