Mix.install([{:httpoison, "~> 1.8"}])
{:ok, response} = HTTPoison.get("https://exchange-api.lcx.com/api/balance")
IO.puts(response.body)
