defmodule CurrencyConversion do
  @moduledoc """
  Documentation for CurrencyConversion.
  """

  defp get_btc_to_usd_rate() do
    HTTPoison.start
    case HTTPoison.get "https://api.pro.coinbase.com/products/BTC-USD/candles" do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        [last_rate | _] = Jason.decode!(body)
        high = Enum.at(last_rate, 1) ## lowest price during the bucket interval
        low = Enum.at(last_rate, 2) ## highest price during the bucket interval
        rate = (high + low) / 2
        Float.ceil rate
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  @doc """
  Converts BTC to USD using the Coinbase Get Historic Rates endpoint
  """
  def btc_to_usd(amount, precision \\ 2) do
    case get_btc_to_usd_rate() do
      rate -> Float.ceil rate * amount, precision
      _ -> nil
    end
  end

  @doc """
  Converts USD to BTC using the Coinbase Get Historic Rates endpoint
  """
  def usd_to_btc(amount, precision \\ 2) do
    case get_btc_to_usd_rate() do
      rate -> Float.ceil (1/rate) * amount, precision
      _ -> nil
    end
  end
end
