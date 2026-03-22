import okhttp3.*;

OkHttpClient client = new OkHttpClient();
Request request = new Request.Builder()
    .url("https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}")
    .addHeader("Content-Type", "application/json")
    .get()
    .build();

Response response = client.newCall(request).execute();
System.out.println(response.body().string());
