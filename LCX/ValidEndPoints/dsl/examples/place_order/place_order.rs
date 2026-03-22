use reqwest;
use serde_json;
use std::env;
use chrono::Utc;
use hmac::{{Hmac, Mac}};
use sha2::Sha256;
use base64::{engine::general_purpose, Engine as _};


# POST method not supported for rust
async fn check_order_status(order_id) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/trading/order/{order_id}
    let url = "https://exchange-api.lcx.com/api/trading/order/{order_id}";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/trading/order/{order_id}");

    type HmacSha256 = Hmac<Sha256>;
    let mut mac = HmacSha256::new_from_slice(api_secret.as_bytes())?;
    mac.update(message.as_bytes());
    let signature = general_purpose::STANDARD.encode(mac.finalize().into_bytes());

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
    Ok(serde_json::from_str(&body)?)

}

# POST method not supported for rust
async fn complete_order_flow(currency) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/account/balance
    let url = "https://exchange-api.lcx.com/api/account/balance";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/account/balance");

    type HmacSha256 = Hmac<Sha256>;
    let mut mac = HmacSha256::new_from_slice(api_secret.as_bytes())?;
    mac.update(message.as_bytes());
    let signature = general_purpose::STANDARD.encode(mac.finalize().into_bytes());

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;

}



# POST method not supported for rust
# None method not supported for rust
# None method not supported for rust
# None method not supported for rust
# None method not supported for rust
# None method not supported for rust
# None method not supported for rust
# None method not supported for rust
# None method not supported for rust
# None method not supported for rust
# None method not supported for rust
