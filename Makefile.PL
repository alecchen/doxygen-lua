use inc::Module::Install 0.92; #0.92 has support for better ppd/OS package generation

name     'Doxygen-Lua';
all_from 'lib/Doxygen/Lua.pm';
author   q{Alec Chen <alec@cpan.org>};
license  'perl';

build_requires 'Test::More';

install_script 'bin/lua2dox';
auto_install;

repository 'http://github.com/alecchen/doxygen-lua';
WriteAll;
