#
# Cookbook Name:: iptables-nativex
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "iptables-nativex::privoxy"
include_recipe "iptables-nativex::ssh"
include_recipe "iptables-nativex::web"
