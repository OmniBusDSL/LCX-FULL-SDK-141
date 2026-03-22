import okhttp3.*
import com.google.gson.*
import kotlinx.coroutines.*
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec
import java.util.*


suspend fun fetch_all_tickers(): Map<String, Any> {
    // GET /api/tickers
    val url = "https://exchange-api.lcx.com/api/tickers"
    val client = OkHttpClient()

    val request = Request.Builder()
        .url(url)
        .addHeader("Content-Type", "application/json")
        .get()
        .build()

    return withContext(Dispatchers.IO) {
        val response = client.newCall(request).execute()
        val body = response.body?.string() ?: "{}"
        println(body)
        Gson().fromJson(body, Map::class.java) as Map<String, Any>

    }
}

suspend fun get_ticker_for_pair(pair): Map<String, Any> {
    // GET /api/ticker
    val url = "https://exchange-api.lcx.com/api/ticker"
    val client = OkHttpClient()

    val request = Request.Builder()
        .url(url)
        .addHeader("Content-Type", "application/json")
        .get()
        .build()

    return withContext(Dispatchers.IO) {
        val response = client.newCall(request).execute()
        val body = response.body?.string() ?: "{}"
        Gson().fromJson(body, Map::class.java) as Map<String, Any>

    }
}

suspend fun fetch_all_pairs(): Map<String, Any> {
    // GET /api/pairs
    val url = "https://exchange-api.lcx.com/api/pairs"
    val client = OkHttpClient()

    val request = Request.Builder()
        .url(url)
        .addHeader("Content-Type", "application/json")
        .get()
        .build()

    return withContext(Dispatchers.IO) {
        val response = client.newCall(request).execute()
        val body = response.body?.string() ?: "{}"
        println(body)
        Gson().fromJson(body, Map::class.java) as Map<String, Any>

    }
}

suspend fun get_pair_info(pair_symbol): Map<String, Any> {
    // GET /api/pair/BTC/USDC
    val url = "https://exchange-api.lcx.com/api/pair/BTC/USDC"
    val client = OkHttpClient()

    val request = Request.Builder()
        .url(url)
        .addHeader("Content-Type", "application/json")
        .get()
        .build()

    return withContext(Dispatchers.IO) {
        val response = client.newCall(request).execute()
        val body = response.body?.string() ?: "{}"
        Gson().fromJson(body, Map::class.java) as Map<String, Any>

    }
}

suspend fun get_order_book(pair): Map<String, Any> {
    // GET /api/book
    val url = "https://exchange-api.lcx.com/api/book"
    val client = OkHttpClient()

    val request = Request.Builder()
        .url(url)
        .addHeader("Content-Type", "application/json")
        .get()
        .build()

    return withContext(Dispatchers.IO) {
        val response = client.newCall(request).execute()
        val body = response.body?.string() ?: "{}"
        println(body)
        Gson().fromJson(body, Map::class.java) as Map<String, Any>

    }
}

suspend fun get_recent_trades(pair, offset): Map<String, Any> {
    // GET /api/trades
    val url = "https://exchange-api.lcx.com/api/trades"
    val client = OkHttpClient()

    val request = Request.Builder()
        .url(url)
        .addHeader("Content-Type", "application/json")
        .get()
        .build()

    return withContext(Dispatchers.IO) {
        val response = client.newCall(request).execute()
        val body = response.body?.string() ?: "{}"
        Gson().fromJson(body, Map::class.java) as Map<String, Any>

    }
}

suspend fun get_candle_data(pair, resolution, from_ts, to_ts): Map<String, Any> {
    // GET /v1/market/kline
    val url = "https://api-kline.lcx.com/v1/market/kline"
    val client = OkHttpClient()

    val request = Request.Builder()
        .url(url)
        .addHeader("Content-Type", "application/json")
        .get()
        .build()

    return withContext(Dispatchers.IO) {
        val response = client.newCall(request).execute()
        val body = response.body?.string() ?: "{}"
        println(body)
        Gson().fromJson(body, Map::class.java) as Map<String, Any>

    }
}

suspend fun market_overview(): Map<String, Any> {
    // GET /api/book
    val url = "https://exchange-api.lcx.com/api/book"
    val client = OkHttpClient()

    val request = Request.Builder()
        .url(url)
        .addHeader("Content-Type", "application/json")
        .get()
        .build()

    return withContext(Dispatchers.IO) {
        val response = client.newCall(request).execute()
        val body = response.body?.string() ?: "{}"

    }
}

suspend fun get_trades(): Map<String, Any> {
    // GET /api/trades
    val url = "https://exchange-api.lcx.com/api/trades"
    val client = OkHttpClient()

    val request = Request.Builder()
        .url(url)
        .addHeader("Content-Type", "application/json")
        .get()
        .build()

    return withContext(Dispatchers.IO) {
        val response = client.newCall(request).execute()
        val body = response.body?.string() ?: "{}"

    }
}

# None method not supported for kotlin
