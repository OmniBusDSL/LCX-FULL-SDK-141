import akka.actor.ActorSystem
import akka.stream.ActorMaterializer
import akka.http.scaladsl.Http
import akka.http.scaladsl.model._
import akka.http.scaladsl.model.headers.RawHeader
import scala.concurrent.Future
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec
import java.util.Base64


def fetch_all_tickers(): scala.concurrent.Future[String] = {
    // GET /api/tickers
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/tickers"

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
        println(body)
        body

    })
}

def get_ticker_for_pair(pair): scala.concurrent.Future[String] = {
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
        body

    })
}

def fetch_all_pairs(): scala.concurrent.Future[String] = {
    // GET /api/pairs
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/pairs"

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
        println(body)
        body

    })
}

def get_pair_info(pair_symbol): scala.concurrent.Future[String] = {
    // GET /api/pair/BTC/USDC
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/pair/BTC/USDC"

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

def get_order_book(pair): scala.concurrent.Future[String] = {
    // GET /api/book
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/book"

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
        println(body)
        body

    })
}

def get_recent_trades(pair, offset): scala.concurrent.Future[String] = {
    // GET /api/trades
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/trades"

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

def get_candle_data(pair, resolution, from_ts, to_ts): scala.concurrent.Future[String] = {
    // GET /v1/market/kline
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://api-kline.lcx.com/v1/market/kline"

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
        println(body)
        body

    })
}

def market_overview(): scala.concurrent.Future[String] = {
    // GET /api/book
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/book"

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

def get_trades(): scala.concurrent.Future[String] = {
    // GET /api/trades
    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val url = "https://exchange-api.lcx.com/api/trades"

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
