% MATLAB HTTP client

function output = fetch_all_pairs_data(pair)
    url = "https://exchange-api.lcx.com/api/ticker";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
# Workflow: FetchAllPairsData (sequence)

function output = get_ethusdc_ticker(pair)
    url = "https://exchange-api.lcx.com/api/ticker";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
function output = get_lcxusdc_ticker(pair)
    url = "https://exchange-api.lcx.com/api/ticker";
    options = weboptions('ContentType', 'application/json');
    response = webread(url, options);
    output = response;
end
