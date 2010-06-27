#!/usr/bin/perl

# Make sure Perl data structures round trip

use strict;
use warnings;

use Test::More;

use JSYNC;

my $thing = {
    "!"  => "not a type",
    ".!" => "not an escaped type",
    "foo"=> 42,
};

my $round_trip = JSYNC::load(JSYNC::dump($thing));
is_deeply $round_trip, $thing or diag explain $round_trip;

done_testing();
