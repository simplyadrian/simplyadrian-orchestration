#
# Cookbook Name:: spacewalkclient-nativex
# Recipe:: clientinstall
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

%w{rhn-client-tools rhn-check rhn-setup rhnsd m2crypto yum-rhn-plugin spacewalk-abrt}.each do |pkg|
  package pkg do
    action :install
    options "--nogpgcheck"
  end
end
