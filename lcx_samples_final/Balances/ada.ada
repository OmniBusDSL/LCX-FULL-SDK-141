with Ada.Text_IO;
with Ada.HTTP.Client;

procedure LCX_Example is
   Response : Ada.HTTP.Client.Response_Type;
begin
   Response := Ada.HTTP.Client.Get("https://exchange-api.lcx.com/api/balances");
   Ada.Text_IO.Put_Line(Ada.HTTP.Client.Message_Body(Response));
end LCX_Example;
