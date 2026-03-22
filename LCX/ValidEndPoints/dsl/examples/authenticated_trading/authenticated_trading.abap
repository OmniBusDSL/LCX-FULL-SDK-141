* SAP ABAP HTTP Client
TYPES: BEGIN OF {func_name}_type,
  status TYPE i,
  response TYPE STRING,
END OF {func_name}_type.


DATA: get_account_info_response TYPE STRING.
DATA: get_account_info_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/account'.
DATA: get_account_info_http TYPE REF TO cl_http_client.
DATA: get_account_info_status TYPE i.

CREATE OBJECT get_account_info_http
  EXPORTING
    request_method = 'GET'
    url = get_account_info_url.

get_account_info_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_account_info_http->send
  RECEIVING
    code = get_account_info_status.

get_account_info_response = get_account_info_http->response->get_cdata( ).

DATA: get_balances_response TYPE STRING.
DATA: get_balances_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/balances'.
DATA: get_balances_http TYPE REF TO cl_http_client.
DATA: get_balances_status TYPE i.

CREATE OBJECT get_balances_http
  EXPORTING
    request_method = 'GET'
    url = get_balances_url.

get_balances_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_balances_http->send
  RECEIVING
    code = get_balances_status.

get_balances_response = get_balances_http->response->get_cdata( ).

DATA: get_asset_balance_response TYPE STRING.
DATA: get_asset_balance_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/balance'.
DATA: get_asset_balance_http TYPE REF TO cl_http_client.
DATA: get_asset_balance_status TYPE i.

CREATE OBJECT get_asset_balance_http
  EXPORTING
    request_method = 'GET'
    url = get_asset_balance_url.

get_asset_balance_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_asset_balance_http->send
  RECEIVING
    code = get_asset_balance_status.

get_asset_balance_response = get_asset_balance_http->response->get_cdata( ).

DATA: get_trading_fees_response TYPE STRING.
DATA: get_trading_fees_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/fees'.
DATA: get_trading_fees_http TYPE REF TO cl_http_client.
DATA: get_trading_fees_status TYPE i.

CREATE OBJECT get_trading_fees_http
  EXPORTING
    request_method = 'GET'
    url = get_trading_fees_url.

get_trading_fees_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_trading_fees_http->send
  RECEIVING
    code = get_trading_fees_status.

get_trading_fees_response = get_trading_fees_http->response->get_cdata( ).

DATA: get_open_orders_response TYPE STRING.
DATA: get_open_orders_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/open'.
DATA: get_open_orders_http TYPE REF TO cl_http_client.
DATA: get_open_orders_status TYPE i.

CREATE OBJECT get_open_orders_http
  EXPORTING
    request_method = 'GET'
    url = get_open_orders_url.

get_open_orders_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_open_orders_http->send
  RECEIVING
    code = get_open_orders_status.

get_open_orders_response = get_open_orders_http->response->get_cdata( ).

DATA: get_order_details_response TYPE STRING.
DATA: get_order_details_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/order'.
DATA: get_order_details_http TYPE REF TO cl_http_client.
DATA: get_order_details_status TYPE i.

CREATE OBJECT get_order_details_http
  EXPORTING
    request_method = 'GET'
    url = get_order_details_url.

get_order_details_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_order_details_http->send
  RECEIVING
    code = get_order_details_status.

get_order_details_response = get_order_details_http->response->get_cdata( ).

DATA: get_order_history_response TYPE STRING.
DATA: get_order_history_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/orderHistory'.
DATA: get_order_history_http TYPE REF TO cl_http_client.
DATA: get_order_history_status TYPE i.

CREATE OBJECT get_order_history_http
  EXPORTING
    request_method = 'GET'
    url = get_order_history_url.

get_order_history_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_order_history_http->send
  RECEIVING
    code = get_order_history_status.

get_order_history_response = get_order_history_http->response->get_cdata( ).

DATA: get_user_trade_history_response TYPE STRING.
DATA: get_user_trade_history_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/uHistory'.
DATA: get_user_trade_history_http TYPE REF TO cl_http_client.
DATA: get_user_trade_history_status TYPE i.

CREATE OBJECT get_user_trade_history_http
  EXPORTING
    request_method = 'GET'
    url = get_user_trade_history_url.

get_user_trade_history_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_user_trade_history_http->send
  RECEIVING
    code = get_user_trade_history_status.

get_user_trade_history_response = get_user_trade_history_http->response->get_cdata( ).

DATA: place_order_response TYPE STRING.
DATA: place_order_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/create'.
DATA: place_order_http TYPE REF TO cl_http_client.
DATA: place_order_body TYPE STRING VALUE '{'Pair': Pair, 'Amount': Amount, 'Price': Price, 'OrderType': OrderType, 'Side': Side, 'ClientOrderId': ClientOrderId}'.
DATA: place_order_status TYPE i.

CREATE OBJECT place_order_http
  EXPORTING
    request_method = 'POST'
    url = place_order_url.

place_order_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).
place_order_http->request->set_cdata( data = place_order_body ).

CALL METHOD place_order_http->send
  RECEIVING
    code = place_order_status.

place_order_response = place_order_http->response->get_cdata( ).

# PUT method not supported for abap
# DELETE method not supported for abap
# DELETE method not supported for abap
DATA: check_balance_workflow_response TYPE STRING.
DATA: check_balance_workflow_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/balances'.
DATA: check_balance_workflow_http TYPE REF TO cl_http_client.
DATA: check_balance_workflow_status TYPE i.

