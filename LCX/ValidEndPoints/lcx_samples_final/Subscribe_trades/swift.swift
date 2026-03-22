import Foundation

let url = URL(string: "https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}")!
let task = URLSession.shared.dataTask(with: url) { data, _, _ in
    if let data = data {
        print(String(data: data, encoding: .utf8)!)
    }
}
task.resume()
RunLoop.main.run()
