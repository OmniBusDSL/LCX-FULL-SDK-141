import akka.actor.ActorSystem
import akka.stream.ActorMaterializer
import akka.http.scaladsl.Http
import akka.http.scaladsl.model._
import akka.http.scaladsl.model.headers.RawHeader
import scala.concurrent.Future
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec
import java.util.Base64


def get_account_info(): scala.concurrent.Future[String] = {
    // GET /api/account
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/account"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/account"
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

def get_balances(): scala.concurrent.Future[String] = {
    // GET /api/balances
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/balances"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/balances"
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

def get_asset_balance(asset): scala.concurrent.Future[String] = {
    // GET /api/balance
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/balance"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/balance"
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

def get_trading_fees(): scala.concurrent.Future[String] = {
    // GET /api/fees
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/fees"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/fees"
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

def get_open_orders(offset, pair): scala.concurrent.Future[String] = {
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

def get_order_details(orderId): scala.concurrent.Future[String] = {
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

def get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType): scala.concurrent.Future[String] = {
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

def get_user_trade_history(offset, pair, fromDate, toDate): scala.concurrent.Future[String] = {
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

# POST method not supported for scala
# PUT method not supported for scala
# DELETE method not supported for scala
# DELETE method not supported for scala
def check_balance_workflow(): scala.concurrent.Future[String] = {
    // GET /api/balances
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/balances"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/balances"
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

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for scala
def place_order_workflow(BTC/USDC): scala.concurrent.Future[String] = {
    // GET /api/ticker
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/ticker"

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

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for scala
def get_order_info(order_response): scala.concurrent.Future[String] = {
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
def manage_open_orders_workflow(0): scala.concurrent.Future[String] = {
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

# Workflow: ManageOpenOrdersWorkflow (sequence)

def get_trade_history(0): scala.concurrent.Future[String] = {
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
# PUT method not supported for scala
# DELETE method not supported for scala
# None method not supported for scala
def account_monitoring_workflow(): scala.concurrent.Future[String] = {
    // GET /api/balances
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/balances"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/balances"
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

# Workflow: AccountMonitoringWorkflow (sequence)

def get_open_orders(0): scala.concurrent.Future[String] = {
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

    })
}

def get_fees(): scala.concurrent.Future[String] = {
    // GET /api/fees
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/fees"
    val apiKey = sys.env.get("LCX_API_KEY").getOrElse("")
    val apiSecret = sys.env.get("LCX_API_SECRET").getOrElse("")
    val timestamp = System.currentTimeMillis.toString
    val message = timestamp + "GET" + "/api/fees"
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
