use strict;
use warnings;
use LWP::UserAgent;
use JSON;
use Digest::HMAC_SHA256 qw(hmac_sha256);
use MIME::Base64;


# POST method not supported for perl
# POST method not supported for perl
# POST method not supported for perl
# PUT method not supported for perl
# PUT method not supported for perl
# PUT method not supported for perl
# DELETE method not supported for perl
# DELETE method not supported for perl
sub get_all_open_orders {
    my (offset) = @_;
    # GET /api/open
    my $url = 'https://exchange-api.lcx.com/api/open';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/open';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_open_orders_for_pair {
    my (offset, pair) = @_;
    # GET /api/open
    my $url = 'https://exchange-api.lcx.com/api/open';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/open';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_open_orders_with_date_range {
    my (offset, pair, fromDate, toDate) = @_;
    # GET /api/open
    my $url = 'https://exchange-api.lcx.com/api/open';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/open';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_single_order_status {
    my (orderId) = @_;
    # GET /api/order
    my $url = 'https://exchange-api.lcx.com/api/order';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/order';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_complete_order_history {
    my (offset) = @_;
    # GET /api/orderHistory
    my $url = 'https://exchange-api.lcx.com/api/orderHistory';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/orderHistory';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_order_history_for_pair {
    my (offset, pair) = @_;
    # GET /api/orderHistory
    my $url = 'https://exchange-api.lcx.com/api/orderHistory';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/orderHistory';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_order_history_by_status {
    my (offset, orderStatus) = @_;
    # GET /api/orderHistory
    my $url = 'https://exchange-api.lcx.com/api/orderHistory';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/orderHistory';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_order_history_by_type {
    my (offset, orderType) = @_;
    # GET /api/orderHistory
    my $url = 'https://exchange-api.lcx.com/api/orderHistory';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/orderHistory';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_filtered_order_history {
    my (offset, pair, fromDate, toDate, side, orderStatus, orderType) = @_;
    # GET /api/orderHistory
    my $url = 'https://exchange-api.lcx.com/api/orderHistory';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/orderHistory';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_all_trade_history {
    my (offset) = @_;
    # GET /api/uHistory
    my $url = 'https://exchange-api.lcx.com/api/uHistory';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/uHistory';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_trade_history_for_pair {
    my (offset, pair) = @_;
    # GET /api/uHistory
    my $url = 'https://exchange-api.lcx.com/api/uHistory';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/uHistory';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_trade_history_by_date_range {
    my (offset, pair, fromDate, toDate) = @_;
    # GET /api/uHistory
    my $url = 'https://exchange-api.lcx.com/api/uHistory';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/uHistory';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub simple_buy_workflow {
    my (order_result) = @_;
    # GET /api/order
    my $url = 'https://exchange-api.lcx.com/api/order';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/order';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for perl
# PUT method not supported for perl
sub get_history {
    my (0, BTC/USDC) = @_;
    # GET /api/orderHistory
    my $url = 'https://exchange-api.lcx.com/api/orderHistory';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/orderHistory';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_trades {
    my (0, BTC/USDC) = @_;
    # GET /api/uHistory
    my $url = 'https://exchange-api.lcx.com/api/uHistory';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/uHistory';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

# None method not supported for perl
# DELETE method not supported for perl
sub confirm_cancelled {
    my (first_order_from_list) = @_;
    # GET /api/order
    my $url = 'https://exchange-api.lcx.com/api/order';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/order';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

# None method not supported for perl
