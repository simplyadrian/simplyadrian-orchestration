#
# Cookbook Name:: role-apache-webserver-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['ephemeral_lvm']['mount_point'] = "/mnt/www"
node.default['apache2']['listen_ports'] = ["80", "443"]
node.default['apache2']['docroot_dir'] = "/mnt/www"
node.default['apache2']['contact'] = "SysEngineers@nativex.com"

include_recipe 'role-base-nativex'
include_recipe 'iptables-nativex::ssh'
include_recipe 'iptables-nativex::web'
include_recipe 'apache2'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::logrotate'
include_recipe 'apache-nativex2::vhost"