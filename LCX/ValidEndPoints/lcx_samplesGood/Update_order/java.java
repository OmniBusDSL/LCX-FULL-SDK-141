import com.google.gson.Gson;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        OkHttpClient client = new OkHttpClient();
        Gson gson = new Gson();

        String url = "https://exchange-api.lcx.com/api/modify";
        String orderId = "9f898d18-0980-4fb3-b18c-eeb39fc20324";
        double amount = 100;
        double price = 0.004;

        ModifyRequestData data = new ModifyRequestData(orderId, amount, price);
        String jsonData = gson.toJson(data);

        Request request = new Request.Builder()
                .url(url)
                .put(RequestBody.create(MediaType.parse("application/json"), jsonData))
                .addHeader("Content-Type", "application/json")
                // Add your authentication headers here
                .build();

        try (Response response = client.newCall(request).execute()) {
            System.out.println(response.body().string());
        }
    }

    private static class ModifyRequestData {
        private String OrderId;
        private double Amount;
        private double Price;

        public ModifyRequestData(String orderId, double amount, double price) {
            OrderId = orderId;
            Amount = amount;
            Price = price;
        }
    }
}
