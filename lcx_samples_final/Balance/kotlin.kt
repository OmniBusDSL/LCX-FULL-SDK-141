import okhttp3.OkHttpClient
import okhttp3.Request

val client = OkHttpClient()
val request = Request.Builder()
    .url("https://exchange-api.lcx.com/api/balance")
    .get()
    .build()

client.newCall(request).execute().use { response ->
    println(response.body?.string())
}
