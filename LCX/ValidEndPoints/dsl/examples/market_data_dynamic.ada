with Ada.Text_IO;
with Ada.HTTP.Client;
with Ada.HTTP.Response;


procedure fetch_all_pairs_data_pair is
   -- GET /api/ticker
   URL : constant String := "https://exchange-api.lcx.com/api/ticker";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end fetch_all_pairs_data_pair;

# Workflow: FetchAllPairsData (sequence)

procedure get_ethusdc_ticker_pair is
   -- GET /api/ticker
   URL : constant String := "https://exchange-api.lcx.com/api/ticker";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_ethusdc_ticker_pair;

procedure get_lcxusdc_ticker_pair is
   -- GET /api/ticker
   URL : constant String := "https://exchange-api.lcx.com/api/ticker";
begin

   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Get(URL));
end get_lcxusdc_ticker_pair;

