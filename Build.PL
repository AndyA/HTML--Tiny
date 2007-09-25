use strict;
use warnings;
use Module::Build;

my $build_class = Module::Build->subclass(
    class => 'inc::MyBuilder',
    code  => <<'    SUBCLASS',
      sub ACTION_testauthor {
          my $self = shift;
          $self->test_files('t', 'xt/author');
          $self->generic_test( type => 'default' );
      }
    SUBCLASS
);

my $builder = $build_class->new(
    module_name       => 'HTML::Tiny',
    license           => 'perl',
    dist_author       => 'Andy Armstrong <andy@hexten.net>',
    dist_version_from => 'lib/HTML/Tiny.pm',
    requires          => { 'Test::More' => 0 },
    add_to_cleanup    => ['HTML-Tiny-*'],
);

$builder->create_build_script();
