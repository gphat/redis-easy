#!perl
use strict;
use warnings;

use Test::More;

use ok 'Redis::Easy';

SKIP: {
    skip 'Must set REDIS_EASY_AUTH_ADDRESS', 1 unless defined($ENV{REDIS_EASY_AUTH_ADDRESS});

    my $redis = Redis::Easy->new(address => $ENV{REDIS_EASY_AUTH_ADDRESS});
    if($ENV{REDIS_EASY_AUTH_PORT}) {
        $redis->port($ENV{REDIS_EASY_AUTH_PORT});
    }

    ok($redis->auth('password'), 'auth');
};

done_testing;