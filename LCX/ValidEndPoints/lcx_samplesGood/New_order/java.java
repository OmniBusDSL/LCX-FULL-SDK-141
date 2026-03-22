import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("https://exchange-api.lcx.com/api/create");

        StringEntity entity = new StringEntity("{\"Pair\": \"LCX/ETH\", \"Amount\": 100, \"Price\": 0.004, \"OrderType\": \"MARKET\", \"Side\": \"SELL\"}", "UTF-8");
        entity.setContentEncoding("application/json");
        httpPost.setEntity(entity);

        // Add authentication headers here

        try {
            HttpResponse response = httpClient.execute(httpPost);
            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));

            StringBuilder result = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                result.append(line);
            }

            System.out.println(result.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
