#
# Cookbook Name:: role-onpremise-createsession-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['java']['install_flavor'] = "oracle"
node.default['java']['jdk_version'] = "7"
node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['nodejs']['npm_packages'] = [{:name => "async", :name => "aws-sdk", :name => "moment"}]

include_recipe 'role-onpremise-base-nativex'
include_recipe 'git'
include_recipe 'nodejs'
include_recipe 'snowflake-nativex'
