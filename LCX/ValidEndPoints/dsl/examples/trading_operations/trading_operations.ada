with Ada.Text_IO;
with Ada.HTTP.Client;
with Ada.HTTP.Response;


# POST method not supported for ada
# POST method not supported for ada
# POST method not supported for ada
# PUT method not supported for ada
# PUT method not supported for ada
# PUT method not supported for ada
# DELETE method not supported for ada
# DELETE method not supported for ada
procedure get_all_open_orders_offset is
   -- GET /api/open
   URL : constant String := "https://exchange-api.lcx.com/api/open";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_all_open_orders_offset;

procedure get_open_orders_for_pair_offset, pair is
   -- GET /api/open
   URL : constant String := "https://exchange-api.lcx.com/api/open";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_open_orders_for_pair_offset, pair;

procedure get_open_orders_with_date_range_offset, pair, fromDate, toDate is
   -- GET /api/open
   URL : constant String := "https://exchange-api.lcx.com/api/open";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_open_orders_with_date_range_offset, pair, fromDate, toDate;

procedure get_single_order_status_orderId is
   -- GET /api/order
   URL : constant String := "https://exchange-api.lcx.com/api/order";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_single_order_status_orderId;

procedure get_complete_order_history_offset is
   -- GET /api/orderHistory
   URL : constant String := "https://exchange-api.lcx.com/api/orderHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_complete_order_history_offset;

procedure get_order_history_for_pair_offset, pair is
   -- GET /api/orderHistory
   URL : constant String := "https://exchange-api.lcx.com/api/orderHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_order_history_for_pair_offset, pair;

procedure get_order_history_by_status_offset, orderStatus is
   -- GET /api/orderHistory
   URL : constant String := "https://exchange-api.lcx.com/api/orderHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_order_history_by_status_offset, orderStatus;

procedure get_order_history_by_type_offset, orderType is
   -- GET /api/orderHistory
   URL : constant String := "https://exchange-api.lcx.com/api/orderHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_order_history_by_type_offset, orderType;

procedure get_filtered_order_history_offset, pair, fromDate, toDate, side, orderStatus, orderType is
   -- GET /api/orderHistory
   URL : constant String := "https://exchange-api.lcx.com/api/orderHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_filtered_order_history_offset, pair, fromDate, toDate, side, orderStatus, orderType;

procedure get_all_trade_history_offset is
   -- GET /api/uHistory
   URL : constant String := "https://exchange-api.lcx.com/api/uHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_all_trade_history_offset;

procedure get_trade_history_for_pair_offset, pair is
   -- GET /api/uHistory
   URL : constant String := "https://exchange-api.lcx.com/api/uHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_trade_history_for_pair_offset, pair;

procedure get_trade_history_by_date_range_offset, pair, fromDate, toDate is
   -- GET /api/uHistory
   URL : constant String := "https://exchange-api.lcx.com/api/uHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_trade_history_by_date_range_offset, pair, fromDate, toDate;

procedure simple_buy_workflow_order_result is
   -- GET /api/order
   URL : constant String := "https://exchange-api.lcx.com/api/order";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end simple_buy_workflow_order_result;

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for ada
# PUT method not supported for ada
procedure get_history_0, BTC/USDC is
   -- GET /api/orderHistory
   URL : constant String := "https://exchange-api.lcx.com/api/orderHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_history_0, BTC/USDC;

procedure get_trades_0, BTC/USDC is
   -- GET /api/uHistory
   URL : constant String := "https://exchange-api.lcx.com/api/uHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_trades_0, BTC/USDC;

# None method not supported for ada
# DELETE method not supported for ada
procedure confirm_cancelled_first_order_from_list is
   -- GET /api/order
   URL : constant String := "https://exchange-api.lcx.com/api/order";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end confirm_cancelled_first_order_from_list;

# None method not supported for ada
