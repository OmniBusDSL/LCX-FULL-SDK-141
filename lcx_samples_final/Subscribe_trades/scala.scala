import scala.io.Source

val url = "https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}"
val source = Source.fromURL(url)
println(source.mkString)
source.close()
