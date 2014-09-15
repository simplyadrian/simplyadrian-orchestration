#
# Cookbook Name:: nativex-yum
# Recipe:: customrepo.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

yum_repository 'epel' do
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=$basearch'
  description 'Extra Packages for Enterprise Linux 6 - $basearch'
  enabled true
  gpgcheck true
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL'
end
