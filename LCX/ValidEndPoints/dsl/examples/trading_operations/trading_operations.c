#include <stdio.h>
#include <curl/curl.h>
#include <openssl/hmac.h>
#include <openssl/sha.h>


# POST method not supported for c
# POST method not supported for c
# POST method not supported for c
# PUT method not supported for c
# PUT method not supported for c
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

void get_all_open_orders(offset) {
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

void get_open_orders_for_pair(offset, pair) {
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

void get_open_orders_with_date_range(offset, pair, fromDate, toDate) {
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

void get_single_order_status(orderId) {
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

void get_complete_order_history(offset) {
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

void get_order_history_for_pair(offset, pair) {
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

void get_order_history_by_status(offset, orderStatus) {
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

void get_order_history_by_type(offset, orderType) {
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

void get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) {
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

void get_all_trade_history(offset) {
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

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_trade_history_for_pair(offset, pair) {
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

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_trade_history_by_date_range(offset, pair, fromDate, toDate) {
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

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void simple_buy_workflow(order_result) {
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

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for c
# PUT method not supported for c
#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_history(0, BTC/USDC) {
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

void get_trades(0, BTC/USDC) {
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
# DELETE method not supported for c
#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void confirm_cancelled(first_order_from_list) {
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
