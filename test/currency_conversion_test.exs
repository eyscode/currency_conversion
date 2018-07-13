defmodule CurrencyConversionTest do
  use ExUnit.Case
  doctest CurrencyConversion

  test "checks if btc_to_usd returns float" do
    assert CurrencyConversion.btc_to_usd(100) |> is_float == true
  end

  test "checks if usd_to_btc returns float" do
    assert CurrencyConversion.btc_to_usd(100) |> is_float == true
  end

  test "checks if btc_to_usd returns inverse of usd_to_btc" do
    btc = 10.0
    usd = CurrencyConversion.btc_to_usd(btc)
    assert btc == CurrencyConversion.usd_to_btc(usd)
  end
end
