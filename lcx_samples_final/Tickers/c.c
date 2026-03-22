#include <stdio.h>
#include <curl/curl.h>

int main() {
    CURL *curl = curl_easy_init();
    curl_easy_setopt(curl, CURLOPT_URL, "https://exchange-api.lcx.com/api/tickers");
    curl_easy_perform(curl);
    curl_easy_cleanup(curl);
    return 0;
}
