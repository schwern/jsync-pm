#line 1
package Module::Install::TestML;
use strict;
use warnings;

use Module::Install::Base;

use vars qw($VERSION @ISA);
BEGIN {
    $VERSION = '0.10';
    @ISA     = 'Module::Install::Base';
}

sub use_testml_tap {
    my $self = shift;

    $self->use_testml;
     
    $self->include('TestML::Runner::TAP');

    $self->include('Test::More');
    $self->include('Test::Builder');
    $self->include('Test::Builder::Module');
    $self->requires('Filter::Util::Call');
}

sub use_testml {
    my $self = shift;

    $self->include('TestML');
    $self->include('TestML::Base');
    $self->include('TestML::Bridge');
    $self->include('TestML::Document');
    $self->include('TestML::Parser');
    $self->include('TestML::Parser::Grammar');
    $self->include('TestML::Runner');
    $self->include('TestML::Standard');
}

1;

=encoding utf8

#line 85
