#
# Cookbook Name:: role-apache-webserver-simplyadrian
# Recipe:: default
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

node.default['ephemeral_lvm']['mount_point'] = "/mnt/www"
node.default['apache2']['listen_ports'] = ["80", "443"]
node.default['apache2']['docroot_dir'] = "/mnt/www"
node.default['apache2']['contact'] = "SysEngineers@simplyadrian.com"
node.default['pbis-simplyadrian']['organizational_unit_level_5'] = "Web Servers" if File.directory?('/etc/pbis')
node.default['ad-simplyadrian']['organizational_unit_level_5'] = "Web Servers"

include_recipe 'role-base-simplyadrian'
include_recipe 'apache2'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::logrotate'
include_recipe 'apache2-simplyadrian::vhost'
