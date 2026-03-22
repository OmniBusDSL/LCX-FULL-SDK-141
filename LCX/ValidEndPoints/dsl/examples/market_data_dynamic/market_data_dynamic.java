import okhttp3.*;
import com.google.gson.*;
import java.util.Map;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.time.System;


public static Map<String, Object> fetch_all_pairs_data(pair) throws Exception {
    // GET /api/ticker
    String url = "https://exchange-api.lcx.com/api/ticker";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();
    String body = response.body().string();
    System.out.println(body);
    return new Gson().fromJson(body, Map.class);

}

# Workflow: FetchAllPairsData (sequence)

public static Map<String, Object> get_ethusdc_ticker(pair) throws Exception {
    // GET /api/ticker
    String url = "https://exchange-api.lcx.com/api/ticker";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();
    String body = response.body().string();
    System.out.println(body);
    return new Gson().fromJson(body, Map.class);

}

public static Map<String, Object> get_lcxusdc_ticker(pair) throws Exception {
    // GET /api/ticker
    String url = "https://exchange-api.lcx.com/api/ticker";
    OkHttpClient client = new OkHttpClient();
    Request.Builder builder = new Request.Builder().url(url);
    builder.addHeader("Content-Type", "application/json");

    Request request = builder.build();
    Response response = client.newCall(request).execute();
    String body = response.body().string();
    System.out.println(body);
    return new Gson().fromJson(body, Map.class);

}

