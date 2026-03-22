import requests

url = 'https://exchange-api.lcx.com/api/modify'
headers = {'Content-Type': 'application/json'}

response = requests.get(url, headers=headers)
print(response.json())
