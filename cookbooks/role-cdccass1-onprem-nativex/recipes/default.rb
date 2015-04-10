#
# Cookbook Name:: role-cdccass1-onprem-nativex
# Recipe:: default
#
# Copyright (C) 2015 NativeX
#
# All rights reserved - Do Not Redistribute
#

# Override the 'role-onpremise-base-nativex' setting of 'true'
node.normal['autopatch-nativex']['auto_reboot_enabled'] = false
node.default['autopatch-nativex']['updates_to_skip'] = ["dse*", "datastax*"]

include_recipe "role-onpremise-base-nativex::default"
include_recipe "role-cdccass1-onprem-nativex::maintenance_tasks"
