import okhttp3.*;
import com.google.gson.*;
import java.util.Map;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.time.System;


# POST method not supported for java
public static Map<String, Object> check_order_status(order_id) throws Exception {
    // GET /api/trading/order/{order_id}
    String url = "https://exchange-api.lcx.com/api/trading/order/{order_id}";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/trading/order/{order_id}";
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
public static Map<String, Object> complete_order_flow(currency) throws Exception {
    // GET /api/account/balance
    String url = "https://exchange-api.lcx.com/api/account/balance";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");
    String apiKey = System.getenv("LCX_API_KEY");
    String apiSecret = System.getenv("LCX_API_SECRET");
    String timestamp = String.valueOf(System.currentTimeMillis());
    String message = timestamp + "GET" + "/api/account/balance";
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
# None method not supported for java
# None method not supported for java
# None method not supported for java
# None method not supported for java
# None method not supported for java
# None method not supported for java
# None method not supported for java
# None method not supported for java
# None method not supported for java
# None method not supported for java
