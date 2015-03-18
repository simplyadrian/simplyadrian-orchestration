#
# Cookbook Name:: role-privoxy-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['tuned']['active_profile'] = "virtual-guest"

include_recipe "role-base-nativex"
include_recipe "privoxy-nativex"