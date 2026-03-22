$response = Invoke-WebRequest -Uri "https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}"
Write-Host $response.Content
