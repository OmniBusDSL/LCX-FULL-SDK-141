with Ada.Text_IO;
with Ada.HTTP.Client;
with Ada.HTTP.Response;


procedure fetch_all_tickers_ is
   -- GET /api/tickers
   URL : constant String := "https://exchange-api.lcx.com/api/tickers";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end fetch_all_tickers_;

procedure get_ticker_for_pair_pair is
   -- GET /api/ticker
   URL : constant String := "https://exchange-api.lcx.com/api/ticker";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_ticker_for_pair_pair;

procedure fetch_all_pairs_ is
   -- GET /api/pairs
   URL : constant String := "https://exchange-api.lcx.com/api/pairs";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end fetch_all_pairs_;

procedure get_pair_info_pair_symbol is
   -- GET /api/pair/BTC/USDC
   URL : constant String := "https://exchange-api.lcx.com/api/pair/BTC/USDC";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_pair_info_pair_symbol;

procedure get_order_book_pair is
   -- GET /api/book
   URL : constant String := "https://exchange-api.lcx.com/api/book";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_order_book_pair;

procedure get_recent_trades_pair, offset is
   -- GET /api/trades
   URL : constant String := "https://exchange-api.lcx.com/api/trades";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_recent_trades_pair, offset;

procedure get_candle_data_pair, resolution, from_ts, to_ts is
   -- GET /v1/market/kline
   URL : constant String := "https://api-kline.lcx.com/v1/market/kline";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_candle_data_pair, resolution, from_ts, to_ts;

procedure market_overview_ is
   -- GET /api/book
   URL : constant String := "https://exchange-api.lcx.com/api/book";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end market_overview_;

# Workflow: MarketOverview (sequence)

procedure get_trades_ is
   -- GET /api/trades
   URL : constant String := "https://exchange-api.lcx.com/api/trades";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_trades_;

# None method not supported for ada
