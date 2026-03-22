import groovy.json.JsonSlurper
import java.security.MessageDigest


def fetch_all_pairs_data(pair) {
  // GET /api/ticker
  def url = new URL("https://exchange-api.lcx.com/api/ticker")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

# Workflow: FetchAllPairsData (sequence)

def get_ethusdc_ticker(pair) {
  // GET /api/ticker
  def url = new URL("https://exchange-api.lcx.com/api/ticker")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

def get_lcxusdc_ticker(pair) {
  // GET /api/ticker
  def url = new URL("https://exchange-api.lcx.com/api/ticker")
  def connection = url.openConnection()
  connection.setRequestProperty("Content-Type", "application/json")

  def response = connection.inputStream.text
  println response
  return response
}

