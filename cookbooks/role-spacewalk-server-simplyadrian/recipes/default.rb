#
# Cookbook Name:: role-spacewalk-server-simplyadrian
# Recipe:: default
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

node.default['autopatch-simplyadrian']['auto_reboot_enabled'] = false
node.default['build-essential']['compile_time'] = true

include_recipe "motd"
include_recipe "spacewalk-simplyadrian::clone_package_channels"
include_recipe "autopatch-simplyadrian::default"
include_recipe "chef-client::delete_validation"
include_recipe "chef-client"
