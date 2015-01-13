#
# Cookbook Name:: mkdirs-nativex
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

node['mkdirs-nativex']['path'].each do |dir_cfg|
  directory dir_cfg do
    owner node['mkdirs-nativex']['owner']
    group node['mkdirs-nativex']['group']
    mode node['mkdirs-nativex']['mode']
    action :create
  end
end