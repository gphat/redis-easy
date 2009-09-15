use inc::Module::Install;

name     'Redis-Easy';
all_from 'lib/Redis/Easy.pm';
author   q{Cory G Watson <gphat@cpan.org>};
license  'perl';

build_requires 'Test::More';

requires 'Redis';
requires 'Moose';

WriteAll;

