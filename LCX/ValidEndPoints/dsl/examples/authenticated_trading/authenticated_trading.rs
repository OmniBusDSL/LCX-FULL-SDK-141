use reqwest;
use serde_json;
use std::env;
use chrono::Utc;
use hmac::{{Hmac, Mac}};
use sha2::Sha256;
use base64::{engine::general_purpose, Engine as _};


async fn get_account_info() -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/account
    let url = "https://exchange-api.lcx.com/api/account";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/account");

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

async fn get_balances() -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/balances
    let url = "https://exchange-api.lcx.com/api/balances";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/balances");

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

async fn get_asset_balance(asset) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/balance
    let url = "https://exchange-api.lcx.com/api/balance";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/balance");

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

async fn get_trading_fees() -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/fees
    let url = "https://exchange-api.lcx.com/api/fees";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/fees");

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

async fn get_open_orders(offset, pair) -> Result<serde_json::Value, Box<dyn std::error::Error>>
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

async fn get_order_details(orderId) -> Result<serde_json::Value, Box<dyn std::error::Error>>
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

async fn get_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) -> Result<serde_json::Value, Box<dyn std::error::Error>>
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

async fn get_user_trade_history(offset, pair, fromDate, toDate) -> Result<serde_json::Value, Box<dyn std::error::Error>>
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

# POST method not supported for rust
# PUT method not supported for rust
# DELETE method not supported for rust
# DELETE method not supported for rust
async fn check_balance_workflow() -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/balances
    let url = "https://exchange-api.lcx.com/api/balances";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/balances");

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

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for rust
async fn place_order_workflow(BTC/USDC) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/ticker
    let url = "https://exchange-api.lcx.com/api/ticker";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;

}

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for rust
async fn get_order_info(order_response) -> Result<serde_json::Value, Box<dyn std::error::Error>>
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
async fn manage_open_orders_workflow(0) -> Result<serde_json::Value, Box<dyn std::error::Error>>
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

# Workflow: ManageOpenOrdersWorkflow (sequence)

async fn get_trade_history(0) -> Result<serde_json::Value, Box<dyn std::error::Error>>
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
# PUT method not supported for rust
# DELETE method not supported for rust
# None method not supported for rust
async fn account_monitoring_workflow() -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/balances
    let url = "https://exchange-api.lcx.com/api/balances";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/balances");

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

# Workflow: AccountMonitoringWorkflow (sequence)

async fn get_open_orders(0) -> Result<serde_json::Value, Box<dyn std::error::Error>>
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

}

async fn get_fees() -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/fees
    let url = "https://exchange-api.lcx.com/api/fees";
    let client = reqwest::Client::new();
    let api_key = env::var("LCX_API_KEY")?;
    let api_secret = env::var("LCX_API_SECRET")?;
    let timestamp = (Utc::now().timestamp_millis()).to_string();
    let message = format!("{}{}{}", timestamp, "GET", "/api/fees");

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
