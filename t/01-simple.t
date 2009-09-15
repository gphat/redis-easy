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

    ok($redis->set('foo', 'bar'), 'set foo to bar');
    cmp_ok($redis->get('foo'), 'eq', 'bar', 'get foo');
    cmp_ok($redis->get_set('foo', 'baz'), 'eq', 'bar', 'setget foo gave old value');
    cmp_ok($redis->get('foo'), 'eq', 'baz', 'get foo (new value)');
};

done_testing;