import requests
import json

url = 'https://exchange-api.lcx.com/api/modify'
data = {
    "OrderId": "9f898d18-0980-4fb3-b18c-eeb39fc20324",
    "Amount": 100,
    "Price": 0.004
}

headers = {
    'Content-Type': 'application/json',
    # Add authentication headers here
}

response = requests.put(url, data=json.dumps(data), headers=headers)

if response.status_code == 200:
    print(json.dumps(response.json()))
else:
    print(response.text)
