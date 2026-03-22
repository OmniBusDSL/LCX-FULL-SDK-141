use reqwest::Client;

#[tokio::main]
async fn main() {
    let client = Client::new();
    let res = client.get("https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}")
        .send().await.unwrap();
    println!("{}", res.text().await.unwrap());
}
