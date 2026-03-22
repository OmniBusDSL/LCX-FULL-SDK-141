use reqwest::Client;

#[tokio::main]
async fn main() {
    let client = Client::new();
    let res = client.get("https://exchange-api.lcx.com/api/balances")
        .send().await.unwrap();
    println!("{}", res.text().await.unwrap());
}
