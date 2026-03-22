import asyncio
import websockets
import json

async def on_message(message):
    print(message)

async def connect_websocket():
    url = 'wss://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}'
    async with websockets.connect(url) as websocket:
        msg = json.dumps({
            "Topic": "update",
            "Type": "user_trades"
        })
        await websocket.send(msg)
        async for message in websocket:
            await on_message(message)

asyncio.get_event_loop().run_until_complete(connect_websocket())
