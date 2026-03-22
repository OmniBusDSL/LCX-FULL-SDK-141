* SAP ABAP HTTP Client
TYPES: BEGIN OF {func_name}_type,
  status TYPE i,
  response TYPE STRING,
END OF {func_name}_type.


DATA: place_limit_buy_order_response TYPE STRING.
DATA: place_limit_buy_order_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/create'.
DATA: place_limit_buy_order_http TYPE REF TO cl_http_client.
DATA: place_limit_buy_order_body TYPE STRING VALUE '{'Pair': Pair, 'Amount': Amount, 'Price': Price, 'OrderType': OrderType, 'Side': Side}'.
DATA: place_limit_buy_order_status TYPE i.

CREATE OBJECT place_limit_buy_order_http
  EXPORTING
    request_method = 'POST'
    url = place_limit_buy_order_url.

place_limit_buy_order_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).
place_limit_buy_order_http->request->set_cdata( data = place_limit_buy_order_body ).

CALL METHOD place_limit_buy_order_http->send
  RECEIVING
    code = place_limit_buy_order_status.

place_limit_buy_order_response = place_limit_buy_order_http->response->get_cdata( ).

DATA: place_limit_sell_order_response TYPE STRING.
DATA: place_limit_sell_order_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/create'.
DATA: place_limit_sell_order_http TYPE REF TO cl_http_client.
DATA: place_limit_sell_order_body TYPE STRING VALUE '{'Pair': Pair, 'Amount': Amount, 'Price': Price, 'OrderType': OrderType, 'Side': Side}'.
DATA: place_limit_sell_order_status TYPE i.

CREATE OBJECT place_limit_sell_order_http
  EXPORTING
    request_method = 'POST'
    url = place_limit_sell_order_url.

place_limit_sell_order_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).
place_limit_sell_order_http->request->set_cdata( data = place_limit_sell_order_body ).

CALL METHOD place_limit_sell_order_http->send
  RECEIVING
    code = place_limit_sell_order_status.

place_limit_sell_order_response = place_limit_sell_order_http->response->get_cdata( ).

DATA: place_market_order_response TYPE STRING.
DATA: place_market_order_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/create'.
DATA: place_market_order_http TYPE REF TO cl_http_client.
DATA: place_market_order_body TYPE STRING VALUE '{'Pair': Pair, 'Amount': Amount, 'OrderType': OrderType, 'Side': Side}'.
DATA: place_market_order_status TYPE i.

CREATE OBJECT place_market_order_http
  EXPORTING
    request_method = 'POST'
    url = place_market_order_url.

place_market_order_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).
place_market_order_http->request->set_cdata( data = place_market_order_body ).

CALL METHOD place_market_order_http->send
  RECEIVING
    code = place_market_order_status.

place_market_order_response = place_market_order_http->response->get_cdata( ).

# PUT method not supported for abap
# PUT method not supported for abap
# PUT method not supported for abap
# DELETE method not supported for abap
# DELETE method not supported for abap
DATA: get_all_open_orders_response TYPE STRING.
DATA: get_all_open_orders_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/open'.
DATA: get_all_open_orders_http TYPE REF TO cl_http_client.
DATA: get_all_open_orders_status TYPE i.

CREATE OBJECT get_all_open_orders_http
  EXPORTING
    request_method = 'GET'
    url = get_all_open_orders_url.

get_all_open_orders_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_all_open_orders_http->send
  RECEIVING
    code = get_all_open_orders_status.

get_all_open_orders_response = get_all_open_orders_http->response->get_cdata( ).

DATA: get_open_orders_for_pair_response TYPE STRING.
DATA: get_open_orders_for_pair_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/open'.
DATA: get_open_orders_for_pair_http TYPE REF TO cl_http_client.
DATA: get_open_orders_for_pair_status TYPE i.

CREATE OBJECT get_open_orders_for_pair_http
  EXPORTING
    request_method = 'GET'
    url = get_open_orders_for_pair_url.

get_open_orders_for_pair_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_open_orders_for_pair_http->send
  RECEIVING
    code = get_open_orders_for_pair_status.

