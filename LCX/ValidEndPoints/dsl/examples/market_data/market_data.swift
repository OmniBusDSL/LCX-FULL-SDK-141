import Foundation
import CommonCrypto


func fetch_all_tickers(, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/tickers
    let urlString = "https://exchange-api.lcx.com/api/tickers"
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
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {{
            print(json)
            completion(.success(json))
        }}

    }.resume()
}

func get_ticker_for_pair(pair, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {{
            completion(.success(json))
        }}

    }.resume()
}

func fetch_all_pairs(, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/pairs
    let urlString = "https://exchange-api.lcx.com/api/pairs"
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
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {{
            print(json)
            completion(.success(json))
        }}

    }.resume()
}

func get_pair_info(pair_symbol, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/pair/BTC/USDC
    let urlString = "https://exchange-api.lcx.com/api/pair/BTC/USDC"
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
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {{
            completion(.success(json))
        }}

    }.resume()
}

func get_order_book(pair, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/book
    let urlString = "https://exchange-api.lcx.com/api/book"
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
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {{
            print(json)
            completion(.success(json))
        }}

    }.resume()
}

func get_recent_trades(pair, offset, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/trades
    let urlString = "https://exchange-api.lcx.com/api/trades"
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
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {{
            completion(.success(json))
        }}

    }.resume()
}

func get_candle_data(pair, resolution, from_ts, to_ts, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /v1/market/kline
    let urlString = "https://api-kline.lcx.com/v1/market/kline"
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
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {{
            print(json)
            completion(.success(json))
        }}

    }.resume()
}

func market_overview(, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/book
    let urlString = "https://exchange-api.lcx.com/api/book"
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

# Workflow: MarketOverview (sequence)

func get_trades(, completion: @escaping (Result<[String: Any], Error>) -> Void) {
    // GET /api/trades
    let urlString = "https://exchange-api.lcx.com/api/trades"
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

# None method not supported for swift
