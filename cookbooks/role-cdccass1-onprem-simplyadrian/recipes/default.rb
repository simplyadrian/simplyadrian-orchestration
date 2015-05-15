#
# Cookbook Name:: role-cdccass1-onprem-simplyadrian
# Recipe:: default
#
# Copyright (C) 2015 simplyadrian
#
# All rights reserved - Do Not Redistribute
#

# Override the 'role-onpremise-base-simplyadrian' setting of 'true'
node.normal['autopatch-simplyadrian']['auto_reboot_enabled'] = false
node.default['autopatch-simplyadrian']['updates_to_skip'] = ["dse*", "datastax*"]

include_recipe "role-onpremise-base-simplyadrian::default"
include_recipe "role-cdccass1-onprem-simplyadrian::maintenance_tasks"
