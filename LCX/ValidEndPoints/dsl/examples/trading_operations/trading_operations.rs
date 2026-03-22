use reqwest;
use serde_json;
use std::env;
use chrono::Utc;
use hmac::{{Hmac, Mac}};
use sha2::Sha256;
use base64::{engine::general_purpose, Engine as _};


# POST method not supported for rust
# POST method not supported for rust
# POST method not supported for rust
# PUT method not supported for rust
# PUT method not supported for rust
# PUT method not supported for rust
# DELETE method not supported for rust
# DELETE method not supported for rust
async fn get_all_open_orders(offset) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/open
    let url = "https://exchange-api.lcx.com/api/open";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/open");

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

async fn get_open_orders_for_pair(offset, pair) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/open
    let url = "https://exchange-api.lcx.com/api/open";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/open");

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

async fn get_open_orders_with_date_range(offset, pair, fromDate, toDate) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/open
    let url = "https://exchange-api.lcx.com/api/open";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/open");

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

async fn get_single_order_status(orderId) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/order
    let url = "https://exchange-api.lcx.com/api/order";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/order");

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

async fn get_complete_order_history(offset) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/orderHistory
    let url = "https://exchange-api.lcx.com/api/orderHistory";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/orderHistory");

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

async fn get_order_history_for_pair(offset, pair) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/orderHistory
    let url = "https://exchange-api.lcx.com/api/orderHistory";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/orderHistory");

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

async fn get_order_history_by_status(offset, orderStatus) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/orderHistory
    let url = "https://exchange-api.lcx.com/api/orderHistory";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/orderHistory");

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

async fn get_order_history_by_type(offset, orderType) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/orderHistory
    let url = "https://exchange-api.lcx.com/api/orderHistory";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/orderHistory");

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

async fn get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/orderHistory
    let url = "https://exchange-api.lcx.com/api/orderHistory";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/orderHistory");

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

async fn get_all_trade_history(offset) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/uHistory
    let url = "https://exchange-api.lcx.com/api/uHistory";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/uHistory");

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

async fn get_trade_history_for_pair(offset, pair) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/uHistory
    let url = "https://exchange-api.lcx.com/api/uHistory";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/uHistory");

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

async fn get_trade_history_by_date_range(offset, pair, fromDate, toDate) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/uHistory
    let url = "https://exchange-api.lcx.com/api/uHistory";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/uHistory");

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

async fn simple_buy_workflow(order_result) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/order
    let url = "https://exchange-api.lcx.com/api/order";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/order");

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

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for rust
# PUT method not supported for rust
async fn get_history(0, BTC/USDC) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/orderHistory
    let url = "https://exchange-api.lcx.com/api/orderHistory";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/orderHistory");

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

async fn get_trades(0, BTC/USDC) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/uHistory
    let url = "https://exchange-api.lcx.com/api/uHistory";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/uHistory");

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

# None method not supported for rust
# DELETE method not supported for rust
async fn confirm_cancelled(first_order_from_list) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/order
    let url = "https://exchange-api.lcx.com/api/order";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/order");

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

# None method not supported for rust
