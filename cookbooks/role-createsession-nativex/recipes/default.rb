#
# Cookbook Name:: role-createsession-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['blockdevice_nativex']['dir'] = "/mnt/ebs"
node.default['blockdevice_nativex']['mount_point_group'] = "predictive_analytics"
node.default['blockdevice_nativex']['recurse_permissions'] = false
node.default['blockdevice_nativex']['filesystem'] = "xfs"
node.default['blockdevice_nativex']['ebs']['raid'] = false
node.default['blockdevice_nativex']['ebs']['size'] = 250
node.default['ephemeral_lvm']['mount_point'] = "/mnt/ephemeral"
node.default['java']['install_flavor'] = "oracle"
node.default['java']['jdk_version'] = "7"
node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['nodejs']['npm_packages'] = [{:name => "async", :name => "aws-sdk", :name => "moment"}]
node.default['pbis-nativex']['organizational_unit_level_5'] = "Predictive Analytics"

include_recipe 'role-base-nativex'
include_recipe 'git'
include_recipe 'blockdevice-nativex'
include_recipe 'blockdevice-nativex::tags'
include_recipe 'nodejs'
include_recipe 'tuned-nativex::apply_profile'
