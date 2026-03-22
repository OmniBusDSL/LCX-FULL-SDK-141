import requests

url = 'https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}'
headers = {'Content-Type': 'application/json'}

response = requests.get(url, headers=headers)
print(response.json())
