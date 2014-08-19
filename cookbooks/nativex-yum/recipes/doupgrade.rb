#
# Cookbook Name:: nativex-yumupgrade
# Recipe:: doupgrade
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

execute "yum-y-upgrade" do
  command "yum -y upgrade"
  action :run
end
