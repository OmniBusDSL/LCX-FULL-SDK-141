import okhttp3.*;
import com.google.gson.*;
import java.util.Map;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.time.System;


public static Map<String, Object> fetch_all_tickers() throws Exception {
    // GET /api/tickers
    String url = "https://exchange-api.lcx.com/api/tickers";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();
    String body = response.body().string();
    System.out.println(body);
    return new Gson().fromJson(body, Map.class);

}

public static Map<String, Object> get_ticker_for_pair(pair) throws Exception {
    // GET /api/ticker
    String url = "https://exchange-api.lcx.com/api/ticker";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> fetch_all_pairs() throws Exception {
    // GET /api/pairs
    String url = "https://exchange-api.lcx.com/api/pairs";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();
    String body = response.body().string();
    System.out.println(body);
    return new Gson().fromJson(body, Map.class);

}

public static Map<String, Object> get_pair_info(pair_symbol) throws Exception {
    // GET /api/pair/BTC/USDC
    String url = "https://exchange-api.lcx.com/api/pair/BTC/USDC";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_order_book(pair) throws Exception {
    // GET /api/book
    String url = "https://exchange-api.lcx.com/api/book";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();
    String body = response.body().string();
    System.out.println(body);
    return new Gson().fromJson(body, Map.class);

}

public static Map<String, Object> get_recent_trades(pair, offset) throws Exception {
    // GET /api/trades
    String url = "https://exchange-api.lcx.com/api/trades";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_candle_data(pair, resolution, from_ts, to_ts) throws Exception {
    // GET /v1/market/kline
    String url = "https://api-kline.lcx.com/v1/market/kline";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();
    String body = response.body().string();
    System.out.println(body);
    return new Gson().fromJson(body, Map.class);

}

public static Map<String, Object> market_overview() throws Exception {
    // GET /api/book
    String url = "https://exchange-api.lcx.com/api/book";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

# Workflow: MarketOverview (sequence)

public static Map<String, Object> get_trades() throws Exception {
    // GET /api/trades
    String url = "https://exchange-api.lcx.com/api/trades";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

# None method not supported for java
