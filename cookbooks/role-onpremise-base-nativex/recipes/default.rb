#
# Cookbook Name:: role-onpremise-base-nativex
# Recipe:: default
#
# Copyright (C) 2015 NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['autopatch-nativex']['auto_reboot_enabled'] = true
# mapper options
default['autofs-nativex']['maps'] = [{:mount_dir => '/home',
									  :key => 'TEAMFREEZE',
									  :source => '/etc/auto.TEAMFREEZE',
									  :options => '-rw,intr,rsize=8192,wsize=8192',
									  :export => '/linuxhome'}]

include_recipe 'autopatch-nativex::default'
include_recipe 'chef-client::delete_validation'
include_recipe 'chef-client'
