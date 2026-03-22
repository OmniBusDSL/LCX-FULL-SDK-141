with Ada.Text_IO;
with Ada.HTTP.Client;
with Ada.HTTP.Response;


# POST method not supported for ada
procedure check_order_status_order_id is
   -- GET /api/trading/order/{order_id}
   URL : constant String := "https://exchange-api.lcx.com/api/trading/order/{order_id}";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end check_order_status_order_id;

# POST method not supported for ada
procedure complete_order_flow_currency is
   -- GET /api/account/balance
   URL : constant String := "https://exchange-api.lcx.com/api/account/balance";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end complete_order_flow_currency;



# POST method not supported for ada
# None method not supported for ada
# None method not supported for ada
# None method not supported for ada
# None method not supported for ada
# None method not supported for ada
# None method not supported for ada
# None method not supported for ada
# None method not supported for ada
# None method not supported for ada
# None method not supported for ada
