#
# Cookbook Name:: nativex-spacewalkclient
# Recipe:: registerclient 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

bash 'register_client' do
  code <<-EOH
    rhnreg_ks --serverUrl=http://spacewalk.teamfreeze.com/XMLRPC --activationkey=1-centos6
  EOH
end
