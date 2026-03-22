import akka.actor.ActorSystem
import akka.stream.ActorMaterializer
import akka.http.scaladsl.Http
import akka.http.scaladsl.model._
import akka.http.scaladsl.model.headers.RawHeader
import scala.concurrent.Future
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec
import java.util.Base64


def fetch_all_pairs_data(pair): scala.concurrent.Future[String] = {
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
        println(body)
        body

    })
}

# Workflow: FetchAllPairsData (sequence)

def get_ethusdc_ticker(pair): scala.concurrent.Future[String] = {
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
        println(body)
        body

    })
}

def get_lcxusdc_ticker(pair): scala.concurrent.Future[String] = {
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
        println(body)
        body

    })
}

