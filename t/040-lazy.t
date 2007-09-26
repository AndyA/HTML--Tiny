use strict;
use HTML::Tiny;
use Test::More tests => 9;

ok my $h = HTML::Tiny->new, 'Create succeeded';

is $h->stringify( [ \'br' ] ), '<br />', 'br OK';
is $h->stringify( [ \'input', { name => 'myfield', type => 'text' } ] ),
  '<input name="myfield" type="text" />', 'input OK';
is $h->stringify( [ \'img', { src => 'pic.jpg' } ] ), '<img src="pic.jpg" />',
  'img OK';
is $h->stringify( [ \'p', 'hello, world' ] ), "<p>hello, world</p>\n", 'p OK';

is $h->stringify(
    [ \'a', { href => 'http://hexten.net', title => 'Hexten' }, 'Hexten' ] ),
  '<a href="http://hexten.net" title="Hexten">Hexten</a>', 'a OK';

is $h->stringify( [ \'textarea' ] ), '<textarea></textarea>', 'empty tag OK';

is $h->stringify(
    [
        \'table',
        [
            \'tr',
            [ \'th', 'Name',     'Score', 'Position' ],
            [ \'td', 'Therese',  90,      1 ],
            [ \'td', 'Chrissie', 85,      2 ],
            [ \'td', 'Andy',     50,      3 ]
        ]
    ]
  ),
  "<table><tr><th>Name</th><th>Score</th><th>Position</th></tr>\n"
  . "<tr><td>Therese</td><td>90</td><td>1</td></tr>\n"
  . "<tr><td>Chrissie</td><td>85</td><td>2</td></tr>\n"
  . "<tr><td>Andy</td><td>50</td><td>3</td></tr>\n"
  . "</table>\n", 'table OK';

is $h->stringify(
    [
        \'html',
        [
            [ \'head', [ \'title', 'Sample page' ] ],
            [
                \'body',
                [
                    [ \'h1', { class => 'main' }, 'Sample page' ],
                    [
                        \'p',
                        'Hello, World',
                        { class => 'detail' },
                        'Second para'
                    ]
                ]
            ]
        ]
    ]
  ),
  "<html><head><title>Sample page</title>"
  . "</head>\n<body><h1 class=\"main\">Sample page</h1>"
  . "<p>Hello, World</p>\n<p class=\"detail\">Second para</p>\n"
  . "</body>\n</html>\n", 'complex HTML OK';
