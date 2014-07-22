name             'cassandra-priam'
maintainer       "Alex Trull"
maintainer_email "cookbooks.alex@trull.org"
license          "Apache 2.0"
description      "Installs Priam-managed Cassandra"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "0.1.3"

%w{ ubuntu debian redhat fedora centos scientific amazon }.each do |os|
  supports os
end

depends "sudo"
depends "runit"
depends "java"
depends "tomcat"
