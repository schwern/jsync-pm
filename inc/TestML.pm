#line 1
# To Do:
#
package TestML;
use strict;
use warnings;
use 5.006001;

$TestML::VERSION = '0.03';

sub import {
    my $run;
    my $bridge;
    my $document;

    if ($_[1] eq '-base') {
        goto &TestML::Base::import;
    }

    my $pkg = shift;
    while (@_) {
        my $option = shift(@_);
        my $value = (@_ and $_[0] !~ /^-/) ? shift(@_) : '';
        if ($option eq '-run') {
            $run = $value || 'TestML::Runner::TAP';
        }
        elsif ($option eq '-document') {
            $document = $value;
        }
        elsif ($option eq '-bridge') {
            $bridge = $value;
        }
        else {
            die "Unknown option '$option'";
        }
    }

    sub END {
        no warnings;
        if ($run) {
            eval "require $run; 1" or die $@;
            $run->new(
                document => ($document || \ *main::DATA),
                bridge => ($bridge || 'TestML::Bridge'),
            )->run();
        }
        elsif ($document or $bridge) {
            die "-document or -bridge option used without -run option\n";
        }
    }
}

1;

=encoding utf-8

#line 139
