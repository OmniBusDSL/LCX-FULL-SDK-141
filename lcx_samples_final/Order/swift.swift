import Foundation

let url = URL(string: "https://exchange-api.lcx.com/api/order")!
let task = URLSession.shared.dataTask(with: url) { data, _, _ in
    if let data = data {
        print(String(data: data, encoding: .utf8)!)
    }
}
task.resume()
RunLoop.main.run()
