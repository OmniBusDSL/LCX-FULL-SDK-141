Mix.install([{:httpoison, "~> 1.8"}])
{:ok, response} = HTTPoison.get("https://exchange-api.lcx.com/api/open")
IO.puts(response.body)
