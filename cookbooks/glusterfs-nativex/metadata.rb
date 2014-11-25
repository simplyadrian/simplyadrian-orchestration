maintainer 'Adrian Herrera'
maintainer_email 'adrian.herrera@nativex.com'
license 'All rights reserved'
description 'Installs and configures glusterfs as a server or client.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version '0.1.0'
recipe 'glusterfs', 'Installs glusterfs::server and glusterfs::client.'
recipe 'glusterfs::server', 'Installs and configures glusterfs server.'
recipe 'glusterfs::peer', 'Installs and configures glusterfs server as a peer.'
recipe 'glusterfs::client', 'Installs and configures glusterfs client and mounts volumes.'

depends  'yum'
