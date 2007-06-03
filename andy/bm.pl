#!/usr/bin/perl

use strict;
use warnings;
use Benchmark qw(:all);
use Scalar::Util qw/blessed/;

$| = 1;

sub _orig {
    my $obj = shift;
    # Flatten array refs...
    return join '', @$obj
      if 'ARRAY' eq ref $obj;
    # ...stringify objects...
    return $obj->as_string
      if blessed $obj && $obj->can( 'as_string' );
    # ...default stringification
    return "$obj";
}

sub _str {
    my $obj = shift;
    if ( my $ref = ref $obj ) {
        # Flatten array refs...
        return join '', @$obj
          if 'ARRAY' eq $ref;
        # ...stringify objects...
        my $str = eval { $obj->as_string };
        return $str unless $@;
    }

    # ...default stringification
    return "$obj";
}

sub _old_str {
    my $obj = shift;
    # Flatten array refs...
    return join '', @$obj
      if 'ARRAY' eq ref $obj;
    # ...stringify objects...
    my $str = eval { $obj->as_string };
    return $str unless $@;
    # ...default stringification
    return "$obj";
}

package stringy;
sub new { bless {}, shift }
sub as_string { 'A string' }

package main;

my $ar = [ 'one', 'two', 'three' ];
my $obj = stringy->new;

for my $spec (
    [ 'string', 'This is just a normal string' ],
    [ 'array',  $ar ],
    [ 'object', $obj ]
  ) {
    my ( $desc, $in ) = @$spec;
    cmpthese(
        -1,
        {
            "$desc: orig"     => sub { my $x = _orig( $in ) },
            "$desc: released" => sub { my $x = _old_str( $in ) },
            "$desc: new"      => sub { my $x = _str( $in ) },
        }
    );

}
