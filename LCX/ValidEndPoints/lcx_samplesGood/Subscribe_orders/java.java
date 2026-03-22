import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;
import java.net.URI;

public class Main {
    public static void main(String[] args) {
        try {
            String url = "wss://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}";
            WebSocketClient webSocketClient = new WebSocketClient(new URI(url)) {
                @Override
                public void onOpen(ServerHandshake handshakedata) {
                    System.out.println("Connected to WebSocket");
                    String msg = "{\"Topic\":\"subscribe\",\"Type\":\"user_orders\"}";
                    send(msg);
                }

                @Override
                public void onMessage(String message) {
                    System.out.println(message);
                }

                @Override
                public void onClose(int code, String reason, boolean remote) {
                    System.out.println("Closed WebSocket");
                }

                @Override
                public void onError(Exception ex) {
                    ex.printStackTrace();
                }
            };

            webSocketClient.connect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
