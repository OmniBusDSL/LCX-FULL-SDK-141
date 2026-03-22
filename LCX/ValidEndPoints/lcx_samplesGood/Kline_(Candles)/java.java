import java.io.IOException;
import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class Main {
    public static void main(String[] args) throws IOException {
        OkHttpClient client = new OkHttpClient();

        HttpUrl.Builder urlBuilder = HttpUrl.parse("https://api-kline.lcx.com/v1/market/kline").newBuilder();
        urlBuilder.addQueryParameter("pair", "ETH/BTC");
        urlBuilder.addQueryParameter("resolution", "60");
        urlBuilder.addQueryParameter("from", "1608129416");
        urlBuilder.addQueryParameter("to", "1608229416");

        String url = urlBuilder.build().toString();

        Request request = new Request.Builder()
                .url(url)
                .addHeader("Content-Type", "application/json")
                .build();

        try (Response response = client.newCall(request).execute()) {
            System.out.println(response.body().string());
        }
    }
}
