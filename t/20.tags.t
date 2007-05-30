use strict;
use warnings;
use HTML::Simple;
use Test::More tests => 6;

ok my $h = HTML::Simple->new, 'Create succeeded';

is $h->br, '<br />', 'br OK';
is $h->input( { name => 'myfield', type => 'text' } ),
  '<input name="myfield" type="text" />', 'input OK';
is $h->p( 'hello, world' ), '<p>hello, world</p>', 'p OK';

is $h->a( { href => 'http://hexten.net', title => 'Hexten' }, 'Hexten' ),
  '<a href="http://hexten.net" title="Hexten">Hexten</a>', 'a OK';

is $h->html(
    [
        $h->head( $h->title( 'Sample page' ) ),
        $h->body(
            [
                $h->h1( { class => 'main' }, 'Sample page' ),
                $h->p( 'Hello, World', { class => 'detail' }, 'Second para' )
            ]
        )
    ]
  ),
  '<html><head><title>Sample page</title>'
  . '</head><body><h1 class="main">Sample page</h1>'
  . '<p>Hello, World</p><p class="detail">Second para</p>'
  . '</body></html>', 'complex HTML OK';
