#
# Cookbook Name:: ohai-aws
# Recipe:: elbplugin 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential'
include_recipe 'ohai::default'
chef_gem 'aws-sdk'

ohai 'reload_elb' do
  plugin 'aws-elb'
  action :nothing
end

cookbook_file "#{node['ohai']['plugin_path']}/aws-elb.rb" do
  source 'ohai_plugins/aws-elb.rb'
  notifies :reload, 'ohai[reload_elb]', :immediately
end
