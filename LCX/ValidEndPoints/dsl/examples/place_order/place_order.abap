* SAP ABAP HTTP Client
TYPES: BEGIN OF {func_name}_type,
  status TYPE i,
  response TYPE STRING,
END OF {func_name}_type.


DATA: place_order_response TYPE STRING.
DATA: place_order_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/trading/order/create'.
DATA: place_order_http TYPE REF TO cl_http_client.
DATA: place_order_body TYPE STRING VALUE '{'symbol': symbol, 'quantity': quantity, 'price': price}'.
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

DATA: check_order_status_response TYPE STRING.
DATA: check_order_status_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/trading/order/{order_id}'.
DATA: check_order_status_http TYPE REF TO cl_http_client.
DATA: check_order_status_status TYPE i.

CREATE OBJECT check_order_status_http
  EXPORTING
    request_method = 'GET'
    url = check_order_status_url.

check_order_status_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD check_order_status_http->send
  RECEIVING
    code = check_order_status_status.

check_order_status_response = check_order_status_http->response->get_cdata( ).

DATA: cancel_order_response TYPE STRING.
DATA: cancel_order_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/trading/order/cancel'.
DATA: cancel_order_http TYPE REF TO cl_http_client.
DATA: cancel_order_body TYPE STRING VALUE '{'order_id': order_id}'.
DATA: cancel_order_status TYPE i.

CREATE OBJECT cancel_order_http
  EXPORTING
    request_method = 'POST'
    url = cancel_order_url.

cancel_order_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).
cancel_order_http->request->set_cdata( data = cancel_order_body ).

CALL METHOD cancel_order_http->send
  RECEIVING
    code = cancel_order_status.

cancel_order_response = cancel_order_http->response->get_cdata( ).

DATA: complete_order_flow_response TYPE STRING.
DATA: complete_order_flow_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/account/balance'.
DATA: complete_order_flow_http TYPE REF TO cl_http_client.
DATA: complete_order_flow_status TYPE i.

CREATE OBJECT complete_order_flow_http
  EXPORTING
    request_method = 'GET'
    url = complete_order_flow_url.

complete_order_flow_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD complete_order_flow_http->send
  RECEIVING
    code = complete_order_flow_status.

complete_order_flow_response = complete_order_flow_http->response->get_cdata( ).



DATA: ifbalanceavailablepricequantity_response TYPE STRING.
DATA: ifbalanceavailablepricequantity_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/trading/order/create'.
DATA: ifbalanceavailablepricequantity_http TYPE REF TO cl_http_client.
DATA: ifbalanceavailablepricequantity_body TYPE STRING VALUE '{'symbol': symbol, 'quantity': quantity, 'price': price, 'order_type': order_type}'.
DATA: ifbalanceavailablepricequantity_status TYPE i.

CREATE OBJECT ifbalanceavailablepricequantity_http
  EXPORTING
    request_method = 'POST'
    url = ifbalanceavailablepricequantity_url.

ifbalanceavailablepricequantity_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).
ifbalanceavailablepricequantity_http->request->set_cdata( data = ifbalanceavailablepricequantity_body ).

CALL METHOD ifbalanceavailablepricequantity_http->send
  RECEIVING
    code = ifbalanceavailablepricequantity_status.

ifbalanceavailablepricequantity_response = ifbalanceavailablepricequantity_http->response->get_cdata( ).

# None method not supported for abap
# None method not supported for abap
# None method not supported for abap
# None method not supported for abap
# None method not supported for abap
# None method not supported for abap
# None method not supported for abap
# None method not supported for abap
# None method not supported for abap
# None method not supported for abap
