#!/usr/bin/perl

use strict;
#use warnings;
use Data::Dumper;

#print Dumper(\%Data::Dumper::);

*Pok:: = *Data::Dumper::;

my @dd = keys %Data::Dumper::;
delete $Data::Dumper::{$_} for @dd;

my $x = { a => 1, b => 2 };

my $dd = Pok->new( [$x], [qw($x)] );
print $dd->Dump;

# print Dumper(\%Pok::);
