name             'role-onpremise-createsession-nativex'
maintainer       'NativeX'
maintainer_email 'adrian.herrera@nativex.com'
license          'All rights reserved'
description      'Installs/Configures role-onpremise-createsession-nativex'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'role-onpremise-base-nativex'
depends 'git'
depends 'maven'
depends 'nodejs'
depends 'snowflake-nativex'