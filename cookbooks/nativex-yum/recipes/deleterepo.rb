#
# Cookbook Name:: nativex-yum
# Recipe:: deleterepo.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# delete CentOS-Media repo
yum_repository 'CentOS-Media' do
  action :delete
end

#delete CentOS-Debuginfo repo
yum_repository 'CentOS-Debuginfo' do
  action :delete
end

#delete CentOS-Vault repo
yum_repository 'CentOS-Vault' do
  action :delete
end

delete rightlink repo
yum_repository 'rightlink' do
  action :delete
end
