import requests
import json

url = 'https://exchange-api.lcx.com/api/tickers'

headers = {'Content-Type': 'application/json'}
response = requests.get(url, headers=headers)

if response.status_code == 200:
    print(json.dumps(response.json()))
else:
    print(response.text)
