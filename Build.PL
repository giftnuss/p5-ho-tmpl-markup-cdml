use strict;
use Module::Build;
# See perldoc Module::Build for details of how this works

Module::Build->new
    ( module_name     => 'HO::Tmpl::Markup::CDML',
      dist_version    => '0.01',
      dist_author     => 'Sebastian Knapp <news@young-workers.de>',
      license         => 'perl',
      create_makefile_pl => 'traditional',
      dist_abstract   => 'CDML Markup Generation',

      requires =>
          { perl => 5.010
      },
      build_requires =>
          { 'lib::vendor' => '0.14.163'
          }
    )->create_build_script;
