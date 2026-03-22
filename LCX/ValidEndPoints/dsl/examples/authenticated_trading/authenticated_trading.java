import okhttp3.*;
import com.google.gson.*;
import java.util.Map;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.time.System;


public static Map<String, Object> get_account_info() throws Exception {
    // GET /api/account
    String url = "https://exchange-api.lcx.com/api/account";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/account";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_balances() throws Exception {
    // GET /api/balances
    String url = "https://exchange-api.lcx.com/api/balances";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/balances";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_asset_balance(asset) throws Exception {
    // GET /api/balance
    String url = "https://exchange-api.lcx.com/api/balance";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/balance";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_trading_fees() throws Exception {
    // GET /api/fees
    String url = "https://exchange-api.lcx.com/api/fees";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/fees";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

public static Map<String, Object> get_open_orders(offset, pair) throws Exception {
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

public static Map<String, Object> get_order_details(orderId) throws Exception {
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

public static Map<String, Object> get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) throws Exception {
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

public static Map<String, Object> get_user_trade_history(offset, pair, fromDate, toDate) throws Exception {
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

# POST method not supported for java
# PUT method not supported for java
# DELETE method not supported for java
# DELETE method not supported for java
public static Map<String, Object> check_balance_workflow() throws Exception {
    // GET /api/balances
    String url = "https://exchange-api.lcx.com/api/balances";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/balances";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for java
public static Map<String, Object> place_order_workflow(BTC/USDC) throws Exception {
    // GET /api/ticker
    String url = "https://exchange-api.lcx.com/api/ticker";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for java
public static Map<String, Object> get_order_info(order_response) throws Exception {
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
public static Map<String, Object> manage_open_orders_workflow(0) throws Exception {
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

# Workflow: ManageOpenOrdersWorkflow (sequence)

public static Map<String, Object> get_trade_history(0) throws Exception {
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
# PUT method not supported for java
# DELETE method not supported for java
# None method not supported for java
public static Map<String, Object> account_monitoring_workflow() throws Exception {
    // GET /api/balances
    String url = "https://exchange-api.lcx.com/api/balances";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/balances";
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(new SecretKeySpec(apiSecret.getBytes(), "HmacSHA256"));
    String signature = Base64.getEncoder().encodeToString(mac.doFinal(message.getBytes()));
    builder.addHeader("x-access-key", apiKey);
    builder.addHeader("x-access-sign", signature);
    builder.addHeader("x-access-timestamp", timestamp);

    Request request = builder.build();
    Response response = client.newCall(request).execute();

}

# Workflow: AccountMonitoringWorkflow (sequence)

public static Map<String, Object> get_open_orders(0) throws Exception {
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

public static Map<String, Object> get_fees() throws Exception {
    // GET /api/fees
    String url = "https://exchange-api.lcx.com/api/fees";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/fees";
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
