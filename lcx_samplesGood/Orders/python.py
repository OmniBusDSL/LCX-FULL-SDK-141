import requests

url = 'https://exchange-api.lcx.com/api/orderHistory'
params = {'pair': 'ETH/BTC', 'offset': 1}
headers = {
    'Content-Type': 'application/json',
    # Add your authentication headers here
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
