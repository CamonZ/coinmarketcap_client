defmodule CoinmarketcapClient do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.coinmarketcap.com/"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.FollowRedirects

  adapter Tesla.Adapter.Hackney

  def global() do
    get("/v1/global").body
  end

  def coins_summary(start, limit) do
    get("/v1/ticker", query: [start: start, limit: limit]).body
  end

  def all_coins(), do: coins_summary(0, 0)
end
