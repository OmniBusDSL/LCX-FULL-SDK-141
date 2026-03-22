#include <iostream>
#include <curl/curl.h>
#include <nlohmann/json.hpp>

std::string fetch_all_pairs_data(pair) {
    std::string url = "https://exchange-api.lcx.com/api/ticker";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
# Workflow: FetchAllPairsData (sequence)

std::string get_ethusdc_ticker(pair) {
    std::string url = "https://exchange-api.lcx.com/api/ticker";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
std::string get_lcxusdc_ticker(pair) {
    std::string url = "https://exchange-api.lcx.com/api/ticker";
    // GET request implementation
    auto response = http_client.get(url);
    return response.body();
}
