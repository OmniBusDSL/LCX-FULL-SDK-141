with Ada.Text_IO;
with Ada.HTTP.Client;
with Ada.HTTP.Response;


procedure get_account_info_ is
   -- GET /api/account
   URL : constant String := "https://exchange-api.lcx.com/api/account";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_account_info_;

procedure get_balances_ is
   -- GET /api/balances
   URL : constant String := "https://exchange-api.lcx.com/api/balances";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_balances_;

procedure get_asset_balance_asset is
   -- GET /api/balance
   URL : constant String := "https://exchange-api.lcx.com/api/balance";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_asset_balance_asset;

procedure get_trading_fees_ is
   -- GET /api/fees
   URL : constant String := "https://exchange-api.lcx.com/api/fees";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_trading_fees_;

procedure get_open_orders_offset, pair is
   -- GET /api/open
   URL : constant String := "https://exchange-api.lcx.com/api/open";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_open_orders_offset, pair;

procedure get_order_details_orderId is
   -- GET /api/order
   URL : constant String := "https://exchange-api.lcx.com/api/order";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_order_details_orderId;

procedure get_order_history_offset, pair, fromDate, toDate, side, orderStatus, orderType is
   -- GET /api/orderHistory
   URL : constant String := "https://exchange-api.lcx.com/api/orderHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_order_history_offset, pair, fromDate, toDate, side, orderStatus, orderType;

procedure get_user_trade_history_offset, pair, fromDate, toDate is
   -- GET /api/uHistory
   URL : constant String := "https://exchange-api.lcx.com/api/uHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_user_trade_history_offset, pair, fromDate, toDate;

# POST method not supported for ada
# PUT method not supported for ada
# DELETE method not supported for ada
# DELETE method not supported for ada
procedure check_balance_workflow_ is
   -- GET /api/balances
   URL : constant String := "https://exchange-api.lcx.com/api/balances";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end check_balance_workflow_;

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for ada
procedure place_order_workflow_BTC/USDC is
   -- GET /api/ticker
   URL : constant String := "https://exchange-api.lcx.com/api/ticker";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end place_order_workflow_BTC/USDC;

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for ada
procedure get_order_info_order_response is
   -- GET /api/order
   URL : constant String := "https://exchange-api.lcx.com/api/order";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_order_info_order_response;

# None method not supported for ada
procedure manage_open_orders_workflow_0 is
   -- GET /api/orderHistory
   URL : constant String := "https://exchange-api.lcx.com/api/orderHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end manage_open_orders_workflow_0;

# Workflow: ManageOpenOrdersWorkflow (sequence)

procedure get_trade_history_0 is
   -- GET /api/uHistory
   URL : constant String := "https://exchange-api.lcx.com/api/uHistory";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_trade_history_0;

# None method not supported for ada
# PUT method not supported for ada
# DELETE method not supported for ada
# None method not supported for ada
procedure account_monitoring_workflow_ is
   -- GET /api/balances
   URL : constant String := "https://exchange-api.lcx.com/api/balances";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end account_monitoring_workflow_;

# Workflow: AccountMonitoringWorkflow (sequence)

procedure get_open_orders_0 is
   -- GET /api/open
   URL : constant String := "https://exchange-api.lcx.com/api/open";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_open_orders_0;

procedure get_fees_ is
   -- GET /api/fees
   URL : constant String := "https://exchange-api.lcx.com/api/fees";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_fees_;

# None method not supported for ada
