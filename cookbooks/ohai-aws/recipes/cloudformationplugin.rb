#
# Cookbook Name:: ohai-aws
# Recipe:: cloudformationplugin 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential'
include_recipe 'ohai::default'
chef_gem 'aws-sdk'

ohai 'reload_cloudformation' do
  plugin 'aws-cloudformation'
  action :nothing
end

cookbook_file "#{node['ohai']['plugin_path']}/aws-cloudformation.rb" do
  source 'ohai_plugins/aws-cloudformation.rb'
  notifies :reload, 'ohai[reload_cloudformation]', :immediately
end
