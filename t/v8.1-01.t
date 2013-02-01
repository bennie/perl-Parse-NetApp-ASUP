use Test;
use File::Slurp;
use strict;

BEGIN { plan tests => 5 };

use Parse::NetApp::ASUP;
ok(1); 

my $pna = Parse::NetApp::ASUP->new();
ok(2); 

my $asup = read_file('examples/8.1/asup01.txt') ;
ok(3);

my $ret = $pna->load($asup);
$ret == 1 ? ok(4) : nok(4);

my $ver = $pna->asup_version($asup);
$ver eq '8.1' ? ok(5) : nok(5);
