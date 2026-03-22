import requests

url = "https://exchange-api.lcx.com/api/ticker"
params = {"pair": "ETH/BTC"}
headers = {"Content-Type": "application/json"}

response = requests.post(url, headers=headers, params=params)
print(response.json())
