#
# Cookbook Name:: nfs-nativex
# Recipe:: export
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

nfs_export node['nfs-nativex']['export_dir'] do
  network node['nfs-nativex']['network']
  writeable node['nfs-nativex']['writeable']
  sync node['nfs-nativex']['sync']
  options node['nfs-nativex']['options']
end
