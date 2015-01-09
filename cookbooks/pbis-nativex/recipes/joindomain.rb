#
# Cookbook Name:: pbis-nativex
# Recipe:: joindomain.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# If we're in EC2, then need to dynamically determine the the OU based on region
include_recipe 'pbis-nativex::dynamic_ou' if node['cloud']['provider'] == 'ec2'

ad = Chef::EncryptedDataBagItem.load("credentials", "pbis")

bash "pbis join domain" do
  code lazy { <<-EOH
  domainjoin-cli join --ou "#{node['pbis-nativex']['oupath']}" "#{node['pbis-nativex']['domain_name']}" #{ad['ad_username']} #{ad['ad_password']}
  EOH
  }
  only_if "/opt/pbis/bin/get-status |grep \"Status:        Unknown\";"
end
