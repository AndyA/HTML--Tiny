package Test;

use strict;
use vars qw(@ISA @EXPORT);
@ISA = qw(Exporter);
@EXPORT = qw(plan ok is like);

my $NEXT = 1;

sub plan($) {
    my $ntests = shift;
    print "1..$ntests\n";
}

sub ok($$) {
    my ($ok, $msg) = @_;
    print $ok ? '' : 'not ', "ok $NEXT - $msg\n";
    $NEXT++;
    return $ok;
}

sub is($$$) {
    my ($got, $want, $msg) = @_;
    ok $got eq $want, $msg;
    if ($got ne $want) {
        warn "#      got: $got\n";
        warn "# expected: $want\n";
    }
}

sub like($$$) {
    my ($got, $re, $msg) = @_;
    ok $got =~ $re, $msg;
}
