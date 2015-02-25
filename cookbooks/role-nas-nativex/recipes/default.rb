#
# Cookbook Name:: role-nas-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['blockdevice_nativex']['dir'] = "/mnt/ebs"
node.default['blockdevice_nativex']['filesystem'] = "xfs"
node.default['blockdevice_nativex']['mount_point_group'] = "predictive_analytics"
node.default['blockdevice_nativex']['ebs']['raid'] = true
node.default['blockdevice_nativex']['ebs']['hvm'] = true
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
node.default['nfs-nativex']['export_dir'] = "/mnt/ebs"
node.default['nfs-nativex']['network'] = "172.16.0.0/12"
node.default['nfs-nativex']['writeable'] = true
node.default['nfs-nativex']['sync'] = true

include_recipe "role-base-nativex"
include_recipe "tuned-nativex::apply_profile"
include_recipe "nfs::server4"
include_recipe "blockdevice-nativex"
include_recipe "blockdevice-nativex::tags"
include_recipe "nfs-nativex"