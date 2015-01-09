#
# Cookbook Name:: mkdirs
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

node['mkdirs'].each do |dir_cfg|
  directory dir_cfg['path'] do
    owner (dir_cfg['owner'] || 'root')
    group (dir_cfg['group'] || 'root')
    mode (dir_cfg['mode'] || '0755')
    action :create
  end
end