======================
LCX Exchange API v1.1.0
======================

:Author: LCX
:Date: 2026-03-21
:Version: 1.1.0

Introducere
============

LCX Exchange API oferă acces la date de piață, tranzacționare și cont printr-o interfață REST și WebSocket.

* **Base URL REST**: ``https://exchange-api.lcx.com``
* **Base URL Kline**: ``https://api-kline.lcx.com/v1/market/kline``
* **WebSocket URL**: ``wss://exchange-api.lcx.com/``
* **Header obligatoriu**: ``API-VERSION: 1.1.0``

Rate limiting
-------------

* Market API: 25 requesturi/secundă/IP
* Trading & Account API: 5 requesturi/secundă/IP și maxim 90 pe minut

Autentificare
-------------

Pentru endpoint-urile private (Trading, Account) se folosesc headerele:

* ``x-access-key`` – cheia API
* ``x-access-sign`` – semnătura HMAC-SHA256 (vezi formula mai jos)
* ``x-access-timestamp`` – timestamp în milisecunde

Semnătura se calculează astfel:

.. code-block:: js

   let requestString = method + endpoint + JSON.stringify(payload) // dacă payload gol: "{}"
   let hash = CryptoJS.HmacSHA256(requestString, secret)
   let signature = CryptoJS.enc.Base64.stringify(hash)

1. REST Public (Market Data)
============================

Aceste endpoint-uri nu necesită autentificare și returnează informații publice despre piețe și tranzacții.

Endpoint-uri publice
---------------------

.. list-table:: 
   :header-rows: 1
   :widths: 10 20 30 40

   * - Metodă
     - Endpoint
     - Descriere
     - Parametri
   * - ``GET``
     - ``/api/book``
     - Cartea de ordine completă
     - ``pair`` (string, required)
   * - ``GET``
     - ``/v1/market/kline``
     - Lumânări OHLV
     - ``pair``, ``resolution``, ``from``, ``to`` (secunde)
   * - ``GET``
     - ``/api/trades``
     - Trades publice recente
     - ``pair``, ``offset`` (page, size 100)
   * - ``GET``
     - ``/api/pairs``
     - Toate perechile disponibile
     - -
   * - ``GET``
     - ``/api/pair``
     - Detalii pereche specifică
     - ``pair`` (string, required)
   * - ``GET``
     - ``/api/tickers``
     - Toate ticker-ele
     - -
   * - ``POST``
     - ``/api/ticker``
     - Ticker pentru o pereche
     - ``pair`` (query param)

GET /api/book – Cartea de ordine
--------------------------------

Returnează lista completă de cumpărare și vânzare pentru o pereche.

* **Parametru**: ``pair`` (string, required)
* **Exemplu**: ``?pair=LCX/ETH``

.. code-block:: js
   :caption: Exemplu request

   var axios = require("axios");
   var params = { pair: "LCX/ETH" };
   axios.get("https://exchange-api.lcx.com/api/book", { params }).then(console.log);

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Successfully API response",
     "data": {
       "buy": [[0.022, 3], [0.02, 0]],
       "sell": []
     }
   }

GET /v1/market/kline – Lumânări
-------------------------------

Returnează date OHLV (Open, High, Low, Close, Volume) pentru o pereche și un interval de timp.

* **Parametri**:
  * ``pair`` (string, required)
  * ``resolution`` (string, required) – ``1``, ``3``, ``5``, ``15``, ``30``, ``45``, ``60``, ``120``, ``180``, ``240``, ``1D``, ``1W``, ``1M``
  * ``from`` (integer, required) – timestamp în secunde
  * ``to`` (integer, required) – timestamp în secunde
* **Exemplu**: ``?pair=ETH/BTC&resolution=60&from=1608129416&to=1608229416``

.. code-block:: js
   :caption: Exemplu request

   var params = {
     pair: "ETH/BTC",
     resolution: "60",
     from: 1608129416,
     to: 1608229416
   };
   axios.get("https://api-kline.lcx.com/v1/market/kline", { params }).then(console.log);

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Successfully Api response",
     "count": 3,
     "data": [
       {
         "pair": "ETH/BTC",
         "timeframe": "60",
         "timestamp": 1605722400000,
         "open": 0.021,
         "high": 0.022,
         "low": 0.021,
         "close": 1.022,
         "volume": 10
       }
     ]
   }

