* SAP ABAP HTTP Client
TYPES: BEGIN OF {func_name}_type,
  status TYPE i,
  response TYPE STRING,
END OF {func_name}_type.


DATA: fetch_all_tickers_response TYPE STRING.
DATA: fetch_all_tickers_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/tickers'.
DATA: fetch_all_tickers_http TYPE REF TO cl_http_client.
DATA: fetch_all_tickers_status TYPE i.

CREATE OBJECT fetch_all_tickers_http
  EXPORTING
    request_method = 'GET'
    url = fetch_all_tickers_url.

fetch_all_tickers_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD fetch_all_tickers_http->send
  RECEIVING
    code = fetch_all_tickers_status.

fetch_all_tickers_response = fetch_all_tickers_http->response->get_cdata( ).

DATA: get_ticker_for_pair_response TYPE STRING.
DATA: get_ticker_for_pair_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/ticker'.
DATA: get_ticker_for_pair_http TYPE REF TO cl_http_client.
DATA: get_ticker_for_pair_status TYPE i.

CREATE OBJECT get_ticker_for_pair_http
  EXPORTING
    request_method = 'GET'
    url = get_ticker_for_pair_url.

get_ticker_for_pair_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_ticker_for_pair_http->send
  RECEIVING
    code = get_ticker_for_pair_status.

get_ticker_for_pair_response = get_ticker_for_pair_http->response->get_cdata( ).

DATA: fetch_all_pairs_response TYPE STRING.
DATA: fetch_all_pairs_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/pairs'.
DATA: fetch_all_pairs_http TYPE REF TO cl_http_client.
DATA: fetch_all_pairs_status TYPE i.

CREATE OBJECT fetch_all_pairs_http
  EXPORTING
    request_method = 'GET'
    url = fetch_all_pairs_url.

fetch_all_pairs_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD fetch_all_pairs_http->send
  RECEIVING
    code = fetch_all_pairs_status.

fetch_all_pairs_response = fetch_all_pairs_http->response->get_cdata( ).

DATA: get_pair_info_response TYPE STRING.
DATA: get_pair_info_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/pair/BTC/USDC'.
DATA: get_pair_info_http TYPE REF TO cl_http_client.
DATA: get_pair_info_status TYPE i.

CREATE OBJECT get_pair_info_http
  EXPORTING
    request_method = 'GET'
    url = get_pair_info_url.

get_pair_info_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_pair_info_http->send
  RECEIVING
    code = get_pair_info_status.

get_pair_info_response = get_pair_info_http->response->get_cdata( ).

DATA: get_order_book_response TYPE STRING.
DATA: get_order_book_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/book'.
DATA: get_order_book_http TYPE REF TO cl_http_client.
DATA: get_order_book_status TYPE i.

CREATE OBJECT get_order_book_http
  EXPORTING
    request_method = 'GET'
    url = get_order_book_url.

get_order_book_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_order_book_http->send
  RECEIVING
    code = get_order_book_status.

get_order_book_response = get_order_book_http->response->get_cdata( ).

DATA: get_recent_trades_response TYPE STRING.
DATA: get_recent_trades_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/trades'.
DATA: get_recent_trades_http TYPE REF TO cl_http_client.
DATA: get_recent_trades_status TYPE i.

CREATE OBJECT get_recent_trades_http
  EXPORTING
    request_method = 'GET'
    url = get_recent_trades_url.

get_recent_trades_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_recent_trades_http->send
  RECEIVING
    code = get_recent_trades_status.

get_recent_trades_response = get_recent_trades_http->response->get_cdata( ).

DATA: get_candle_data_response TYPE STRING.
DATA: get_candle_data_url TYPE STRING VALUE 'https://api-kline.lcx.com/v1/market/kline'.
DATA: get_candle_data_http TYPE REF TO cl_http_client.
DATA: get_candle_data_status TYPE i.

CREATE OBJECT get_candle_data_http
  EXPORTING
    request_method = 'GET'
    url = get_candle_data_url.

get_candle_data_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_candle_data_http->send
  RECEIVING
    code = get_candle_data_status.

get_candle_data_response = get_candle_data_http->response->get_cdata( ).

DATA: market_overview_response TYPE STRING.
DATA: market_overview_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/book'.
DATA: market_overview_http TYPE REF TO cl_http_client.
DATA: market_overview_status TYPE i.

CREATE OBJECT market_overview_http
  EXPORTING
    request_method = 'GET'
    url = market_overview_url.

market_overview_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD market_overview_http->send
  RECEIVING
    code = market_overview_status.

market_overview_response = market_overview_http->response->get_cdata( ).

# Workflow: MarketOverview (sequence)

DATA: get_trades_response TYPE STRING.
DATA: get_trades_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/trades'.
DATA: get_trades_http TYPE REF TO cl_http_client.
DATA: get_trades_status TYPE i.

CREATE OBJECT get_trades_http
  EXPORTING
    request_method = 'GET'
    url = get_trades_url.

get_trades_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_trades_http->send
  RECEIVING
    code = get_trades_status.

get_trades_response = get_trades_http->response->get_cdata( ).

# None method not supported for abap
