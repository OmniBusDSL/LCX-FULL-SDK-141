library(httr)
library(jsonlite)

"get_account_info" <- function() {
  url <- "https://exchange-api.lcx.com/api/account"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_balances" <- function() {
  url <- "https://exchange-api.lcx.com/api/balances"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_asset_balance" <- function(asset) {
  url <- "https://exchange-api.lcx.com/api/balance"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_trading_fees" <- function() {
  url <- "https://exchange-api.lcx.com/api/fees"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_open_orders" <- function(offset, pair) {
  url <- "https://exchange-api.lcx.com/api/open"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_order_details" <- function(orderId) {
  url <- "https://exchange-api.lcx.com/api/order"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_order_history" <- function(offset, pair, fromDate, toDate, side, orderStatus, orderType) {
  url <- "https://exchange-api.lcx.com/api/orderHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_user_trade_history" <- function(offset, pair, fromDate, toDate) {
  url <- "https://exchange-api.lcx.com/api/uHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# POST method not supported for r
# PUT method not supported for r
# DELETE method not supported for r
# DELETE method not supported for r
"check_balance_workflow" <- function() {
  url <- "https://exchange-api.lcx.com/api/balances"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for r
"place_order_workflow" <- function(BTC/USDC) {
  url <- "https://exchange-api.lcx.com/api/ticker"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for r
"get_order_info" <- function(order_response) {
  url <- "https://exchange-api.lcx.com/api/order"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# None method not supported for r
"manage_open_orders_workflow" <- function(0) {
  url <- "https://exchange-api.lcx.com/api/orderHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# Workflow: ManageOpenOrdersWorkflow (sequence)

"get_trade_history" <- function(0) {
  url <- "https://exchange-api.lcx.com/api/uHistory"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# None method not supported for r
# PUT method not supported for r
# DELETE method not supported for r
# None method not supported for r
"account_monitoring_workflow" <- function() {
  url <- "https://exchange-api.lcx.com/api/balances"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# Workflow: AccountMonitoringWorkflow (sequence)

"get_open_orders" <- function(0) {
  url <- "https://exchange-api.lcx.com/api/open"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_fees" <- function() {
  url <- "https://exchange-api.lcx.com/api/fees"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# None method not supported for r
