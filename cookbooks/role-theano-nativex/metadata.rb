name             'role-theano-nativex'
maintainer       'NativeX'
maintainer_email 'adrian.herrera@nativex.com'
license          'All rights reserved'
description      'Installs/Configures role-theano-nativex'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "ohai-nativex"
depends "aws"
depends "xml"
depends "users::sysadmins"
depends "sudo"
depends "apt"
depends "vim"
depends "nano"
depends "bash-completion"
depends "dstat"
depends "ephemeral_lvm-nativex"
depends "blockdevice-nativex"
depends "dnsupdate-nativex"
depends "hostname-nativex::updatehostname"
depends "iptables"
depends "snmp"
depends "ntp"
depends "motd"
depends "chef-client::delete_validation"
depends "chef-client"