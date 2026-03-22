% MATLAB HTTP client

function output = fetch_all_tickers()
    url = "https://exchange-api.lcx.com/api/tickers";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_ticker_for_pair(pair)
    url = "https://exchange-api.lcx.com/api/ticker";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = fetch_all_pairs()
    url = "https://exchange-api.lcx.com/api/pairs";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_pair_info(pair_symbol)
    url = "https://exchange-api.lcx.com/api/pair/BTC/USDC";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_order_book(pair)
    url = "https://exchange-api.lcx.com/api/book";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_recent_trades(pair, offset)
    url = "https://exchange-api.lcx.com/api/trades";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_candle_data(pair, resolution, from_ts, to_ts)
    url = "https://api-kline.lcx.com/v1/market/kline";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = market_overview()
    url = "https://exchange-api.lcx.com/api/book";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# Workflow: MarketOverview (sequence)

function output = get_trades()
    url = "https://exchange-api.lcx.com/api/trades";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# None method not supported for matlab
