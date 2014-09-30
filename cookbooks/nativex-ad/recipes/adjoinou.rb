#
# Cookbook Name:: nativex-ad
# Recipe:: adjoindomain
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Move a computer computer to a Computers OU with description of "Computer"
windows_ad_computer node['hostname'] do
  action :create
  domain_name "#{node['nativex-ad']['name']}"
  ou "#{node['nativex-ad']['ou']}"
  options ({ "desc" => node['fqdn'] })
end
