use reqwest;
use serde_json;
use std::env;
use chrono::Utc;
use hmac::{{Hmac, Mac}};
use sha2::Sha256;
use base64::{engine::general_purpose, Engine as _};


async fn fetch_all_tickers() -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/tickers
    let url = "https://exchange-api.lcx.com/api/tickers";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
    println!("{{}}", body);
    Ok(serde_json::from_str(&body)?)

}

async fn get_ticker_for_pair(pair) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/ticker
    let url = "https://exchange-api.lcx.com/api/ticker";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
    Ok(serde_json::from_str(&body)?)

}

async fn fetch_all_pairs() -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/pairs
    let url = "https://exchange-api.lcx.com/api/pairs";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
    println!("{{}}", body);
    Ok(serde_json::from_str(&body)?)

}

async fn get_pair_info(pair_symbol) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/pair/BTC/USDC
    let url = "https://exchange-api.lcx.com/api/pair/BTC/USDC";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
    Ok(serde_json::from_str(&body)?)

}

async fn get_order_book(pair) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/book
    let url = "https://exchange-api.lcx.com/api/book";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
    println!("{{}}", body);
    Ok(serde_json::from_str(&body)?)

}

async fn get_recent_trades(pair, offset) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/trades
    let url = "https://exchange-api.lcx.com/api/trades";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
    Ok(serde_json::from_str(&body)?)

}

async fn get_candle_data(pair, resolution, from_ts, to_ts) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /v1/market/kline
    let url = "https://api-kline.lcx.com/v1/market/kline";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
    println!("{{}}", body);
    Ok(serde_json::from_str(&body)?)

}

async fn market_overview() -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/book
    let url = "https://exchange-api.lcx.com/api/book";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;

}

# Workflow: MarketOverview (sequence)

async fn get_trades() -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/trades
    let url = "https://exchange-api.lcx.com/api/trades";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;

}

# None method not supported for rust
