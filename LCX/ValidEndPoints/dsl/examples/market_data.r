library(httr)
library(jsonlite)

"fetch_all_tickers" <- function() {
  url <- "https://exchange-api.lcx.com/api/tickers"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_ticker_for_pair" <- function(pair) {
  url <- "https://exchange-api.lcx.com/api/ticker"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"fetch_all_pairs" <- function() {
  url <- "https://exchange-api.lcx.com/api/pairs"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_pair_info" <- function(pair_symbol) {
  url <- "https://exchange-api.lcx.com/api/pair/BTC/USDC"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_order_book" <- function(pair) {
  url <- "https://exchange-api.lcx.com/api/book"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_recent_trades" <- function(pair, offset) {
  url <- "https://exchange-api.lcx.com/api/trades"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_candle_data" <- function(pair, resolution, from_ts, to_ts) {
  url <- "https://api-kline.lcx.com/v1/market/kline"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"market_overview" <- function() {
  url <- "https://exchange-api.lcx.com/api/book"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# Workflow: MarketOverview (sequence)

"get_trades" <- function() {
  url <- "https://exchange-api.lcx.com/api/trades"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# None method not supported for r
