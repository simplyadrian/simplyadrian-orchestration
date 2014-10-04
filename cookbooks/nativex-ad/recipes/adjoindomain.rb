#
# Cookbook Name:: nativex-ad
# Recipe:: adjoindomain
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Join teamfreeze.com domain
ad = Chef::EncryptedDataBagItem.load("credentials", "ad")

windows_ad_domain "#{node['nativex-ad']['name']}" do
  action :join
  retries 3
  retry_delay 60
  domain_pass ad["ad_password"]
  domain_user ad["ad_username"]
  ou "#{node['nativex-ad']['ou']}"
end
