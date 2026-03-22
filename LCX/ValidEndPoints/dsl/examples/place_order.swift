import Foundation
import CommonCrypto


# POST method not supported for swift
func check_order_status(order_id, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/trading/order/{order_id}
    let urlString = "https://exchange-api.lcx.com/api/trading/order/{order_id}"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/trading/order/{order_id}"

    var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    message.withCString { messagePtr in
        _ = CC_HMAC(CCHmacAlgorithm(kCCHmacAlgSHA256), apiSecret, apiSecret.count, messagePtr, strlen(messagePtr), &digest, nil)
    }
    let signature = Data(digest).base64EncodedString()


    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data else {
            completion(.failure(NSError(domain: "No data", code: 0)))
            return
        }
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {{
            completion(.success(json))
        }}

    }.resume()
}

# POST method not supported for swift
func complete_order_flow(currency, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/account/balance
    let urlString = "https://exchange-api.lcx.com/api/account/balance"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/account/balance"

    var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    message.withCString { messagePtr in
        _ = CC_HMAC(CCHmacAlgorithm(kCCHmacAlgSHA256), apiSecret, apiSecret.count, messagePtr, strlen(messagePtr), &digest, nil)
    }
    let signature = Data(digest).base64EncodedString()


    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data else {
            completion(.failure(NSError(domain: "No data", code: 0)))
            return
        }

    }.resume()
}



# POST method not supported for swift
# None method not supported for swift
# None method not supported for swift
# None method not supported for swift
# None method not supported for swift
# None method not supported for swift
# None method not supported for swift
# None method not supported for swift
# None method not supported for swift
# None method not supported for swift
# None method not supported for swift
