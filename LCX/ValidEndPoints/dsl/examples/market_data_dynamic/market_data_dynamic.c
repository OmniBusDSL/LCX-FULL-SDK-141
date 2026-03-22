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

void fetch_all_pairs_data(pair) {
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

# Workflow: FetchAllPairsData (sequence)

#include <stdio.h>
#include <curl/curl.h>
#include <string.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((char*)userp)[0] = 0;
    strncat(userp, contents, size * nmemb);
    return size * nmemb;
}

void get_ethusdc_ticker(pair) {
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

void get_lcxusdc_ticker(pair) {
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

