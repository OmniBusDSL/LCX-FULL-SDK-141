import requests

url = 'https://exchange-api.lcx.com/api/cancel'
params = {'orderId': 'e8737c4a-3804-461c-9e67-4fe0af5aeb06'}
headers = {
    'Content-Type': 'application/json',
    # Add your authentication headers here
}

response = requests.delete(url, headers=headers, params=params)
print(response.json())
