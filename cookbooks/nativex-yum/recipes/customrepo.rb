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

yum_repository 'spacewalk client' do
  description 'Spacewalk client repository'
  baseurl 'http://yum.spacewalkproject.org/2.2-client/RHEL/6/$basearch/'
  gpgkey 'http://yum.spacewalkproject.org/RPM-GPG-KEY-spacewalk-2012'
  action :create
end

yum_repository 'spacewalk-client-nightly' do
  description 'Spacewalk nightly client repository'
  baseurl 'http://yum.spacewalkproject.org/nightly-client/RHEL/6/$basearch/'
  gpgkey 'http://yum.spacewalkproject.org/RPM-GPG-KEY-spacewalk-2012'
  action :create
end
