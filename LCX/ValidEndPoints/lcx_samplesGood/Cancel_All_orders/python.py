import requests

url = "https://exchange-api.lcx.com/order/cancel-all"
headers = {
    # Add your auth headers here
}

params = {
    'orderIds': [
        '70aba300-0990-481d-ad76-7bd499f473ab',
        'ecaf000a-8f4c-459a-b105-784c0e0436df',
    ],
}

response = requests.delete(url, headers=headers, params=params)

print(response.json())
