#
# Cookbook Name:: role-win-base-simplyadrian
# Recipe:: default
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ohai-simplyadrian"
include_recipe "chef-sugar"
include_recipe "aws"
include_recipe "timezone-simplyadrian"
include_recipe "windows"
include_recipe "ad-simplyadrian::joindomain"
include_recipe "ad-simplyadrian::renamecomputer"
include_recipe "autopatch-simplyadrian::default"
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
