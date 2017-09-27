defmodule CoinmarketcapClientTest do
  use ExUnit.Case
  doctest CoinmarketcapClient

  test "greets the world" do
    assert CoinmarketcapClient.hello() == :world
  end
end
