% MATLAB HTTP client

function output = get_account_info()
    url = "https://exchange-api.lcx.com/api/account";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_balances()
    url = "https://exchange-api.lcx.com/api/balances";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_asset_balance(asset)
    url = "https://exchange-api.lcx.com/api/balance";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_trading_fees()
    url = "https://exchange-api.lcx.com/api/fees";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_open_orders(offset, pair)
    url = "https://exchange-api.lcx.com/api/open";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_order_details(orderId)
    url = "https://exchange-api.lcx.com/api/order";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType)
    url = "https://exchange-api.lcx.com/api/orderHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_user_trade_history(offset, pair, fromDate, toDate)
    url = "https://exchange-api.lcx.com/api/uHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# POST method not supported for matlab
# PUT method not supported for matlab
# DELETE method not supported for matlab
# DELETE method not supported for matlab
function output = check_balance_workflow()
    url = "https://exchange-api.lcx.com/api/balances";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for matlab
function output = place_order_workflow(BTC/USDC)
    url = "https://exchange-api.lcx.com/api/ticker";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for matlab
function output = get_order_info(order_response)
    url = "https://exchange-api.lcx.com/api/order";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# None method not supported for matlab
function output = manage_open_orders_workflow(0)
    url = "https://exchange-api.lcx.com/api/orderHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# Workflow: ManageOpenOrdersWorkflow (sequence)

function output = get_trade_history(0)
    url = "https://exchange-api.lcx.com/api/uHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# None method not supported for matlab
# PUT method not supported for matlab
# DELETE method not supported for matlab
# None method not supported for matlab
function output = account_monitoring_workflow()
    url = "https://exchange-api.lcx.com/api/balances";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# Workflow: AccountMonitoringWorkflow (sequence)

function output = get_open_orders(0)
    url = "https://exchange-api.lcx.com/api/open";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_fees()
    url = "https://exchange-api.lcx.com/api/fees";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# None method not supported for matlab
