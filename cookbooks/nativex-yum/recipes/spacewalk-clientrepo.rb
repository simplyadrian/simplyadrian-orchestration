#
# Cookbook Name:: nativex-yum
# Recipe:: spacewalk-clientrepo.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

yum_repository 'spacewalk client' do
  description 'Spacewalk client repository'
  baseurl 'http://yum.spacewalkproject.org/2.2-client/RHEL/6/$basearch/'
  gpgkey 'http://yum.spacewalkproject.org/RPM-GPG-KEY-spacewalk-2012'
  action :create
end
