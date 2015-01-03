#
# Cookbook Name:: role-spacewalk-server-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "motd"
include_recipe "spacewalk-nativex::clone_package_channels"
include_recipe "chef-client::delete_validation"
include_recipe "chef-client"