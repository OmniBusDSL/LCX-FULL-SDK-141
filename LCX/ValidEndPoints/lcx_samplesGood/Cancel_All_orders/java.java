import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class CancelOrder {

    public static void main(String[] args) throws Exception {
        OkHttpClient client = new OkHttpClient();

        String url = "https://exchange-api.lcx.com/order/cancel-all";
        // Add your auth headers here
        Map<String, String> headers = new HashMap<>();

        Map<String, Object> params = new HashMap<>();
        params.put("orderIds", Arrays.asList("70aba300-0990-481d-ad76-7bd499f473ab", "ecaf000a-8f4c-459a-b105-784c0e0436df"));

        String queryString = params.entrySet().stream()
                .map(entry -> entry.getKey() + "=" + entry.getValue())
                .collect(Collectors.joining("&"));

        String fullUrl = url + "?" + queryString;

        Request request = new Request.Builder()
                .url(fullUrl)
                .headers(Headers.of(headers))
                .delete()
                .build();

        try (Response response = client.newCall(request).execute()) {
            System.out.println(response.body().string());
        }
    }
}
