import akka.actor.ActorSystem
import akka.stream.ActorMaterializer
import akka.http.scaladsl.Http
import akka.http.scaladsl.model._
import akka.http.scaladsl.model.headers.RawHeader
import scala.concurrent.Future
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec
import java.util.Base64


# POST method not supported for scala
def check_order_status(order_id): scala.concurrent.Future[String] = {
    // GET /api/trading/order/{order_id}
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/trading/order/{order_id}"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/trading/order/{order_id}"
    val mac = Mac.getInstance("HmacSHA256")
    mac.init(new SecretKeySpec(apiSecret.getBytes, "HmacSHA256"))
    val signature = Base64.getEncoder.encodeToString(mac.doFinal(message.getBytes))

    Http().singleRequest(
        HttpRequest(
            method = HttpMethods.GET,
            uri = url,
            headers = scala.collection.immutable.Seq(
                RawHeader("Content-Type", "application/json")
            )
        )
    ).map(response => {
        val body = response.entity.dataBytes
            .map(_.utf8String)
            .runFold("")(_ + _)
        body

    })
}

# POST method not supported for scala
def complete_order_flow(currency): scala.concurrent.Future[String] = {
    // GET /api/account/balance
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/account/balance"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/account/balance"
    val mac = Mac.getInstance("HmacSHA256")
    mac.init(new SecretKeySpec(apiSecret.getBytes, "HmacSHA256"))
    val signature = Base64.getEncoder.encodeToString(mac.doFinal(message.getBytes))

    Http().singleRequest(
        HttpRequest(
            method = HttpMethods.GET,
            uri = url,
            headers = scala.collection.immutable.Seq(
                RawHeader("Content-Type", "application/json")
            )
        )
    ).map(response => {
        val body = response.entity.dataBytes
            .map(_.utf8String)
            .runFold("")(_ + _)

    })
}



# POST method not supported for scala
# None method not supported for scala
# None method not supported for scala
# None method not supported for scala
# None method not supported for scala
# None method not supported for scala
# None method not supported for scala
# None method not supported for scala
# None method not supported for scala
# None method not supported for scala
# None method not supported for scala
