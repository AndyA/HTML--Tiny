#!/usr/bin/perl

use strict;
use warnings;
use Scalar::Util qw/refaddr/;

$| = 1;

use constant EMPTY => \my($anon_scalar);
use constant FULL  => \my($anon_scalar);

print EMPTY == FULL ? 'yes' : 'no', "\n";
print refaddr EMPTY == refaddr FULL ? 'yes' : 'no', "\n";
print EMPTY == EMPTY ? 'yes' : 'no', "\n";
print refaddr EMPTY == refaddr EMPTY ? 'yes' : 'no', "\n";
