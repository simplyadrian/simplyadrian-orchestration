#
# Cookbook Name:: role-nas-simplyadrian
# Recipe:: default
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

node.default['blockdevice_simplyadrian']['dir'] = "/mnt/ebs"
node.default['blockdevice_simplyadrian']['filesystem'] = "xfs"
node.default['blockdevice_simplyadrian']['mount_point_group'] = "predictive_analytics"
node.default['blockdevice_simplyadrian']['ebs']['raid'] = true
node.default['blockdevice_simplyadrian']['ebs']['hvm'] = true
node.default['ephemeral_lvm']['mount_point'] = "/mnt/ephemeral"
node.default['ephemeral_lvm']['filesystem'] = "xfs"
node.default['ephemeral_lvm']['volume_group_name'] = "vg_data_ephem"
node.default['ephemeral_lvm']['logical_volume_name'] = "lv_nas_raid0"
node.default['tuned']['active_profile'] = "virtual-guest"
node.default['nfs']['packages'] = ["portmap", "nfs-utils", "nfs4-acl-tools"]
node.default['nfs']['port']['statd'] = "32765"
node.default['nfs']['port']['statd_out'] = "32766"
node.default['nfs']['port']['mountd'] = "32767"
node.default['nfs']['port']['lockd'] = "32768"
node.default['nfs-simplyadrian']['export_dir'] = "/mnt/ebs"
node.default['nfs-simplyadrian']['network'] = "172.16.0.0/12"
node.default['nfs-simplyadrian']['writeable'] = true
node.default['nfs-simplyadrian']['sync'] = true

include_recipe "role-base-simplyadrian"
include_recipe "tuned-simplyadrian::apply_profile"
include_recipe "nfs::server4"
include_recipe "blockdevice-simplyadrian"
include_recipe "blockdevice-simplyadrian::tags"
include_recipe "nfs-simplyadrian"