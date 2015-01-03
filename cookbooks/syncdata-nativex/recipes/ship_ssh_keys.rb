#
# Cookbook Name:: syncdata-nativex
# Recipe:: ship_ssh_keys
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

creds = Chef::EncryptedDataBagItem.load('credentials', 'syncdata')
pkey = "#{creds['priv']}"
pubkey = "#{creds['pub']}"

# Create ~/.ssh directory
directory node['syncdata_nativex']['ssh']['home'] do
  owner node['syncdata_nativex']['ssh']['user']
  group node['syncdata_nativex']['ssh']['group']
  mode 00700
  action :create
end

# Store private key on disk
file "#{node['syncdata_nativex']['ssh']['home']}/id_rsa" do
  content pkey
  owner node['syncdata_nativex']['ssh']['user']
  group node['syncdata_nativex']['ssh']['group']
  mode 00600
  action :create_if_missing
end

# Store public key on disk
file "#{node['syncdata_nativex']['ssh']['home']}/id_rsa.pub" do
  content pubkey
  owner node['syncdata_nativex']['ssh']['user']
  group node['syncdata_nativex']['ssh']['group']
  mode 00644
  action :create_if_missing
end

append_if_no_line "#{node['syncdata_nativex']['ssh']['home']}/id_rsa.pub" do
  path "#{node['syncdata_nativex']['ssh']['home']}/authorized_keys"
  line pubkey
end