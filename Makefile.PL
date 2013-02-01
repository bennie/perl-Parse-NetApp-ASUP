use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'         => 'Parse::NetApp::ASUP',
    'VERSION_FROM' => 'lib/Parse/NetApp/ASUP.pm',
    'PREREQ_PM'    => { File::Slurp => 9999.19 },
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'lib/Parse/NetApp/ASUP.pm',
       AUTHOR     => 'Phillip Pollard <bennie@cpan.org>') : ()),
);
