name             'glusterfs-nativex'
maintainer       'NativeX'
maintainer_email 'adrian.herrera@nativex.com'
license          'All rights reserved'
description      'Installs/Configures glusterfs-nativex'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
recipe 'glusterfs-nativex', 'Installs glusterfs::server and glusterfs::client.'
recipe 'glusterfs-nativex::server', 'Installs and configures glusterfs server.'
recipe 'glusterfs-nativex::peer', 'Installs and configures glusterfs server as a peer.'
recipe 'glusterfs-nativex::client', 'Installs and configures glusterfs client and mounts volumes.'

depends  "yum"
