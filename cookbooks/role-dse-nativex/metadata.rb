name             'role-dse-nativex'
maintainer       'NativeX'
maintainer_email 'adrian.herrera@nativex.com'
license          'All rights reserved'
description      'Installs/Configures role-dse-nativex'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'role-base-nativex'
depends 'tuned-nativex::apply_profile'
depends 'dse-nativex::determine_ec2_topology'
depends 'dse-nativex::default'