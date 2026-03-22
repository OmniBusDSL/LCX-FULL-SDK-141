import requests

url = 'https://exchange-api.lcx.com/api/balances'

headers = {
    'Content-Type': 'application/json',
    # Add authentication headers here
}

response = requests.get(url, headers=headers)

if response.status_code == 200:
    print(json.dumps(response.json()))
else:
    print(response.text)
