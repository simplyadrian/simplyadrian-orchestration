#
# Cookbook Name:: nativex-iptables
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nativex-iptables::privoxy"
include_recipe "nativex-iptables::ssh"
include_recipe "nativex-iptables::web"
