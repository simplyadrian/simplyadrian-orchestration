#
# Cookbook Name:: nativex-yumupgrade
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "yum-y-upgrade" do
  command "yum -y upgrade"
  action :run
end
