#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Doxygen::Lua' ) || print "Bail out!
";
}

diag( "Testing Doxygen::Lua $Doxygen::Lua::VERSION, Perl $], $^X" );
