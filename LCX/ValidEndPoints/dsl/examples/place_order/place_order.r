library(httr)
library(jsonlite)

# POST method not supported for r
"check_order_status" <- function(order_id) {
  url <- "https://exchange-api.lcx.com/api/trading/order/{order_id}"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# POST method not supported for r
"complete_order_flow" <- function(currency) {
  url <- "https://exchange-api.lcx.com/api/account/balance"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}


# POST method not supported for r
# None method not supported for r
# None method not supported for r
# None method not supported for r
# None method not supported for r
# None method not supported for r
# None method not supported for r
# None method not supported for r
# None method not supported for r
# None method not supported for r
# None method not supported for r
