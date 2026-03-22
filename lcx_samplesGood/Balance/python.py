import requests

url = 'https://exchange-api.lcx.com/api/balance'
params = {'coin': 'ETH'}
headers = {
    'Content-Type': 'application/json',
    # Add your authentication headers here
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
