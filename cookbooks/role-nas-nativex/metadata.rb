name             'role-nas-nativex'
maintainer       'NativeX'
maintainer_email 'adrian.herrera@nativex.com'
license          'All rights reserved'
description      'Installs/Configures role-nas-nativex'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'role-base-nativex'
depends 'tuned-nativex::apply_profile'
depends 'nfs::server4'
depends 'blockdevice-nativex'
depends 'blockdevice-nativex::tags'
depends 'nfs-nativex'