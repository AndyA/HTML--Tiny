#!/usr/bin/perl

use strict;
use warnings;
use Benchmark qw(:all);
use Scalar::Util qw/blessed/;

$| = 1;

sub _orig_str {
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

sub _recent_str {
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

sub _new_str {
    my $obj = shift;
    if ( my $ref = ref $obj ) {
        # Flatten array refs...
        return join '', map { _new_str( $_ ) } @$obj
          if 'ARRAY' eq $ref;
        # ...stringify objects...
        my $str = eval { $obj->as_string };
        return $str unless $@;
    }

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
            "$desc: original" => sub { my $x = _orig_str( $in ) },
            "$desc: released" => sub { my $x = _old_str( $in ) },
            "$desc: recent"   => sub { my $x = _recent_str( $in ) },
            "$desc: new"      => sub { my $x = _new_str( $in ) },
        }
    );

}
