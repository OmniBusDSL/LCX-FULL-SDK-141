import asyncio
import websockets
import json

async def on_message(message):
    print(message)

async def connect_websocket():
    uri = "wss://exchange-api.lcx.com/ws"
    async with websockets.connect(uri) as websocket:
        msg = json.dumps({
            "Topic": "subscribe",
            "Type": "ticker"
        })
        await websocket.send(msg)
        async for message in websocket:
            await on_message(message)

asyncio.get_event_loop().run_until_complete(connect_websocket())
