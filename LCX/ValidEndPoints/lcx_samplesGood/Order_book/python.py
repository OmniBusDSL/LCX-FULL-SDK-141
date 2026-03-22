import requests

url = "https://exchange-api.lcx.com/api/book"
params = {"pair": "LCX/ETH"}
headers = {"Content-Type": "application/json"}

response = requests.get(url, headers=headers, params=params)
print(response.json())
