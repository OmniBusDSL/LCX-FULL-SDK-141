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

void get_account_info() {
    // GET /api/account
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/account";
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

void get_balances() {
    // GET /api/balances
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/balances";
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

void get_asset_balance(asset) {
    // GET /api/balance
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/balance";
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

void get_trading_fees() {
    // GET /api/fees
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/fees";
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

void get_open_orders(offset, pair) {
    // GET /api/open
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/open";
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

void get_order_details(orderId) {
    // GET /api/order
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/order";
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

void get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) {
    // GET /api/orderHistory
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/orderHistory";
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

void get_user_trade_history(offset, pair, fromDate, toDate) {
    // GET /api/uHistory
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/uHistory";
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

# POST method not supported for c
# PUT method not supported for c
# DELETE method not supported for c
# DELETE method not supported for c
#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void check_balance_workflow() {
    // GET /api/balances
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/balances";
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

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for c
#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void place_order_workflow(BTC/USDC) {
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

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for c
#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_order_info(order_response) {
    // GET /api/order
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/order";
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
#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void manage_open_orders_workflow(0) {
    // GET /api/orderHistory
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/orderHistory";
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

# Workflow: ManageOpenOrdersWorkflow (sequence)

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_trade_history(0) {
    // GET /api/uHistory
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/uHistory";
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
# PUT method not supported for c
# DELETE method not supported for c
# None method not supported for c
#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void account_monitoring_workflow() {
    // GET /api/balances
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/balances";
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

# Workflow: AccountMonitoringWorkflow (sequence)

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_open_orders(0) {
    // GET /api/open
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/open";
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

void get_fees() {
    // GET /api/fees
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/fees";
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