GET /api/trades – Trades publice
--------------------------------

Returnează ultimele tranzacții publice.

* **Parametri**:
  * ``pair`` (string, required)
  * ``offset`` (integer, required) – pagina, dimensiune fixă 100
* **Exemplu**: ``?pair=ETH/BTC&offset=1``

.. code-block:: js
   :caption: Exemplu request

   var params = { offset: 1, pair: "ETH/BTC" };
   axios.get("https://exchange-api.lcx.com/api/trades", { params }).then(console.log);

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Successfully Api response",
     "data": [
       [0.022, 0.01, "SELL", 1605725835],
       [0.021, 0, "BUY", 1605722975]
     ]
   }

GET /api/pairs – Toate perechile
--------------------------------

Returnează lista completă a perechilor de tranzacționare disponibile.

.. code-block:: js
   :caption: Exemplu request

   axios.get("https://exchange-api.lcx.com/api/pairs").then(console.log);

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Successfully API Response",
     "data": [
       {
         "Symbol": "POLK/BTC",
         "Base": "POLK",
         "Quote": "BTC",
         "MinOrder": { "Base": 0.01, "Quote": 0.00001 },
         "MaxOrder": { "Base": 1000, "Quote": 1 }
       }
     ]
   }

GET /api/pair – Detalii pereche
-------------------------------

Returnează informații detaliate pentru o pereche specifică.

* **Parametru**: ``pair`` (string, required)
* **Exemplu**: ``?pair=LCX/USDC``

.. code-block:: js
   :caption: Exemplu request

   var params = { pair: "ETH/BTC" };
   axios.get("https://exchange-api.lcx.com/api/pair", { params }).then(console.log);

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Successfully API Response",
     "data": {
       "Symbol": "LCX/USDC",
       "Base": "LCX",
       "Quote": "USDC",
       "Status": true
     }
   }

GET /api/tickers – Toate ticker-ele
-----------------------------------

Returnează o imagine de ansamblu a pieței pentru toate perechile.

.. code-block:: js
   :caption: Exemplu request

   axios.get("https://exchange-api.lcx.com/api/tickers").then(console.log);

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Tickers fetched successfully",
     "data": {
       "ADA/LCX": {
         "bestAsk": 7.8925,
         "bestBid": 7.6924,
         "lastPrice": 7.7925,
         "volume": 5079.69
       }
     }
   }

POST /api/ticker – Ticker pereche
---------------------------------

Returnează ticker-ul pentru o pereche specifică.

* **Parametru (query)**: ``pair`` (string, required)
* **Exemplu**: ``POST /api/ticker?pair=ETH/BTC``

.. code-block:: js
   :caption: Exemplu request (Javascript)

   var params = { pair: "ETH/BTC" };
   axios.post("https://exchange-api.lcx.com/api/ticker", null, { params }).then(console.log);

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Tickers fetched successfully",
     "data": {
       "bestAsk": 7.8925,
       "bestBid": 7.6924,
       "lastPrice": 7.7925
     }
   }

2. REST Privat (Trading)
========================

Toate endpoint-urile de trading necesită autentificare (headerele ``x-access-*``) și respectă rate limiting-ul specific.

Endpoint-uri trading
--------------------

