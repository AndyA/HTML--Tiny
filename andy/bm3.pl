#!/usr/bin/perl

use strict;
use warnings;
use Benchmark qw(:all);

use lib qw/lib/;

use HTML::Tiny;

my $h = HTML::Tiny->new;

sub _html_tiny {
    return scalar $h->html(
        [
            $h->head( $h->title( 'Sample page' ) ),
            $h->body(
                [
                    $h->h1( { class => 'main' }, 'Sample page' ),
                    $h->p(
                        'Hello, World',
                        { class => 'detail' },
                        'Second para'
                    ),
                    $h->table(
                        [
                            $h->tr(
                                [ $h->th( 'Name', 'Score', 'Position' ) ],
                                [ $h->td( 'Therese',  90, 1 ) ],
                                [ $h->td( 'Chrissie', 85, 2 ) ],
                                [ $h->td( 'Andy',     50, 3 ) ]
                            )
                        ]
                    ),
                    $h->form(
                        { method => 'POST' },
                        [
                            $h->input( { type => 'text', name => 'q' } ),
                            $h->br,
                            $h->input( { type => 'submit' } )
                        ]
                    )
                ]
            )
        ]
    );
}

sub _literal {
    my @data
      = ( [ 'Therese', 90, 1 ], [ 'Chrissie', 85, 2 ], [ 'Andy', 50, 3 ] );

    my @out = ();

    push @out, "<html><head><title>Sample page</title></head>",
      "<body><h1 class=\"main\">Sample page</h1><p>Hello, World</p>",
      "<p class=\"detail\">Second para</p>";

    push @out, "<table><tr><th>Name</th><th>Score</th><th>Position</th></tr>";

    for my $row ( @data ) {
        my ( $name, $score, $position ) = @$row;
        push @out, "<tr><td>$name</td><td>$score</td><td>$position</td></tr>";
    }

    push @out, "</table>",
      "<form method=\"POST\"><input name=\"q\" type=\"text\" /><br /><input type=\"submit\" /></form></body>",
      "</html>";

    return join( "\n", @out ) . "\n";
}

print _html_tiny();

# for ( 1 .. 10000 ) {
#     my $x = _html_tiny();
# }
# 
# # Baseline
# #
# #              Rate html_tiny   literal
# # html_tiny   752/s        --      -97%
# # literal   26096/s     3368%        --
# 
# cmpthese(
#     -1,
#     {
#         literal   => sub { my $x = _literal() },
#         html_tiny => sub { my $x = _html_tiny() },
#     }
# );
