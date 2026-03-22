import requests

url = 'https://exchange-api.lcx.com/api/order'
params = {'orderId': 'e8737c4a-3804-461c-9e67-4fe0af5aeb06'}
headers = {
    'Content-Type': 'application/json',
    # Add your authentication headers here
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
