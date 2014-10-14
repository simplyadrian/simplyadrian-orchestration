#
# Cookbook Name:: ohai-aws
# Recipe:: awsplugin 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'ohai::default'
chef_gem 'aws-sdk'

ohai 'reload_aws' do
  plugin 'aws'
  action :nothing
end

cookbook_file "#{node['ohai']['plugin_path']}/aws.rb" do
  source 'ohai_plugins/aws.rb'
  notifies :reload, 'ohai[reload_aws]', :immediately
end
