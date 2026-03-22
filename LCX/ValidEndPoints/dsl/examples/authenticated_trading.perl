use strict;
use warnings;
use LWP::UserAgent;
use JSON;
use Digest::HMAC_SHA256 qw(hmac_sha256);
use MIME::Base64;


sub get_account_info {
    my () = @_;
    # GET /api/account
    my $url = 'https://exchange-api.lcx.com/api/account';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/account';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_balances {
    my () = @_;
    # GET /api/balances
    my $url = 'https://exchange-api.lcx.com/api/balances';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/balances';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_asset_balance {
    my (asset) = @_;
    # GET /api/balance
    my $url = 'https://exchange-api.lcx.com/api/balance';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/balance';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_trading_fees {
    my () = @_;
    # GET /api/fees
    my $url = 'https://exchange-api.lcx.com/api/fees';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/fees';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_open_orders {
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

sub get_order_details {
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

sub get_order_history {
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

sub get_user_trade_history {
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

# POST method not supported for perl
# PUT method not supported for perl
# DELETE method not supported for perl
# DELETE method not supported for perl
sub check_balance_workflow {
    my () = @_;
    # GET /api/balances
    my $url = 'https://exchange-api.lcx.com/api/balances';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/balances';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for perl
sub place_order_workflow {
    my (BTC/USDC) = @_;
    # GET /api/ticker
    my $url = 'https://exchange-api.lcx.com/api/ticker';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for perl
sub get_order_info {
    my (order_response) = @_;
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
sub manage_open_orders_workflow {
    my (0) = @_;
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

# Workflow: ManageOpenOrdersWorkflow (sequence)

sub get_trade_history {
    my (0) = @_;
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
# PUT method not supported for perl
# DELETE method not supported for perl
# None method not supported for perl
sub account_monitoring_workflow {
    my () = @_;
    # GET /api/balances
    my $url = 'https://exchange-api.lcx.com/api/balances';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/balances';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

# Workflow: AccountMonitoringWorkflow (sequence)

sub get_open_orders {
    my (0) = @_;
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

sub get_fees {
    my () = @_;
    # GET /api/fees
    my $url = 'https://exchange-api.lcx.com/api/fees';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/fees';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

# None method not supported for perl
