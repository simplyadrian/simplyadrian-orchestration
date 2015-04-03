#
# Cookbook Name:: role-domain-controller-nativex
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['ad-nativex']['oupath'] = "OU=Domain Controllers,DC=teamfreeze,DC=com"
node.default['autopatch-nativex']['auto_reboot_enabled'] = false

include_recipe "aws"
include_recipe "windows"
include_recipe "ad-nativex::joindomain"
include_recipe "ad-nativex::renamecomputer"
include_recipe "ad-nativex::installdomaincontroller"
include_recipe "autopatch-nativex"
include_recipe "chef-client::delete_validation"
include_recipe "chef-client"

# This is a hack of sorts to make the chef-client service start up mode be "Automatic (Delayed)".
# The default is "Automatic". Without it delayed, the service fails to start on reboot.
# See https://github.com/chef/chef/issues/2814
registry_key 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\chef-client' do
  values [{
    :name => "DelayedAutostart",
    :type => :dword,
    :data => 1
  }]
  action :create
end
