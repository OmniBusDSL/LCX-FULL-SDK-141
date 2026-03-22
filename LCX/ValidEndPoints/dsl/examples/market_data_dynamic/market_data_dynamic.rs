use reqwest;
use serde_json;
use std::env;
use chrono::Utc;
use hmac::{{Hmac, Mac}};
use sha2::Sha256;
use base64::{engine::general_purpose, Engine as _};


async fn fetch_all_pairs_data(pair) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/ticker
    let url = "https://exchange-api.lcx.com/api/ticker";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
    println!("{{}}", body);
    Ok(serde_json::from_str(&body)?)

}

# Workflow: FetchAllPairsData (sequence)

async fn get_ethusdc_ticker(pair) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/ticker
    let url = "https://exchange-api.lcx.com/api/ticker";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
    println!("{{}}", body);
    Ok(serde_json::from_str(&body)?)

}

async fn get_lcxusdc_ticker(pair) -> Result<serde_json::Value, Box<dyn std::error::Error>>
{
    // GET /api/ticker
    let url = "https://exchange-api.lcx.com/api/ticker";
    let client = reqwest::Client::new();

    let response = client.get(url)
        .header("Content-Type", "application/json")
        .send()
        .await?;

    let body = response.text().await?;
    println!("{{}}", body);
    Ok(serde_json::from_str(&body)?)

}

