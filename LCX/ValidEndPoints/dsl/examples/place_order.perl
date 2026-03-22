use strict;
use warnings;
use LWP::UserAgent;
use JSON;
use Digest::HMAC_SHA256 qw(hmac_sha256);
use MIME::Base64;


# POST method not supported for perl
sub check_order_status {
    my (order_id) = @_;
    # GET /api/trading/order/{order_id}
    my $url = 'https://exchange-api.lcx.com/api/trading/order/{order_id}';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/trading/order/{order_id}';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}

# POST method not supported for perl
sub complete_order_flow {
    my (currency) = @_;
    # GET /api/account/balance
    my $url = 'https://exchange-api.lcx.com/api/account/balance';
    my $ua = LWP::UserAgent->new;
    my $api_key = $ENV{LCX_API_KEY};
    my $api_secret = $ENV{LCX_API_SECRET};
    my $timestamp = int(time() * 1000);
    my $message = $timestamp . 'GET' . '/api/account/balance';
    my $signature = encode_base64(hmac_sha256($message, $api_secret));

    my $response = $ua->get($url);

    if ($response->is_success) {

    } else {
        die "Error: " . $response->status_line;
    }
}



# POST method not supported for perl
# None method not supported for perl
# None method not supported for perl
# None method not supported for perl
# None method not supported for perl
# None method not supported for perl
# None method not supported for perl
# None method not supported for perl
# None method not supported for perl
# None method not supported for perl
# None method not supported for perl
