library(httr)
library(jsonlite)

# POST method not supported for r
# POST method not supported for r
# POST method not supported for r
# PUT method not supported for r
# PUT method not supported for r
# PUT method not supported for r
# DELETE method not supported for r
# DELETE method not supported for r
"get_all_open_orders" <- function(offset) {
  url <- "https://exchange-api.lcx.com/api/open"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_open_orders_for_pair" <- function(offset, pair) {
  url <- "https://exchange-api.lcx.com/api/open"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_open_orders_with_date_range" <- function(offset, pair, fromDate, toDate) {
  url <- "https://exchange-api.lcx.com/api/open"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_single_order_status" <- function(orderId) {
  url <- "https://exchange-api.lcx.com/api/order"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_complete_order_history" <- function(offset) {
  url <- "https://exchange-api.lcx.com/api/orderHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_order_history_for_pair" <- function(offset, pair) {
  url <- "https://exchange-api.lcx.com/api/orderHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_order_history_by_status" <- function(offset, orderStatus) {
  url <- "https://exchange-api.lcx.com/api/orderHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_order_history_by_type" <- function(offset, orderType) {
  url <- "https://exchange-api.lcx.com/api/orderHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_filtered_order_history" <- function(offset, pair, fromDate, toDate, side, orderStatus, orderType) {
  url <- "https://exchange-api.lcx.com/api/orderHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_all_trade_history" <- function(offset) {
  url <- "https://exchange-api.lcx.com/api/uHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_trade_history_for_pair" <- function(offset, pair) {
  url <- "https://exchange-api.lcx.com/api/uHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_trade_history_by_date_range" <- function(offset, pair, fromDate, toDate) {
  url <- "https://exchange-api.lcx.com/api/uHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"simple_buy_workflow" <- function(order_result) {
  url <- "https://exchange-api.lcx.com/api/order"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for r
# PUT method not supported for r
"get_history" <- function(0, BTC/USDC) {
  url <- "https://exchange-api.lcx.com/api/orderHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_trades" <- function(0, BTC/USDC) {
  url <- "https://exchange-api.lcx.com/api/uHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# None method not supported for r
# DELETE method not supported for r
"confirm_cancelled" <- function(first_order_from_list) {
  url <- "https://exchange-api.lcx.com/api/order"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# None method not supported for r
