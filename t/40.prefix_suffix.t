use strict;
use HTML::Tiny;
use Test::More tests => 7;

ok my $h = HTML::Tiny->new, 'Create succeeded';

is $h->p( 'a', 'b' ), "<p>a</p>\n<p>b</p>\n", 'default p OK';
is $h->div( 'a', 'b' ), "<div>a</div>\n<div>b</div>\n", 'default div OK';

$h->set_prefix( '.pre.', qw(p div) );

is $h->p( 'a', 'b' ), ".pre.<p>a</p>\n.pre.<p>b</p>\n", 'default p OK';
is $h->div( 'a', 'b' ), ".pre.<div>a</div>\n.pre.<div>b</div>\n",
  'default div OK';

$h->set_suffix( '.suf.', qw(p) );

is $h->p( 'a', 'b' ), ".pre.<p>a</p>.suf..pre.<p>b</p>.suf.", 'default p OK';
is $h->div( 'a', 'b' ), ".pre.<div>a</div>\n.pre.<div>b</div>\n",
  'default div OK';
