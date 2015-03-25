#
# Cookbook Name:: role-onpremise-base-nativex
# Recipe:: default
#
# Copyright (C) 2015 NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['autopatch-nativex']['auto_reboot_enabled'] = true

include_recipe 'autopatch-nativex::default'
include_recipe 'chef-client::delete_validation'
include_recipe 'chef-client'
