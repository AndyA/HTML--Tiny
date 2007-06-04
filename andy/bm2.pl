#!/usr/bin/perl

use strict;
use warnings;
use Benchmark qw(:all);

use lib qw/lib/;

use HTML::Tiny;

my $h = HTML::Tiny->new;

#            Rate wrapper     raw
# wrapper 12922/s      --    -27%
# raw     17612/s     36%      --

cmpthese(
    -1,
    {
        nothing => sub {
            my $url = 'http://hexten.net';
            my $x   = "<a href=\"$url\">Hexten</a>";
            # Our cheapest method call
            $h->validate_tag( 0, 'a', { href => $url } );
        },
        raw => sub {
            my $x = $h->tag( 'a', { href => 'http://hexten.net/' }, 'Hexten' );
        },
        wrapper => sub {
            my $x = $h->a( { href => 'http://hexten.net/' }, 'Hexten' );
        },
    }
);

# Baseline
#      Rate    2    1    0
# 2  9221/s   -- -32% -70%
# 1 13525/s  47%   -- -57%
# 0 31210/s 238% 131%   --

#     Rate    2    1    0
# 2 12560/s   -- -28% -59%
# 1 17454/s  39%   -- -44%
# 0 30919/s 146%  77%   --
#
# cmpthese(
#     -1,
#     {
#         '0' => sub {
#             my $x = $h->tag( 'a', 'Hexten' );
#         },
#         '1' => sub {
#             my $x = $h->tag( 'a', { href => 'http://hexten.net/' }, 'Hexten' );
#         },
#         '2' => sub {
#             my $x = $h->tag(
#                 'a',
#                 { href  => 'http://hexten.net/' },
#                 { title => 'Hexten' }, 'Hexten'
#             );
#         },
#     }
# );

