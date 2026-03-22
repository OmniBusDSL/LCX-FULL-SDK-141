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
# POST method not supported for scala
# POST method not supported for scala
# PUT method not supported for scala
# PUT method not supported for scala
# PUT method not supported for scala
# DELETE method not supported for scala
# DELETE method not supported for scala
def get_all_open_orders(offset): scala.concurrent.Future[String] = {
    // GET /api/open
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/open"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/open"
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

def get_open_orders_for_pair(offset, pair): scala.concurrent.Future[String] = {
    // GET /api/open
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/open"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/open"
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

def get_open_orders_with_date_range(offset, pair, fromDate, toDate): scala.concurrent.Future[String] = {
    // GET /api/open
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/open"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/open"
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

def get_single_order_status(orderId): scala.concurrent.Future[String] = {
    // GET /api/order
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/order"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/order"
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

def get_complete_order_history(offset): scala.concurrent.Future[String] = {
    // GET /api/orderHistory
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/orderHistory"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/orderHistory"
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

def get_order_history_for_pair(offset, pair): scala.concurrent.Future[String] = {
    // GET /api/orderHistory
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/orderHistory"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/orderHistory"
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

def get_order_history_by_status(offset, orderStatus): scala.concurrent.Future[String] = {
    // GET /api/orderHistory
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/orderHistory"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/orderHistory"
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

def get_order_history_by_type(offset, orderType): scala.concurrent.Future[String] = {
    // GET /api/orderHistory
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/orderHistory"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/orderHistory"
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

def get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType): scala.concurrent.Future[String] = {
    // GET /api/orderHistory
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/orderHistory"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/orderHistory"
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

def get_all_trade_history(offset): scala.concurrent.Future[String] = {
    // GET /api/uHistory
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/uHistory"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/uHistory"
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

def get_trade_history_for_pair(offset, pair): scala.concurrent.Future[String] = {
    // GET /api/uHistory
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/uHistory"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/uHistory"
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

def get_trade_history_by_date_range(offset, pair, fromDate, toDate): scala.concurrent.Future[String] = {
    // GET /api/uHistory
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/uHistory"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/uHistory"
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

def simple_buy_workflow(order_result): scala.concurrent.Future[String] = {
    // GET /api/order
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/order"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/order"
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

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for scala
# PUT method not supported for scala
def get_history(0, BTC/USDC): scala.concurrent.Future[String] = {
    // GET /api/orderHistory
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/orderHistory"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/orderHistory"
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

def get_trades(0, BTC/USDC): scala.concurrent.Future[String] = {
    // GET /api/uHistory
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/uHistory"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/uHistory"
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

# None method not supported for scala
# DELETE method not supported for scala
def confirm_cancelled(first_order_from_list): scala.concurrent.Future[String] = {
    // GET /api/order
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/order"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/order"
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

# None method not supported for scala
