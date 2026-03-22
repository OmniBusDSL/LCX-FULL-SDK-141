#!/usr/bin/perl
use LWP::UserAgent;

my $ua = LWP::UserAgent->new;
my $response = $ua->get('https://exchange-api.lcx.com/api/balances');
print $response->decoded_content;
