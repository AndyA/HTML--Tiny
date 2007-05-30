use strict;
use warnings;
use HTML::Simple;
use Test::More tests => 27;

ok my $h = HTML::Simple->new, 'Create succeeded';

# No attributes

is $h->open( 'b' ),    '<b>',    'simple open OK';
is $h->close( 'b' ),   '</b>',   'simple close OK';
is $h->closed( 'br' ), '<br />', 'simple closed OK';

# Tag options

is $h->tag( 'b', '' ), '<b></b>', 'simple tag OK';
is $h->tag( 'b', 'a', 'b' ), '<b>a</b><b>b</b>', 'multi tag OK';
is $h->tag( 'b', [ 'a', 'b' ] ), '<b>ab</b>', 'grouped tag OK';
is $h->tag( 'p', $h->tag( 'b', 'a', 'b' ) ), '<p><b>a</b></p><p><b>b</b></p>',
  'nested multi tag OK';
is $h->tag( 'p', $h->tag( 'b', [ 'a', 'b' ] ) ), '<p><b>ab</b></p>',
  'nested grouped tag OK';

# Attributes

is $h->open( 'p', { class => 'normal' } ), '<p class="normal">',
  'simple attr OK';
is $h->open( 'p', { class => 'normal', style => undef } ), '<p class="normal">',
  'skip undef attr OK';
is $h->tag( 'p', { class => 'small' }, 'a', 'b' ),
  '<p class="small">a</p><p class="small">b</p>', 'multi w/ attr OK';
is $h->tag( 'p', { class => 'small' }, 'a', { class => undef }, 'b' ),
  '<p class="small">a</p><p>b</p>', 'change attr OK';

# Stringification

package T::Obj;
sub new { bless {}, shift }
sub as_string { 'an object' }

package main;

my $obj = T::Obj->new;
is $h->tag( 'p', $obj ), '<p>an object</p>', 'stringification OK';

# URL encoding, decoding

is $h->url_encode( ' <hello> ' ),     '+%3chello%3e+', 'url_encode OK';
is $h->url_decode( '+%3chello%3e+' ), ' <hello> ',     'url_decode OK';

# Query encoding

is $h->query_encode( { a => 1, b => 2 } ), 'a=1&b=2', 'simple query_encode OK';
is $h->query_encode( { a => 1, b => 2, '&' => '<html>' } ),
  '%26=%3chtml%3e&a=1&b=2', 'escaped query_encode OK';

# Entity encoding

is $h->entity_encode( '<>\'"&' ), '&lt;&gt;&apos;&quot;&amp;',
  'entity_encode OK';

# JSON encoding

is $h->json_encode( 1 ), '1', 'json number OK';
is $h->json_encode( "\x00\x01\x02\x03\x04\x05\x06\x07"
      . "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
      . "\x10\x11\x12\x13\x14\x15\x16\x17"
      . "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f" ),
  "\"\\z\\x01\\x02\\x03\\x04\\x05\\x06\\a"
  . "\\x08\\t\\n\\v\\f\\r\\x0e\\x0f"
  . "\\x10\\x11\\x12\\x13\\x14\\x15\\x16\\x17"
  . "\\x18\\x19\\x1a\\e\\x1c\\x1d\\x1e\\x1f\"", 'json escapes OK';
is $h->json_encode( [] ), '[]', 'json empty array OK';
is $h->json_encode( {} ), '{}', 'json empty hash OK';
is $h->json_encode( [ 1, 2, 3 ] ), '[1,2,3]', 'json simple array OK';
is $h->json_encode( { a => 1, b => 2 } ), '{"a":1,"b":2}',
  'json simple hash OK';
is $h->json_encode( { ar => [ 1, 2, 3, { a => 1, b => 2 } ] } ),
  '{"ar":[1,2,3,{"a":1,"b":2}]}', 'json complex OK';
is $h->json_encode( { obj => $obj } ), '{"obj":"an object"}', 'json stringification OK';
