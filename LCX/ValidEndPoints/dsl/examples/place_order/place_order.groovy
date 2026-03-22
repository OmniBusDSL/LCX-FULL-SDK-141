import groovy.json.JsonSlurper
import java.security.MessageDigest


# POST method not supported for groovy
def check_order_status(order_id) {
  // GET /api/trading/order/{order_id}
  def url = new URL("https://exchange-api.lcx.com/api/trading/order/{order_id}")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# POST method not supported for groovy
def complete_order_flow(currency) {
  // GET /api/account/balance
  def url = new URL("https://exchange-api.lcx.com/api/account/balance")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}



# POST method not supported for groovy
# None method not supported for groovy
# None method not supported for groovy
# None method not supported for groovy
# None method not supported for groovy
# None method not supported for groovy
# None method not supported for groovy
# None method not supported for groovy
# None method not supported for groovy
# None method not supported for groovy
# None method not supported for groovy
