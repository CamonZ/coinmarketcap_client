defmodule CoinmarketcapClient do
  @moduledoc """
  Documentation for CoinmarketcapClient.
  """

  @doc """
  Hello world.

  ## Examples

      iex> CoinmarketcapClient.hello
      :world

  """
  def hello do
    :world
  end

  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.coinmarketcap.com/"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.FollowRedirects

  adapter Tesla.Adapter.Hackney

  def global() do
    get("/v1/global").body
  end

  def ticker() do
    get("/v1/ticker").body
  end

  def ticker_sorted() do
    Enum.sort(Enum.take(get("/v1/ticker").body, 10), &(Float.parse(Map.get(&1, "percent_change_24h")) >= Float.parse(Map.get(&2, "percent_change_24h"))))
  end
end