get_open_orders_for_pair_response = get_open_orders_for_pair_http->response->get_cdata( ).

DATA: get_open_orders_with_date_range_response TYPE STRING.
DATA: get_open_orders_with_date_range_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/open'.
DATA: get_open_orders_with_date_range_http TYPE REF TO cl_http_client.
DATA: get_open_orders_with_date_range_status TYPE i.

CREATE OBJECT get_open_orders_with_date_range_http
  EXPORTING
    request_method = 'GET'
    url = get_open_orders_with_date_range_url.

get_open_orders_with_date_range_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_open_orders_with_date_range_http->send
  RECEIVING
    code = get_open_orders_with_date_range_status.

get_open_orders_with_date_range_response = get_open_orders_with_date_range_http->response->get_cdata( ).

DATA: get_single_order_status_response TYPE STRING.
DATA: get_single_order_status_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/order'.
DATA: get_single_order_status_http TYPE REF TO cl_http_client.
DATA: get_single_order_status_status TYPE i.

CREATE OBJECT get_single_order_status_http
  EXPORTING
    request_method = 'GET'
    url = get_single_order_status_url.

get_single_order_status_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_single_order_status_http->send
  RECEIVING
    code = get_single_order_status_status.

get_single_order_status_response = get_single_order_status_http->response->get_cdata( ).

DATA: get_complete_order_history_response TYPE STRING.
DATA: get_complete_order_history_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/orderHistory'.
DATA: get_complete_order_history_http TYPE REF TO cl_http_client.
DATA: get_complete_order_history_status TYPE i.

CREATE OBJECT get_complete_order_history_http
  EXPORTING
    request_method = 'GET'
    url = get_complete_order_history_url.

get_complete_order_history_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_complete_order_history_http->send
  RECEIVING
    code = get_complete_order_history_status.

get_complete_order_history_response = get_complete_order_history_http->response->get_cdata( ).

DATA: get_order_history_for_pair_response TYPE STRING.
DATA: get_order_history_for_pair_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/orderHistory'.
DATA: get_order_history_for_pair_http TYPE REF TO cl_http_client.
DATA: get_order_history_for_pair_status TYPE i.

CREATE OBJECT get_order_history_for_pair_http
  EXPORTING
    request_method = 'GET'
    url = get_order_history_for_pair_url.

get_order_history_for_pair_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_order_history_for_pair_http->send
  RECEIVING
    code = get_order_history_for_pair_status.

get_order_history_for_pair_response = get_order_history_for_pair_http->response->get_cdata( ).

DATA: get_order_history_by_status_response TYPE STRING.
DATA: get_order_history_by_status_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/orderHistory'.
DATA: get_order_history_by_status_http TYPE REF TO cl_http_client.
DATA: get_order_history_by_status_status TYPE i.

CREATE OBJECT get_order_history_by_status_http
  EXPORTING
    request_method = 'GET'
    url = get_order_history_by_status_url.

get_order_history_by_status_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_order_history_by_status_http->send
  RECEIVING
    code = get_order_history_by_status_status.

get_order_history_by_status_response = get_order_history_by_status_http->response->get_cdata( ).

DATA: get_order_history_by_type_response TYPE STRING.
DATA: get_order_history_by_type_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/orderHistory'.
DATA: get_order_history_by_type_http TYPE REF TO cl_http_client.
DATA: get_order_history_by_type_status TYPE i.

CREATE OBJECT get_order_history_by_type_http
  EXPORTING
    request_method = 'GET'
    url = get_order_history_by_type_url.

get_order_history_by_type_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_order_history_by_type_http->send
  RECEIVING
    code = get_order_history_by_type_status.

get_order_history_by_type_response = get_order_history_by_type_http->response->get_cdata( ).

DATA: get_filtered_order_history_response TYPE STRING.
DATA: get_filtered_order_history_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/orderHistory'.
DATA: get_filtered_order_history_http TYPE REF TO cl_http_client.
DATA: get_filtered_order_history_status TYPE i.

