#
# Cookbook Name:: nativex-ad
# Recipe:: reboot
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Reboot server to commit changes
include_recipe 'windows::reboot_handler'

windows_reboot 30 do
  timeout 30
  reason 'Opscode Chef initiated reboot. Restarting computer in 30 seconds!'
  action :request
end



