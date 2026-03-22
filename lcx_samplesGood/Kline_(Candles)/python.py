import requests

url = "https://api-kline.lcx.com/v1/market/kline"
params = {
    'pair': 'ETH/BTC',
    'resolution': '60',
    'from': 1608129416,
    'to': 1608229416,
}

headers = {
    'Content-Type': 'application/json',
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