CREATE OBJECT get_filtered_order_history_http
  EXPORTING
    request_method = 'GET'
    url = get_filtered_order_history_url.

get_filtered_order_history_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_filtered_order_history_http->send
  RECEIVING
    code = get_filtered_order_history_status.

get_filtered_order_history_response = get_filtered_order_history_http->response->get_cdata( ).

DATA: get_all_trade_history_response TYPE STRING.
DATA: get_all_trade_history_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/uHistory'.
DATA: get_all_trade_history_http TYPE REF TO cl_http_client.
DATA: get_all_trade_history_status TYPE i.

CREATE OBJECT get_all_trade_history_http
  EXPORTING
    request_method = 'GET'
    url = get_all_trade_history_url.

get_all_trade_history_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_all_trade_history_http->send
  RECEIVING
    code = get_all_trade_history_status.

get_all_trade_history_response = get_all_trade_history_http->response->get_cdata( ).

DATA: get_trade_history_for_pair_response TYPE STRING.
DATA: get_trade_history_for_pair_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/uHistory'.
DATA: get_trade_history_for_pair_http TYPE REF TO cl_http_client.
DATA: get_trade_history_for_pair_status TYPE i.

CREATE OBJECT get_trade_history_for_pair_http
  EXPORTING
    request_method = 'GET'
    url = get_trade_history_for_pair_url.

get_trade_history_for_pair_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_trade_history_for_pair_http->send
  RECEIVING
    code = get_trade_history_for_pair_status.

get_trade_history_for_pair_response = get_trade_history_for_pair_http->response->get_cdata( ).

DATA: get_trade_history_by_date_range_response TYPE STRING.
DATA: get_trade_history_by_date_range_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/uHistory'.
DATA: get_trade_history_by_date_range_http TYPE REF TO cl_http_client.
DATA: get_trade_history_by_date_range_status TYPE i.

CREATE OBJECT get_trade_history_by_date_range_http
  EXPORTING
    request_method = 'GET'
    url = get_trade_history_by_date_range_url.

get_trade_history_by_date_range_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_trade_history_by_date_range_http->send
  RECEIVING
    code = get_trade_history_by_date_range_status.

get_trade_history_by_date_range_response = get_trade_history_by_date_range_http->response->get_cdata( ).

DATA: simple_buy_workflow_response TYPE STRING.
DATA: simple_buy_workflow_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/order'.
DATA: simple_buy_workflow_http TYPE REF TO cl_http_client.
DATA: simple_buy_workflow_status TYPE i.

CREATE OBJECT simple_buy_workflow_http
  EXPORTING
    request_method = 'GET'
    url = simple_buy_workflow_url.

simple_buy_workflow_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD simple_buy_workflow_http->send
  RECEIVING
    code = simple_buy_workflow_status.

simple_buy_workflow_response = simple_buy_workflow_http->response->get_cdata( ).

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for abap
# PUT method not supported for abap
DATA: get_history_response TYPE STRING.
DATA: get_history_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/orderHistory'.
DATA: get_history_http TYPE REF TO cl_http_client.
DATA: get_history_status TYPE i.

CREATE OBJECT get_history_http
  EXPORTING
    request_method = 'GET'
    url = get_history_url.

get_history_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_history_http->send
  RECEIVING
    code = get_history_status.

get_history_response = get_history_http->response->get_cdata( ).

DATA: get_trades_response TYPE STRING.
DATA: get_trades_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/uHistory'.
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
# DELETE method not supported for abap
DATA: confirm_cancelled_response TYPE STRING.
DATA: confirm_cancelled_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/order'.
DATA: confirm_cancelled_http TYPE REF TO cl_http_client.
DATA: confirm_cancelled_status TYPE i.

CREATE OBJECT confirm_cancelled_http
  EXPORTING
    request_method = 'GET'
    url = confirm_cancelled_url.

confirm_cancelled_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD confirm_cancelled_http->send
  RECEIVING
    code = confirm_cancelled_status.

confirm_cancelled_response = confirm_cancelled_http->response->get_cdata( ).

# None method not supported for abap
