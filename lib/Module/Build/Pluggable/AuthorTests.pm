package Module::Build::Pluggable::AuthorTests;

use parent qw(Module::Build::Pluggable::Base);

use strict;
use warnings;

our $VERSION = '0.01';

sub HOOK_build {

    my $self = shift;

    $self->add_action( 'authortest', \&ACTION_authortest );


}

sub ACTION_authortest {
    my ( $self ) = @_;

    $self->depends_on( 'build' );
    $self->depends_on( 'manifest' );
    $self->depends_on( 'distmeta' );

    $self->test_files( qw< t xt > );
    $self->recursive_test_files( 1 );

    $self->depends_on( 'test' );

    return;
}

1;

__END__

=pod

=head1 NAME

Module::Build::Pluggable::AuthorTest - Plugin to Module::Build to add author tests

=head1 VERSION

version 0.01

=head1 SYNOPSIS

    # Build.PL
    use strict;
    use warnings;
    use Module::Build::Pluggable ('AuthorTests');

    my $builder = Module::Build::Pluggable->new(
        ...
    );
    $builder->create_build_script();

=head1 DESCRIPTION

This L<Module::Build::Pluggable> plugin adds an B<authortest> action which
recursively runs tests in the F<t> and F<xt> directories.

E.g.,

  ./Build authortest

=head1 SEE ALSO

http://elliotlovesperl.com/2009/11/24/explicitly-running-author-tests/

which is where the idea and code comes from.


=head1 AUTHOR

Diab Jerius E<lt>djeriuss@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2016 The Smithsonian Astrophysical Observatory

Copyright (c) 2016 Diab Jerius

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
