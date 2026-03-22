import Foundation
import CommonCrypto


func fetch_all_pairs_data(pair, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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
            print(json)
            completion(.success(json))
        }}

    }.resume()
}

# Workflow: FetchAllPairsData (sequence)

func get_ethusdc_ticker(pair, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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
            print(json)
            completion(.success(json))
        }}

    }.resume()
}

func get_lcxusdc_ticker(pair, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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
            print(json)
            completion(.success(json))
        }}

    }.resume()
}

