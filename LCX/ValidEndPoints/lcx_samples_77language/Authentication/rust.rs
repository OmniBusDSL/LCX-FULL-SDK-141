use reqwest::Client;

#[tokio::main]
async fn main() {
    let client = Client::new();
    let res = client.post("https://exchange-api.lcx.com")
        .send().await.unwrap();
    println!("{}", res.text().await.unwrap());
}
