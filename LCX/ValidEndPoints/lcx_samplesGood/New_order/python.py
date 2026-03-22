import requests
import json

url = 'https://exchange-api.lcx.com/api/create'
data = {
    "Pair": "LCX/ETH",
    "Amount": 100,
    "Price": 0.004,
    "OrderType": "MARKET",
    "Side": "SELL"
}

headers = {
    'Content-Type': 'application/json',
    # Add authentication headers here
}

response = requests.post(url, data=json.dumps(data), headers=headers)

if response.status_code == 200:
    print(json.dumps(response.json()))
else:
    print(response.text)
