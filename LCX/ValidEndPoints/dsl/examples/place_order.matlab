% MATLAB HTTP client

# POST method not supported for matlab
function output = check_order_status(order_id)
    url = "https://exchange-api.lcx.com/api/trading/order/{order_id}";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# POST method not supported for matlab
function output = complete_order_flow(currency)
    url = "https://exchange-api.lcx.com/api/account/balance";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end


# POST method not supported for matlab
# None method not supported for matlab
# None method not supported for matlab
# None method not supported for matlab
# None method not supported for matlab
# None method not supported for matlab
# None method not supported for matlab
# None method not supported for matlab
# None method not supported for matlab
# None method not supported for matlab
# None method not supported for matlab
