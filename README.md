# CurrencyConversion

Elixir Application that converts currencies BTC, USD and RUB using Coinbase APi and CoinGecko API

## Usage

You need have Elixir lang installed in order to try it. 

```
$ mix deps.get
$ iex -S mix
iex(1)> CurrencyConversion.btc_to_usd(10)
62100.0
iex(1)> CurrencyConversion.usd_to_btc(62100)
10.0
iex(1)> CurrencyConversion.btc_to_rub(10)
3891773.9
iex(1)> CurrencyConversion.rub_to_btc(3891773)
10.0
```
