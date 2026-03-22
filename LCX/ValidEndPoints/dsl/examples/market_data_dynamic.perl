use strict;
use warnings;
use LWP::UserAgent;
use JSON;
use Digest::HMAC_SHA256 qw(hmac_sha256);
use MIME::Base64;


sub fetch_all_pairs_data {
    my (pair) = @_;
    # GET /api/ticker
    my $url = 'https://exchange-api.lcx.com/api/ticker';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {
        my $data = decode_json($response->content);
        print JSON->new->pretty->encode($data);

    } else {
        die "Error: " . $response->status_line;
    }
}

# Workflow: FetchAllPairsData (sequence)

sub get_ethusdc_ticker {
    my (pair) = @_;
    # GET /api/ticker
    my $url = 'https://exchange-api.lcx.com/api/ticker';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {
        my $data = decode_json($response->content);
        print JSON->new->pretty->encode($data);

    } else {
        die "Error: " . $response->status_line;
    }
}

sub get_lcxusdc_ticker {
    my (pair) = @_;
    # GET /api/ticker
    my $url = 'https://exchange-api.lcx.com/api/ticker';
    my $ua = LWP::UserAgent->new;

    my $response = $ua->get($url);

    if ($response->is_success) {
        my $data = decode_json($response->content);
        print JSON->new->pretty->encode($data);

    } else {
        die "Error: " . $response->status_line;
    }
}

