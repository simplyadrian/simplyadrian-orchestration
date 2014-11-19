#
# Cookbook Name:: nfs-nativex
# Recipe:: export
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "blockdevice-nativex"

nfs_export node['blockdevice-nativex']['dir'] do
  network node['nfs-nativex']['network']
  writeable node['nfs-nativex']['writeable']
  sync node['nfs-nativex']['sync']
  options node['nfs-nativex']['options']
end
