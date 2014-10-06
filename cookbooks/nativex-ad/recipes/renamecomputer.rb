#
# Cookbook Name:: nativex-ad
# Recipe:: renamecomputer 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# reboot action block
include_recipe 'windows::reboot_handler'

windows_reboot 60 do
  timeout 60
  reason 'Opscode Chef initiated reboot. Restarting computer in 30 seconds!'
  action :nothing
end

not_if_test = "hostname"
 
# rename computer
ad = Chef::EncryptedDataBagItem.load("credentials", "ad")
nativex_ad_rename "#{node.name}" do
  action :rename
  domain_pass ad["ad_password"]
  domain_user ad["ad_username"]
  hostname "#{node.name}"
  notifies :request, 'windows_reboot[60]', :delayed
  only_if "$not_if_test.StartsWith('WIN')"
end 

