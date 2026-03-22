import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.*;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

public class LCXAuthentication {
    public static void main(String[] args) throws Exception {
        String baseUrl = "https://exchange-api.lcx.com";
        String endpoint = "/api/create";
        String method = "POST";
        String apiKey = "ADD YOUR LCX EXCHANGE API KEY";
        String secretKey = "ADD YOUR LCX EXCHANGE SECRET KEY";

        // Create example payload
        JsonObject payload = new JsonObject();
        payload.addProperty("OrderType", "LIMIT");
        payload.addProperty("Pair", "LCX/ETH");
        payload.addProperty("Side", "BUY");
        payload.addProperty("Price", 0.03033486);
        payload.addProperty("Amount", 500);

        String payloadString = payload.toString();

        // Create request string
        String requestString = method + endpoint + payloadString;

        // Sign the request using HMAC-SHA256
        String signature = getSignature(requestString, secretKey);

        // Create HTTP request
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(baseUrl + endpoint);

        // Add headers
        httpPost.setHeader("x-access-key", apiKey);
        httpPost.setHeader("x-access-sign", signature);
        httpPost.setHeader("x-access-timestamp", String.valueOf(System.currentTimeMillis()));
        httpPost.setHeader("Content-Type", "application/json");

        // Add payload
        httpPost.setEntity(new StringEntity(payloadString));

        try {
            var response = httpClient.execute(httpPost);
            System.out.println("Status: " + response.getStatusLine().getStatusCode());
            System.out.println("Body: " + response.getEntity());
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    private static String getSignature(String message, String secretKey) throws Exception {
        Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
        SecretKeySpec secret_key = new SecretKeySpec(
            secretKey.getBytes(StandardCharsets.UTF_8),
            "HmacSHA256"
        );
        sha256_HMAC.init(secret_key);
        byte[] hash = sha256_HMAC.doFinal(message.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(hash);
    }
}
