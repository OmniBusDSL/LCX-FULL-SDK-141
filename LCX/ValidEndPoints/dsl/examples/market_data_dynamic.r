library(httr)
library(jsonlite)

"fetch_all_pairs_data" <- function(pair) {
  url <- "https://exchange-api.lcx.com/api/ticker"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
# Workflow: FetchAllPairsData (sequence)

"get_ethusdc_ticker" <- function(pair) {
  url <- "https://exchange-api.lcx.com/api/ticker"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
"get_lcxusdc_ticker" <- function(pair) {
  url <- "https://exchange-api.lcx.com/api/ticker"
  response <- httr::GET(url)
  return(httr::content(response, "text"))
}
