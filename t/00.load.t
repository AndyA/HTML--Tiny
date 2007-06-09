use lib qw(t/lib);
use Test;

plan 2;

ok( $] >= 5.004, "Your perl is new enough" );

eval "use HTML::Tiny";
ok !$@, 'Loaded OK';

