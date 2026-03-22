import requests

url = "https://exchange-api.lcx.com/api/pair"
params = {"pair": "ETH/BTC"}
headers = {"Content-Type": "application/json"}

response = requests.get(url, headers=headers, params=params)
print(response.json())
