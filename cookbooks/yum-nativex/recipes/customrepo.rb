#
# Cookbook Name:: yum-nativex
# Recipe:: customrepo.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  baseurl 'http://dl.fedoraproject.org/pub/epel/6/x86_64/'
  gpgcheck false
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
  action :create
end

yum_repository 'spacewalk-client' do
  description 'SpaceWalk Client'
  baseurl 'http://yum.spacewalkproject.org/2.2-client/RHEL/6/x86_64/'
  gpgcheck false
  gpgkey 'http://yum.spacewalkproject.org/RPM-GPG-KEY-spacewalk-2014'
  action :create
end
