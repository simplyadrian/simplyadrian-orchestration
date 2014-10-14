#
# Cookbook Name:: ohai-aws
# Recipe:: default 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'ohai-aws::awsplugin'
include_recipe 'ohai-aws::cloudformationplugin'
include_recipe 'ohai-aws::elasticacheplugin'
include_recipe 'ohai-aws::elbplugin'
include_recipe 'ohai-aws::rdsplugin'
