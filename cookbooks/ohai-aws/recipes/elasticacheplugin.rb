#
# Cookbook Name:: ohai-aws
# Recipe:: elasticacheplugin 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'ohai::default'
chef_gem 'aws-sdk'

ohai 'reload_elasticache' do
  plugin 'aws-elasticache'
  action :nothing
end

cookbook_file "#{node['ohai']['plugin_path']}/aws-elasticache.rb" do
  source 'ohai_plugins/aws-elasticache.rb'
  notifies :reload, 'ohai[reload_elasticache]', :immediately
end
