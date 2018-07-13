defmodule CurrencyConversion do
  @moduledoc """
  Documentation for CurrencyConversion.
  """

  @doc """
  Converts BTC to USD using the Coinbase Get Historic Rates endpoint

  ## Examples

      iex> CurrencyConversion.btc_to_usd(100)
      621090.5

  """
  def btc_to_usd(amount, precision \\ 2) do
    HTTPoison.start
    case HTTPoison.get "https://api.pro.coinbase.com/products/BTC-USD/candles" do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        [last_rate | _] = Jason.decode!(body)
        high = Enum.at(last_rate, 1) ## lowest price during the bucket interval
        low = Enum.at(last_rate, 2) ## highest price during the bucket interval
        rate = (high + low) / 2
        Float.ceil rate * amount, precision
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end
