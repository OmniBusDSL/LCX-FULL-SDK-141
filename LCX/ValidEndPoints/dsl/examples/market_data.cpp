#include <iostream>
#include <curl/curl.h>
#include <nlohmann/json.hpp>

std::string fetch_all_tickers() {
    std::string url = "https://exchange-api.lcx.com/api/tickers";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
std::string get_ticker_for_pair(pair) {
    std::string url = "https://exchange-api.lcx.com/api/ticker";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
std::string fetch_all_pairs() {
    std::string url = "https://exchange-api.lcx.com/api/pairs";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
std::string get_pair_info(pair_symbol) {
    std::string url = "https://exchange-api.lcx.com/api/pair/BTC/USDC";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
std::string get_order_book(pair) {
    std::string url = "https://exchange-api.lcx.com/api/book";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
std::string get_recent_trades(pair, offset) {
    std::string url = "https://exchange-api.lcx.com/api/trades";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
std::string get_candle_data(pair, resolution, from_ts, to_ts) {
    std::string url = "https://api-kline.lcx.com/v1/market/kline";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
std::string market_overview() {
    std::string url = "https://exchange-api.lcx.com/api/book";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
# Workflow: MarketOverview (sequence)

std::string get_trades() {
    std::string url = "https://exchange-api.lcx.com/api/trades";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
# None method not supported for cpp
