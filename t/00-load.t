#!perl
use strict;
use warnings;

use Test::More;

BEGIN {
    use_ok( 'Redis::Easy' );
}

diag( "Testing Redis::Easy $Redis::Easy::VERSION, Perl $], $^X" );

done_testing;