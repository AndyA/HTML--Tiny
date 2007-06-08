use lib qw(t/lib);
use Test;

plan 1;

eval "use HTML::Tiny";
ok !$@, 'Loaded OK';

