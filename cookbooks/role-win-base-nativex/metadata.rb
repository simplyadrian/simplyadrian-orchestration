name             'role-win-base-nativex'
maintainer       'NativeX'
maintainer_email 'adrian.herrera@nativex.com'
license          'All rights reserved'
description      'Installs/Configures role-win-base-nativex'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "ohai-nativex"
depends "aws"
depends "windows"
depends "ad-nativex::joindomain"
depends "dnsupdate-nativex::addprv"
depends "chef-client::delete_validation"
depends "chef-client"