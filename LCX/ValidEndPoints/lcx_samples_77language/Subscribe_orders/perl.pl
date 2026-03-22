#!/usr/bin/perl
use LWP::UserAgent;

my $ua = LWP::UserAgent->new;
my $response = $ua->get('https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}');
print $response->decoded_content;
