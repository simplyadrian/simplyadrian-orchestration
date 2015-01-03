name             'role-privoxy-nativex'
maintainer       'NativeX'
maintainer_email 'adrian.herrera@nativex.com'
license          'All rights reserved'
description      'Installs/Configures role-privoxy-nativex'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'role-base-nativex'
depends 'privoxy'
depends 'iptables-nativex::privoxy'
depends 'iptables-nativex::ssh'