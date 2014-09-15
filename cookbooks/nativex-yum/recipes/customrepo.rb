#
# Cookbook Name:: nativex-yum
# Recipe:: customrepo.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

yum_repository 'nativex-custom' do
  description 'NativeX Custom repository'
  baseurl 'http://spacewalk.teamfreeze.com/nativex-custom'
  gpgkey 'http://spacewalk.teamfreeze.com/pub/rpm-gpg-keys/RPM-GPG-KEY-NativeX-Custom'
  action :create
end
