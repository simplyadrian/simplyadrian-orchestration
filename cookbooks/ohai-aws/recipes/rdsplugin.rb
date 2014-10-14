#
# Cookbook Name:: ohai-aws
# Recipe:: rdsplugin 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential'
include_recipe 'ohai::default'
chef_gem 'aws-sdk'

ohai 'reload_rds' do
  plugin 'aws-rds'
  action :nothing
end

cookbook_file "#{node['ohai']['plugin_path']}/aws-rds.rb" do
  source 'ohai_plugins/aws-rds.rb'
  notifies :reload, 'ohai[reload_rds]', :immediately
end
