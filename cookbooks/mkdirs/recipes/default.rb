#
# Cookbook Name:: mkdirs
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

node['mkdirs']['path'].each do |dir_cfg|
  directory dir_cfg do
    owner node['mkdirs']['owner']
    group node['mkdirs']['group']
    mode node['mkdirs']['mode']
    action :create
  end
end