CREATE OBJECT check_balance_workflow_http
  EXPORTING
    request_method = 'GET'
    url = check_balance_workflow_url.

check_balance_workflow_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD check_balance_workflow_http->send
  RECEIVING
    code = check_balance_workflow_status.

check_balance_workflow_response = check_balance_workflow_http->response->get_cdata( ).

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for abap
DATA: place_order_workflow_response TYPE STRING.
DATA: place_order_workflow_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/ticker'.
DATA: place_order_workflow_http TYPE REF TO cl_http_client.
DATA: place_order_workflow_status TYPE i.

CREATE OBJECT place_order_workflow_http
  EXPORTING
    request_method = 'GET'
    url = place_order_workflow_url.

place_order_workflow_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD place_order_workflow_http->send
  RECEIVING
    code = place_order_workflow_status.

place_order_workflow_response = place_order_workflow_http->response->get_cdata( ).

# Workflow: PlaceOrderWorkflow (sequence)

DATA: place_limit_order_response TYPE STRING.
DATA: place_limit_order_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/create'.
DATA: place_limit_order_http TYPE REF TO cl_http_client.
DATA: place_limit_order_body TYPE STRING VALUE '{'BTC/USDC': BTC/USDC, '0.01': 0.01, '40000': 40000, 'LIMIT': LIMIT, 'BUY': BUY}'.
DATA: place_limit_order_status TYPE i.

CREATE OBJECT place_limit_order_http
  EXPORTING
    request_method = 'POST'
    url = place_limit_order_url.

place_limit_order_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).
place_limit_order_http->request->set_cdata( data = place_limit_order_body ).

CALL METHOD place_limit_order_http->send
  RECEIVING
    code = place_limit_order_status.

place_limit_order_response = place_limit_order_http->response->get_cdata( ).

DATA: get_order_info_response TYPE STRING.
DATA: get_order_info_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/order'.
DATA: get_order_info_http TYPE REF TO cl_http_client.
DATA: get_order_info_status TYPE i.

CREATE OBJECT get_order_info_http
  EXPORTING
    request_method = 'GET'
    url = get_order_info_url.

get_order_info_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_order_info_http->send
  RECEIVING
    code = get_order_info_status.

get_order_info_response = get_order_info_http->response->get_cdata( ).

# None method not supported for abap
DATA: manage_open_orders_workflow_response TYPE STRING.
DATA: manage_open_orders_workflow_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/orderHistory'.
DATA: manage_open_orders_workflow_http TYPE REF TO cl_http_client.
DATA: manage_open_orders_workflow_status TYPE i.

CREATE OBJECT manage_open_orders_workflow_http
  EXPORTING
    request_method = 'GET'
    url = manage_open_orders_workflow_url.

manage_open_orders_workflow_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD manage_open_orders_workflow_http->send
  RECEIVING
    code = manage_open_orders_workflow_status.

manage_open_orders_workflow_response = manage_open_orders_workflow_http->response->get_cdata( ).

# Workflow: ManageOpenOrdersWorkflow (sequence)

DATA: get_trade_history_response TYPE STRING.
DATA: get_trade_history_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/uHistory'.
DATA: get_trade_history_http TYPE REF TO cl_http_client.
DATA: get_trade_history_status TYPE i.

CREATE OBJECT get_trade_history_http
  EXPORTING
    request_method = 'GET'
    url = get_trade_history_url.

get_trade_history_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_trade_history_http->send
  RECEIVING
    code = get_trade_history_status.

get_trade_history_response = get_trade_history_http->response->get_cdata( ).

# None method not supported for abap
# PUT method not supported for abap
# DELETE method not supported for abap
# None method not supported for abap
DATA: account_monitoring_workflow_response TYPE STRING.
DATA: account_monitoring_workflow_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/balances'.
DATA: account_monitoring_workflow_http TYPE REF TO cl_http_client.
DATA: account_monitoring_workflow_status TYPE i.

CREATE OBJECT account_monitoring_workflow_http
  EXPORTING
    request_method = 'GET'
    url = account_monitoring_workflow_url.

account_monitoring_workflow_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD account_monitoring_workflow_http->send
  RECEIVING
    code = account_monitoring_workflow_status.

account_monitoring_workflow_response = account_monitoring_workflow_http->response->get_cdata( ).

# Workflow: AccountMonitoringWorkflow (sequence)

DATA: get_open_orders_response TYPE STRING.
DATA: get_open_orders_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/open'.
DATA: get_open_orders_http TYPE REF TO cl_http_client.
DATA: get_open_orders_status TYPE i.

CREATE OBJECT get_open_orders_http
  EXPORTING
    request_method = 'GET'
    url = get_open_orders_url.

get_open_orders_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_open_orders_http->send
  RECEIVING
    code = get_open_orders_status.

get_open_orders_response = get_open_orders_http->response->get_cdata( ).

DATA: get_fees_response TYPE STRING.
DATA: get_fees_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/fees'.
DATA: get_fees_http TYPE REF TO cl_http_client.
DATA: get_fees_status TYPE i.

CREATE OBJECT get_fees_http
  EXPORTING
    request_method = 'GET'
    url = get_fees_url.

get_fees_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_fees_http->send
  RECEIVING
    code = get_fees_status.

get_fees_response = get_fees_http->response->get_cdata( ).

# None method not supported for abap
