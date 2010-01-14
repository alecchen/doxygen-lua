use inc::Module::Install;

name     'Doxygen-Lua';
all_from 'lib/Doxygen/Lua.pm';
author   q{Alec Chen <alec@cpan.org>};
license  'perl';

build_requires 'Test::More';
requires 'Moose';

install_script 'bin/lua2dox';
auto_install;

WriteAll;
