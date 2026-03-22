import Foundation
import CommonCrypto


# POST method not supported for swift
# POST method not supported for swift
# POST method not supported for swift
# PUT method not supported for swift
# PUT method not supported for swift
# PUT method not supported for swift
# DELETE method not supported for swift
# DELETE method not supported for swift
func get_all_open_orders(offset, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/open
    let urlString = "https://exchange-api.lcx.com/api/open"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/open"

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

func get_open_orders_for_pair(offset, pair, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/open
    let urlString = "https://exchange-api.lcx.com/api/open"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/open"

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

func get_open_orders_with_date_range(offset, pair, fromDate, toDate, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/open
    let urlString = "https://exchange-api.lcx.com/api/open"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/open"

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

func get_single_order_status(orderId, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/order
    let urlString = "https://exchange-api.lcx.com/api/order"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/order"

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

func get_complete_order_history(offset, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/orderHistory
    let urlString = "https://exchange-api.lcx.com/api/orderHistory"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/orderHistory"

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

func get_order_history_for_pair(offset, pair, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/orderHistory
    let urlString = "https://exchange-api.lcx.com/api/orderHistory"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/orderHistory"

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

func get_order_history_by_status(offset, orderStatus, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/orderHistory
    let urlString = "https://exchange-api.lcx.com/api/orderHistory"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/orderHistory"

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

func get_order_history_by_type(offset, orderType, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/orderHistory
    let urlString = "https://exchange-api.lcx.com/api/orderHistory"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/orderHistory"

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

func get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/orderHistory
    let urlString = "https://exchange-api.lcx.com/api/orderHistory"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/orderHistory"

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

func get_all_trade_history(offset, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/uHistory
    let urlString = "https://exchange-api.lcx.com/api/uHistory"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/uHistory"

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

func get_trade_history_for_pair(offset, pair, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/uHistory
    let urlString = "https://exchange-api.lcx.com/api/uHistory"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/uHistory"

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

func get_trade_history_by_date_range(offset, pair, fromDate, toDate, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/uHistory
    let urlString = "https://exchange-api.lcx.com/api/uHistory"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/uHistory"

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

func simple_buy_workflow(order_result, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/order
    let urlString = "https://exchange-api.lcx.com/api/order"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/order"

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

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for swift
# PUT method not supported for swift
func get_history(0, BTC/USDC, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/orderHistory
    let urlString = "https://exchange-api.lcx.com/api/orderHistory"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/orderHistory"

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

func get_trades(0, BTC/USDC, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/uHistory
    let urlString = "https://exchange-api.lcx.com/api/uHistory"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/uHistory"

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

# None method not supported for swift
# DELETE method not supported for swift
func confirm_cancelled(first_order_from_list, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/order
    let urlString = "https://exchange-api.lcx.com/api/order"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/order"

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

# None method not supported for swift
