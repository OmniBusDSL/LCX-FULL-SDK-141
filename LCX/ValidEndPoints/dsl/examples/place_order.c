#include <stdio.h>
#include <curl/curl.h>
#include <openssl/hmac.h>
#include <openssl/sha.h>


# POST method not supported for c
#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void check_order_status(order_id) {
    // GET /api/trading/order/{order_id}
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/trading/order/{order_id}";
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
#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void complete_order_flow(currency) {
    // GET /api/account/balance
    CURL *curl = curl_easy_init();
    if(!curl) return;

    char url[] = "https://exchange-api.lcx.com/api/account/balance";
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
# None method not supported for c
# None method not supported for c
# None method not supported for c
# None method not supported for c
# None method not supported for c
# None method not supported for c
# None method not supported for c
# None method not supported for c
# None method not supported for c
# None method not supported for c
