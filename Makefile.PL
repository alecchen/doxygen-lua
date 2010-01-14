use inc::Module::Install;

name     'Doxygen-Lua';
all_from 'lib/Doxygen/Lua.pm';
author   q{Alec Chen <alec@cpan.org>};
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

