import scala.io.Source

val url = "https://exchange-api.lcx.com"
val source = Source.fromURL(url)
println(source.mkString)
source.close()
