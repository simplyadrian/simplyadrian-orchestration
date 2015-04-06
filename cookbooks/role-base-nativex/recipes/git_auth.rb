#
# Cookbook Name:: role-base-nativex
# Recipe:: git_auth
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Istantiate encrypted data bag
creds = Chef::EncryptedDataBagItem.load('credentials', 'github_chef_user_private_key')

# Create the directory for the ssh_keys
directory "#{node['role-base-nativex']['ssh']['home']}" do
	owner node['role-base-nativex']['ssh']['user']
	group node['role-base-nativex']['ssh']['group']
	mode '0600'
	action :create
end

# Store private key on disk
file "#{node['role-base-nativex']['ssh']['home']}/#{node['role-base-nativex']['ssh']['key_name']}" do
  content "#{creds['priv']}"
  owner node['role-base-nativex']['ssh']['user']
  group node['role-base-nativex']['ssh']['group']
  mode 00600
  action :create
end