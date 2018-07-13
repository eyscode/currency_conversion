defmodule CurrencyConversionTest do
  use ExUnit.Case
  doctest CurrencyConversion

  test "checks if btc_to_usd returns float" do
    assert CurrencyConversion.btc_to_usd(100) |> is_float == true
  end
end
