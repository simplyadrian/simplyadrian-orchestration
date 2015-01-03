name             'role-apache-webserver-nativex'
maintainer       'NativeX'
maintainer_email 'adrian.herrera@nativex.com'
license          'All rights reserved'
description      'Installs/Configures role-apache-webserver-nativex'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'role-base-nativex'
depends 'iptables-nativex::ssh'
depends 'iptables-nativex::web'
depends 'apache2'
depends 'apache2::mod_ssl'
depends 'apache2::logrotate'
depends 'apache-nativex2::vhost"