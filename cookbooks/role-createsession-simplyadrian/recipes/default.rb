#
# Cookbook Name:: role-createsession-simplyadrian
# Recipe:: default
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

node.default['ephemeral_lvm']['mount_point'] = "/mnt/ephemeral"
node.default['java']['install_flavor'] = "oracle"
node.default['java']['jdk_version'] = "7"
node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['nodejs']['npm_packages'] = [{:name => "async", :name => "aws-sdk", :name => "moment"}]

include_recipe 'role-base-simplyadrian'
include_recipe 'role-base-simplyadrian::git_auth'
include_recipe 'git'
include_recipe 'nodejs'
include_recipe 'snowflake-simplyadrian'
include_recipe 'tuned-simplyadrian::apply_profile'


