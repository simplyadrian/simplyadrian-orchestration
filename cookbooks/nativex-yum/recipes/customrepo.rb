#
# Cookbook Name:: nativex-yum
# Recipe:: customrepo.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

yum_repository 'custom' do
  description "my custom Repo"
  baseurl "http://localhost/#{os_release}/#{arch}/stable/"
  gpgkey 'http://localhost/gpg_key'
  action :create
end

yum_repository 'custom2' do
  description "my custom Repo"
  baseurl "http://localhost2/#{os_release}/#{arch}/stable/"
  gpgcheck false
  action :create
end
