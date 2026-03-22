import okhttp3.*;
import com.google.gson.*;
import java.util.Map;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.time.System;


# POST method not supported for java
# POST method not supported for java
# POST method not supported for java
# PUT method not supported for java
# PUT method not supported for java
# PUT method not supported for java
# DELETE method not supported for java
# DELETE method not supported for java
public static Map<String, Object> get_all_open_orders(offset) throws Exception {
    // GET /api/open
    String url = "https://exchange-api.lcx.com/api/open";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/open";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_open_orders_for_pair(offset, pair) throws Exception {
    // GET /api/open
    String url = "https://exchange-api.lcx.com/api/open";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/open";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_open_orders_with_date_range(offset, pair, fromDate, toDate) throws Exception {
    // GET /api/open
    String url = "https://exchange-api.lcx.com/api/open";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/open";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_single_order_status(orderId) throws Exception {
    // GET /api/order
    String url = "https://exchange-api.lcx.com/api/order";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/order";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_complete_order_history(offset) throws Exception {
    // GET /api/orderHistory
    String url = "https://exchange-api.lcx.com/api/orderHistory";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/orderHistory";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_order_history_for_pair(offset, pair) throws Exception {
    // GET /api/orderHistory
    String url = "https://exchange-api.lcx.com/api/orderHistory";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/orderHistory";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_order_history_by_status(offset, orderStatus) throws Exception {
    // GET /api/orderHistory
    String url = "https://exchange-api.lcx.com/api/orderHistory";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/orderHistory";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_order_history_by_type(offset, orderType) throws Exception {
    // GET /api/orderHistory
    String url = "https://exchange-api.lcx.com/api/orderHistory";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/orderHistory";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) throws Exception {
    // GET /api/orderHistory
    String url = "https://exchange-api.lcx.com/api/orderHistory";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/orderHistory";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_all_trade_history(offset) throws Exception {
    // GET /api/uHistory
    String url = "https://exchange-api.lcx.com/api/uHistory";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/uHistory";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_trade_history_for_pair(offset, pair) throws Exception {
    // GET /api/uHistory
    String url = "https://exchange-api.lcx.com/api/uHistory";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/uHistory";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_trade_history_by_date_range(offset, pair, fromDate, toDate) throws Exception {
    // GET /api/uHistory
    String url = "https://exchange-api.lcx.com/api/uHistory";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/uHistory";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> simple_buy_workflow(order_result) throws Exception {
    // GET /api/order
    String url = "https://exchange-api.lcx.com/api/order";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/order";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for java
# PUT method not supported for java
public static Map<String, Object> get_history(0, BTC/USDC) throws Exception {
    // GET /api/orderHistory
    String url = "https://exchange-api.lcx.com/api/orderHistory";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/orderHistory";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_trades(0, BTC/USDC) throws Exception {
    // GET /api/uHistory
    String url = "https://exchange-api.lcx.com/api/uHistory";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/uHistory";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

# None method not supported for java
# DELETE method not supported for java
public static Map<String, Object> confirm_cancelled(first_order_from_list) throws Exception {
    // GET /api/order
    String url = "https://exchange-api.lcx.com/api/order";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/order";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

# None method not supported for java
