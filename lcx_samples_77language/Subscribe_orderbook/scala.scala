import scala.io.Source

val url = "https://exchange-api.lcx.com/api/test"
val source = Source.fromURL(url)
println(source.mkString)
source.close()
