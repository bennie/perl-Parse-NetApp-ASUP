use Test;
use File::Slurp;
use strict;

BEGIN { plan tests => 4 };

use Parse::NetApp::ASUP;
ok(1); 

my $pna = Parse::NetApp::ASUP->new();
ok(2); 

my $asup = read_file('examples/7.0.3/asup01.txt') ;
ok(3);

$pna->load($asup);
ok(4);
