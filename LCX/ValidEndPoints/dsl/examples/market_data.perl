use strict;
use warnings;
use LWP::UserAgent;
use JSON;
use Digest::HMAC_SHA256 qw(hmac_sha256);
use MIME::Base64;


sub fetch_all_tickers {
    my () = @_;
    # GET /api/tickers
    my $url = 'https://exchange-api.lcx.com/api/tickers';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {
        my $data = decode_json($response->content);
        print JSON->new->pretty->encode($data);

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_ticker_for_pair {
    my (pair) = @_;
    # GET /api/ticker
    my $url = 'https://exchange-api.lcx.com/api/ticker';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub fetch_all_pairs {
    my () = @_;
    # GET /api/pairs
    my $url = 'https://exchange-api.lcx.com/api/pairs';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {
        my $data = decode_json($response->content);
        print JSON->new->pretty->encode($data);

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_pair_info {
    my (pair_symbol) = @_;
    # GET /api/pair/BTC/USDC
    my $url = 'https://exchange-api.lcx.com/api/pair/BTC/USDC';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_order_book {
    my (pair) = @_;
    # GET /api/book
    my $url = 'https://exchange-api.lcx.com/api/book';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {
        my $data = decode_json($response->content);
        print JSON->new->pretty->encode($data);

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_recent_trades {
    my (pair, offset) = @_;
    # GET /api/trades
    my $url = 'https://exchange-api.lcx.com/api/trades';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_candle_data {
    my (pair, resolution, from_ts, to_ts) = @_;
    # GET /v1/market/kline
    my $url = 'https://api-kline.lcx.com/v1/market/kline';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {
        my $data = decode_json($response->content);
        print JSON->new->pretty->encode($data);

    } else {
        die "Error: " . $response->status_line;
    }
}

sub market_overview {
    my () = @_;
    # GET /api/book
    my $url = 'https://exchange-api.lcx.com/api/book';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

# Workflow: MarketOverview (sequence)

sub get_trades {
    my () = @_;
    # GET /api/trades
    my $url = 'https://exchange-api.lcx.com/api/trades';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

# None method not supported for perl
