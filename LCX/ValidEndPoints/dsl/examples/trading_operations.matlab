% MATLAB HTTP client

# POST method not supported for matlab
# POST method not supported for matlab
# POST method not supported for matlab
# PUT method not supported for matlab
# PUT method not supported for matlab
# PUT method not supported for matlab
# DELETE method not supported for matlab
# DELETE method not supported for matlab
function output = get_all_open_orders(offset)
    url = "https://exchange-api.lcx.com/api/open";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_open_orders_for_pair(offset, pair)
    url = "https://exchange-api.lcx.com/api/open";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_open_orders_with_date_range(offset, pair, fromDate, toDate)
    url = "https://exchange-api.lcx.com/api/open";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_single_order_status(orderId)
    url = "https://exchange-api.lcx.com/api/order";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_complete_order_history(offset)
    url = "https://exchange-api.lcx.com/api/orderHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_order_history_for_pair(offset, pair)
    url = "https://exchange-api.lcx.com/api/orderHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_order_history_by_status(offset, orderStatus)
    url = "https://exchange-api.lcx.com/api/orderHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_order_history_by_type(offset, orderType)
    url = "https://exchange-api.lcx.com/api/orderHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType)
    url = "https://exchange-api.lcx.com/api/orderHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_all_trade_history(offset)
    url = "https://exchange-api.lcx.com/api/uHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_trade_history_for_pair(offset, pair)
    url = "https://exchange-api.lcx.com/api/uHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_trade_history_by_date_range(offset, pair, fromDate, toDate)
    url = "https://exchange-api.lcx.com/api/uHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = simple_buy_workflow(order_result)
    url = "https://exchange-api.lcx.com/api/order";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for matlab
# PUT method not supported for matlab
function output = get_history(0, BTC/USDC)
    url = "https://exchange-api.lcx.com/api/orderHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_trades(0, BTC/USDC)
    url = "https://exchange-api.lcx.com/api/uHistory";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# None method not supported for matlab
# DELETE method not supported for matlab
function output = confirm_cancelled(first_order_from_list)
    url = "https://exchange-api.lcx.com/api/order";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# None method not supported for matlab
