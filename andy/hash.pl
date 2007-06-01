#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

$| = 1;

# my @l = ( { a => 'hash' }, ['array'], { another => 'hash' } );
#
# my %p = map { %$_ } grep { 'HASH' eq ref $_ } @l;
#
# my (@args, @attr);
# push( @{ 'HASH' eq ref $_ ? \@args : \@attr }, $_ ) for @l;
#
# print Dumper( \%p );
# print Dumper( \@args );
# print Dumper( \@attr );

my %pog = (
    say   => 'hello',
    wave  => 'goodbye',
    would => 'should',
    could => 'did'
);

my $pr = \%pog;

delete @{$pr}{qw(say would)};

print Dumper(\$pr);