.. list-table::
   :header-rows: 1
   :widths: 10 20 30 40

   * - Metodă
     - Endpoint
     - Descriere
     - Corp / Parametri (query)
   * - ``POST``
     - ``/api/create``
     - Creează ordin
     - ``Pair``, ``Amount``, ``Price`` (limit), ``OrderType`` (LIMIT/MARKET), ``Side`` (BUY/SELL), ``ClientOrderId`` (opțional)
   * - ``PUT``
     - ``/api/modify``
     - Modifică ordin limită deschis
     - ``OrderId``, ``Amount``, ``Price``
   * - ``DELETE``
     - ``/api/cancel``
     - Anulează un ordin
     - ``orderId`` (query)
   * - ``DELETE``
     - ``/order/cancel-all``
     - Anulează mai multe ordine
     - ``orderIds`` (array, max 25, query)
   * - ``GET``
     - ``/api/open``
     - Ordine deschise
     - ``offset`` (required), ``pair``, ``fromDate``, ``toDate`` (ms)
   * - ``GET``
     - ``/api/order``
     - Detalii ordin specific
     - ``orderId`` (query)
   * - ``GET``
     - ``/api/orderHistory``
     - Istoric ordine închise/cancelate
     - ``offset`` (required), ``pair``, ``fromDate``, ``toDate``, ``side``, ``orderStatus``, ``orderType``
   * - ``GET``
     - ``/api/uHistory``
     - Istoric propriu trades
     - ``offset`` (required), ``pair``, ``fromDate``, ``toDate``

POST /api/create – Creează ordin
--------------------------------

.. code-block:: json
   :caption: Corp request

   {
     "Pair": "LCX/ETH",
     "Amount": 100,
     "Price": 0.004,
     "OrderType": "MARKET",
     "Side": "SELL"
   }

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Order created successfully",
     "data": {
       "Id": "3dae4495-a219-40dc-99d8-99c49c1d3810",
       "Pair": "AVAX/USDC",
       "Price": 1,
       "Amount": 10,
       "Side": "SELL",
       "OrderType": "LIMIT",
       "Status": "OPEN"
     }
   }

PUT /api/modify – Modifică ordin
--------------------------------

.. code-block:: json
   :caption: Corp request

   {
     "OrderId": "9f898d18-0980-4fb3-b18c-eeb39fc20324",
     "Amount": 100,
     "Price": 0.004
   }

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Order updated successfully",
     "data": { ... }
   }

DELETE /api/cancel – Anulează un ordin
--------------------------------------

* **Parametru query**: ``orderId`` (string, required)

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Order removed successfully",
     "data": { ... }
   }

DELETE /order/cancel-all – Anulează mai multe ordine
----------------------------------------------------

* **Parametru query**: ``orderIds`` (array, max 25)

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "2 orders cancelled successfully"
   }

GET /api/open – Ordine deschise
-------------------------------

* **Parametri query**:
  * ``offset`` (integer, required)
  * ``pair`` (string, optional)
  * ``fromDate`` (integer, optional, ms)
  * ``toDate`` (integer, optional, ms)

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Orders fetched successfully",
     "totalCount": 7,
     "data": [ ... ]
   }

GET /api/order – Detalii ordin
------------------------------

* **Parametru query**: ``orderId`` (string, required)

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Order fetched successfully",
     "data": { ... }
   }

GET /api/orderHistory – Istoric ordine
--------------------------------------

* **Parametri query**:
  * ``offset`` (integer, required)
  * ``pair`` (string, optional)
  * ``fromDate`` (integer, optional, ms)
  * ``toDate`` (integer, optional, ms)
  * ``side`` (string, optional, ``BUY``/``SELL``)
  * ``orderStatus`` (string, optional, ``CANCEL``/``CLOSED``)
  * ``orderType`` (string, optional, ``LIMIT``/``MARKET``)

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Orders fetched successfully",
     "totalCount": 2307049,
     "data": [ ... ]
   }

GET /api/uHistory – Istoric propriu trades
------------------------------------------

* **Parametri query**:
  * ``offset`` (integer, required)
  * ``pair`` (string, optional)
  * ``fromDate`` (integer, optional, ms)
  * ``toDate`` (integer, optional, ms)

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Successfully Api response",
     "totalCount": 1,
     "data": [
       {
         "Id": "2d9d0338-ae79-4f3d-962d-2d658750328c",
         "Pair": "LCX/EUR",
         "Price": 0.0386,
         "Amount": 100,
         "Side": "BUY"
       }
     ]
   }

3. REST Privat (Account)
========================

Endpoint-uri cont
-----------------

