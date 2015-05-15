#
# Cookbook Name:: role-dse-simplyadrian
# Recipe:: default
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

# Override 'role-base-simplyadrian' setting of true
node.normal['autopatch-simplyadrian']['auto_reboot_enabled'] = false
node.default['autopatch-simplyadrian']['updates_to_skip'] = ["dse*", "datastax*"]
node.default['ephemeral_lvm']['mount_point'] = "/var/lib/cassandra"
node.default['ephemeral_lvm']['filesystem'] = "xfs"
node.default['ephemeral_lvm']['volume_group_name'] = "vg_data_ephem"
node.default['ephemeral_lvm']['logical_volume_name'] = "lv_cass_raid0"
node.default['java']['install_flavor'] = "oracle"
node.default['java']['jdk_version'] = "7"
node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['opscenter-agent']['enabled'] = true
node.default['pbis-simplyadrian']['organizational_unit_level_5'] = "Cassandra Servers" if File.directory?('/etc/pbis')
node.default['ad-simplyadrian']['organizational_unit_level_5'] = "Cassandra Servers"
# Override 'role-base-simplyadrian' setting of 'virtual-guest'
node.normal['tuned']['active_profile'] = "throughput-performance"

include_recipe 'role-base-simplyadrian'

node.default['authorization']['sudo']['groups'] = node['sudoers']['allowed_groups'].concat(['mobilerelease'])

include_recipe 'tuned-simplyadrian::apply_profile'
include_recipe 'dse-simplyadrian::determine_ec2_topology'
include_recipe 'dse-simplyadrian::default'
