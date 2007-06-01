use strict;
use warnings;
use HTML::Tiny;
use Test::More tests => 13;

ok my $h = HTML::Tiny->new, 'Create succeeded';

is $h->br, '<br />', 'br OK';
is $h->input( { name => 'myfield', type => 'text' } ),
  '<input name="myfield" type="text" />', 'input OK';
is $h->img( { src => 'pic.jpg' } ), '<img src="pic.jpg" />', 'img OK';
is $h->p( 'hello, world' ), "<p>hello, world</p>\n", 'p OK';

is $h->a( { href => 'http://hexten.net', title => 'Hexten' }, 'Hexten' ),
  '<a href="http://hexten.net" title="Hexten">Hexten</a>', 'a OK';

is $h->textarea(), '<textarea></textarea>', 'empty tag OK';

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
  "<html><head><title>Sample page</title>"
  . "</head>\n<body><h1 class=\"main\">Sample page</h1>"
  . "<p>Hello, World</p>\n<p class=\"detail\">Second para</p>\n"
  . "</body>\n</html>\n", 'complex HTML OK';

# Open / closed

$h->set_open(qw(br hr));
is $h->br, '<br></br>', 'open br OK';
is $h->hr, '<hr></hr>', 'open br OK';
$h->set_closed(qw(br p));
is $h->br, '<br />', 'closed br OK';
is $h->hr, '<hr></hr>', 'open br OK';
is $h->p, "<p />\n", 'closed p OK';