.. list-table::
   :header-rows: 1
   :widths: 10 20 30

   * - Metodă
     - Endpoint
     - Descriere
     - Parametri
   * - ``GET``
     - ``/api/balances``
     - Toate soldurile
     - -
   * - ``GET``
     - ``/api/balance``
     - Sold pentru un coin specific
     - ``coin`` (query, required)

GET /api/balances – Toate soldurile
-----------------------------------

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Wallets fetched successfully",
     "totalBalance": { "inBTC": 60252968.05, "inUSD": 2213935058063.5 },
     "data": [
       {
         "coin": "USDC",
         "balance": { "freeBalance": 180611.65914222, "occupiedBalance": 0, "totalBalance": 180611.65914222 }
       }
     ]
   }

GET /api/balance – Sold pe coin
-------------------------------

* **Parametru query**: ``coin`` (string, required)

.. code-block:: json
   :caption: Răspuns (200)

   {
     "status": "success",
     "message": "Successfully Api response",
     "data": {
       "Coin": "LCX",
       "TotalBalance": 1011.02768906,
       "FreeBalance": 911.02768906,
       "OccupiedBalance": 100,
       "Decimals": 18
     }
   }

4. WebSocket Public (Market)
============================

Conexiunea se face la ``wss://exchange-api.lcx.com/``. Pentru a menține conexiunea, trimite un mesaj ``ping`` la fiecare 60 de secunde.

Abonare la ticker
-----------------

.. code-block:: json

   {
     "Topic": "subscribe",
     "Type": "ticker"
   }

Abonare la orderbook
--------------------

.. code-block:: json

   {
     "Topic": "subscribe",
     "Type": "orderbook"
   }

Abonare la trade-uri publice
----------------------------

.. code-block:: json

   {
     "Topic": "subscribe",
     "Type": "trade"
   }

Pentru dezabonare, folosește ``"Topic": "unsubscribe"``.

5. WebSocket Privat (Autentificat)
==================================

Conexiunea se face la aceeași adresă, dar cu parametri de autentificare în URL:

``wss://exchange-api.lcx.com/?x-access-key=KEY&x-access-sign=SIGNATURE&x-access-timestamp=MS``

Abonare la portofel
-------------------

.. code-block:: json

   {
     "Topic": "subscribe",
     "Type": "user_wallets"
   }

Abonare la ordinele proprii
---------------------------

.. code-block:: json

   {
     "Topic": "subscribe",
     "Type": "user_orders"
   }

Abonare la trade-urile proprii
------------------------------

.. code-block:: json

   {
     "Topic": "subscribe",
     "Type": "user_trades"
   }

Toate abonamentele primesc snapshot inițial și actualizări incrementale.

Note suplimentare
=================

* Toate timestamp-urile din răspunsuri sunt în **milisecunde** (cu excepția endpoint-ului ``/v1/market/kline`` care folosește secunde).
* Pentru ordinele ``MARKET``, câmpul ``Price`` nu este necesar.
* Pentru a genera semnătura, asigură-te că ``requestString`` folosește exact calea endpoint-ului (de exemplu ``/api/create``) și corpul serializat fără spații suplimentare.
* Rate limiting: în caz de depășire, se returnează codul HTTP ``429``.
* Pentru WebSocket, se recomandă implementarea unui mecanism de heartbeat (ping) la fiecare 60 de secunde.

Întrebări frecvente
===================

*Cum obțin o cheie API?* – Accesează setările contului pe LCX Exchange și generează o pereche cheie/secret.

*Ce se întâmplă dacă depășesc limita de rate?* – Primești codul HTTP ``429``.

*Pot folosi WebSocket-ul pentru a primi actualizări în timp real?* – Da, atât pentru date publice cât și pentru date private.

*Există un SDK oficial?* – LCX oferă SDK-uri pentru JavaScript, Python, Java, Golang și PHP. Detalii în documentația oficială.

*De ce unele endpoint-uri sunt marcate ca POST, dar au parametri în query?* – Este o particularitate a API-ului LCX. Respectă specificația din documentația oficială.
