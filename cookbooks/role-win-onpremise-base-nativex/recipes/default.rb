#
# Cookbook Name:: role-win-onpremise-base-nativex
# Recipe:: default
#
# Copyright (C) 2015 NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['autopatch-nativex']['auto_reboot_enabled'] = true

include_recipe "autopatch-nativex::default"
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
