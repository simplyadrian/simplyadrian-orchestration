#
# Cookbook Name:: nativex-spacewalkclient
# Recipe:: registerclient 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

is_registered_command = "rhn_check"

bash 'register_client' do
  code <<-EOH
    rhnreg_ks --serverUrl=http://spacewalk.teamfreeze.com/XMLRPC --activationkey=1-centos6
  EOH
only_if is_registered_command == $0
end
