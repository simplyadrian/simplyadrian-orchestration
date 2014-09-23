#
# Cookbook Name:: nativex-ad
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Join teamfreeze.com domain

ad = Chef::EncryptedDataBagItem.load("credentials", "ad")

windows_ad_domain "#{name}" do
  action :join
  domain_pass ad["ad_password"]
  domain_user ad["ad_username"]
end

windows_ad_computer node['hostname'] do
  action :move
  domain_name node['fqdn']
  ou "OU=Domain Controllers,DC=teamfreeze,DC=com"
end