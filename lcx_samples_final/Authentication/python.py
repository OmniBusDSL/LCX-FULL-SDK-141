import requests

url = 'https://exchange-api.lcx.com'
headers = {'Content-Type': 'application/json'}

response = requests.post(url, headers=headers)
print(response.json())
