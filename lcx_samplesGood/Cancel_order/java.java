import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        OkHttpClient client = new OkHttpClient();

        String url = "https://exchange-api.lcx.com/api/cancel";
        String orderId = "e8737c4a-3804-461c-9e67-4fe0af5aeb06";

        Request request = new Request.Builder()
                .url(url + "?orderId=" + orderId)
                .delete()
                .addHeader("Content-Type", "application/json")
                // Add your authentication headers here
                .build();

        try (Response response = client.newCall(request).execute()) {
            System.out.println(response.body().string());
        }
    }
}
