#
# Cookbook Name:: nativex-ad
# Recipe:: renamecomputer 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Reboot server to commit changes
include_recipe 'windows::reboot_handler'
node.default[:windows][:allow_pending_reboots] = false

# rename computer
ad = Chef::EncryptedDataBagItem.load("credentials", "ad")
nativex_ad_rename "#{node.name}" do
  action :rename
  domain_pass ad["ad_password"]
  domain_user ad["ad_username"]
  hostname "#{node.name}"
  notifies :request, 'windows_reboot[60]', :delayed
  not_if {"#{node.name}" == node['hostname']} 
end 

windows_reboot 60 do
  timeout 60
  reason 'Opscode Chef initiated reboot. Restarting computer in 60 seconds!'
  action :nothing
end
