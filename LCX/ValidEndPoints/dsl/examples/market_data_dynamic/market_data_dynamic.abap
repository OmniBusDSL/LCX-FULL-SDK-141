* SAP ABAP HTTP Client
TYPES: BEGIN OF {func_name}_type,
  status TYPE i,
  response TYPE STRING,
END OF {func_name}_type.


DATA: fetch_all_pairs_data_response TYPE STRING.
DATA: fetch_all_pairs_data_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/ticker'.
DATA: fetch_all_pairs_data_http TYPE REF TO cl_http_client.
DATA: fetch_all_pairs_data_status TYPE i.

CREATE OBJECT fetch_all_pairs_data_http
  EXPORTING
    request_method = 'GET'
    url = fetch_all_pairs_data_url.

fetch_all_pairs_data_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD fetch_all_pairs_data_http->send
  RECEIVING
    code = fetch_all_pairs_data_status.

fetch_all_pairs_data_response = fetch_all_pairs_data_http->response->get_cdata( ).

# Workflow: FetchAllPairsData (sequence)

DATA: get_ethusdc_ticker_response TYPE STRING.
DATA: get_ethusdc_ticker_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/ticker'.
DATA: get_ethusdc_ticker_http TYPE REF TO cl_http_client.
DATA: get_ethusdc_ticker_status TYPE i.

CREATE OBJECT get_ethusdc_ticker_http
  EXPORTING
    request_method = 'GET'
    url = get_ethusdc_ticker_url.

get_ethusdc_ticker_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_ethusdc_ticker_http->send
  RECEIVING
    code = get_ethusdc_ticker_status.

get_ethusdc_ticker_response = get_ethusdc_ticker_http->response->get_cdata( ).

DATA: get_lcxusdc_ticker_response TYPE STRING.
DATA: get_lcxusdc_ticker_url TYPE STRING VALUE 'https://exchange-api.lcx.com/api/ticker'.
DATA: get_lcxusdc_ticker_http TYPE REF TO cl_http_client.
DATA: get_lcxusdc_ticker_status TYPE i.

CREATE OBJECT get_lcxusdc_ticker_http
  EXPORTING
    request_method = 'GET'
    url = get_lcxusdc_ticker_url.

get_lcxusdc_ticker_http->request->set_header_field( name = 'Content-Type' value = 'application/json' ).

CALL METHOD get_lcxusdc_ticker_http->send
  RECEIVING
    code = get_lcxusdc_ticker_status.

get_lcxusdc_ticker_response = get_lcxusdc_ticker_http->response->get_cdata( ).

