use 5.006;
use strict;
use warnings FATAL => 'all';
use inc::Module::Install;

name     'Template-Jade';
all_from 'lib/Template/Jade.pm';
author   q{Evan Carroll <me@evancarroll.com>};
license  'artistic2';

perl_version 5.006;

tests_recursive('t');

requires 'Moose';
requires 'HTML::Escape';
requires 'Sub::Exporter';
requires 'Text::Markdown::Discount';

resources (
   #homepage   => 'http://yourwebsitehere.com',
   #IRC        => 'irc://irc.perl.org/#Template-Jade',
   license    => 'http://www.perlfoundation.org/artistic_license_2_0',
   #repository => 'git://github.com/Evan Carroll/Template-Jade.git',
   bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Template-Jade',
);

configure_requires (
   'Module::Install' => 0,
);

build_requires (
   'Test::More' => 0,
);

requires (
   #'ABC'              => 1.6,
   #'Foo::Bar::Module' => 5.0401,
);

install_as_cpan;
auto_install;
WriteAll;
