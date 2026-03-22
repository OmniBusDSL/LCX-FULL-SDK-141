Mix.install([{:httpoison, "~> 1.8"}])
{:ok, response} = HTTPoison.get("https://exchange-api.lcx.com/api/test")
IO.puts(response.body)
