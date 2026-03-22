#include <stdio.h>
#include <curl/curl.h>
#include <openssl/hmac.h>
#include <openssl/sha.h>


#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void fetch_all_tickers() {
    // GET /api/tickers
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/tickers";
    char response[4096] = {0};

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, response);

    CURLcode res = curl_easy_perform(curl);
    if(res != CURLE_OK) {
        printf("Error: %s\n", curl_easy_strerror(res));
    } else {
        printf("%s\n", response);
    }

    curl_easy_cleanup(curl);
}

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_ticker_for_pair(pair) {
    // GET /api/ticker
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/ticker";
    char response[4096] = {0};

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, response);

    CURLcode res = curl_easy_perform(curl);
    if(res != CURLE_OK) {
        printf("Error: %s\n", curl_easy_strerror(res));
    } else {
        printf("%s\n", response);
    }

    curl_easy_cleanup(curl);
}

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void fetch_all_pairs() {
    // GET /api/pairs
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/pairs";
    char response[4096] = {0};

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, response);

    CURLcode res = curl_easy_perform(curl);
    if(res != CURLE_OK) {
        printf("Error: %s\n", curl_easy_strerror(res));
    } else {
        printf("%s\n", response);
    }

    curl_easy_cleanup(curl);
}

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_pair_info(pair_symbol) {
    // GET /api/pair/BTC/USDC
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/pair/BTC/USDC";
    char response[4096] = {0};

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, response);

    CURLcode res = curl_easy_perform(curl);
    if(res != CURLE_OK) {
        printf("Error: %s\n", curl_easy_strerror(res));
    } else {
        printf("%s\n", response);
    }

    curl_easy_cleanup(curl);
}

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_order_book(pair) {
    // GET /api/book
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/book";
    char response[4096] = {0};

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, response);

    CURLcode res = curl_easy_perform(curl);
    if(res != CURLE_OK) {
        printf("Error: %s\n", curl_easy_strerror(res));
    } else {
        printf("%s\n", response);
    }

    curl_easy_cleanup(curl);
}

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_recent_trades(pair, offset) {
    // GET /api/trades
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/trades";
    char response[4096] = {0};

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, response);

    CURLcode res = curl_easy_perform(curl);
    if(res != CURLE_OK) {
        printf("Error: %s\n", curl_easy_strerror(res));
    } else {
        printf("%s\n", response);
    }

    curl_easy_cleanup(curl);
}

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_candle_data(pair, resolution, from_ts, to_ts) {
    // GET /v1/market/kline
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://api-kline.lcx.com/v1/market/kline";
    char response[4096] = {0};

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, response);

    CURLcode res = curl_easy_perform(curl);
    if(res != CURLE_OK) {
        printf("Error: %s\n", curl_easy_strerror(res));
    } else {
        printf("%s\n", response);
    }

    curl_easy_cleanup(curl);
}

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void market_overview() {
    // GET /api/book
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/book";
    char response[4096] = {0};

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, response);

    CURLcode res = curl_easy_perform(curl);
    if(res != CURLE_OK) {
        printf("Error: %s\n", curl_easy_strerror(res));
    } else {
        printf("%s\n", response);
    }

    curl_easy_cleanup(curl);
}

# Workflow: MarketOverview (sequence)

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_trades() {
    // GET /api/trades
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/trades";
    char response[4096] = {0};

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, response);

    CURLcode res = curl_easy_perform(curl);
    if(res != CURLE_OK) {
        printf("Error: %s\n", curl_easy_strerror(res));
    } else {
        printf("%s\n", response);
    }

    curl_easy_cleanup(curl);
}

# None method not supported for c
