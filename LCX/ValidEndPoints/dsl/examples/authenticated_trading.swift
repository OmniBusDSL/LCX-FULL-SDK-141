import Foundation
import CommonCrypto


func get_account_info(, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/account
    let urlString = "https://exchange-api.lcx.com/api/account"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/account"

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

func get_balances(, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/balances
    let urlString = "https://exchange-api.lcx.com/api/balances"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/balances"

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

func get_asset_balance(asset, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/balance
    let urlString = "https://exchange-api.lcx.com/api/balance"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/balance"

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

func get_trading_fees(, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/fees
    let urlString = "https://exchange-api.lcx.com/api/fees"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/fees"

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

func get_open_orders(offset, pair, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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

func get_order_details(orderId, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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

func get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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

func get_user_trade_history(offset, pair, fromDate, toDate, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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

# POST method not supported for swift
# PUT method not supported for swift
# DELETE method not supported for swift
# DELETE method not supported for swift
func check_balance_workflow(, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/balances
    let urlString = "https://exchange-api.lcx.com/api/balances"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/balances"

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

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for swift
func place_order_workflow(BTC/USDC, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/ticker
    let urlString = "https://exchange-api.lcx.com/api/ticker"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")


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

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for swift
func get_order_info(order_response, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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
func manage_open_orders_workflow(0, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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

# Workflow: ManageOpenOrdersWorkflow (sequence)

func get_trade_history(0, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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
# PUT method not supported for swift
# DELETE method not supported for swift
# None method not supported for swift
func account_monitoring_workflow(, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/balances
    let urlString = "https://exchange-api.lcx.com/api/balances"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/balances"

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

# Workflow: AccountMonitoringWorkflow (sequence)

func get_open_orders(0, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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

    }.resume()
}

func get_fees(, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/fees
    let urlString = "https://exchange-api.lcx.com/api/fees"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0)))
        return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let apiKey = ProcessInfo.processInfo.environment["LCX_API_KEY"] ?? ""
    let apiSecret = ProcessInfo.processInfo.environment["LCX_API_SECRET"] ?? ""
    let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    let message = timestamp + "GET" + "/api/fees"

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
