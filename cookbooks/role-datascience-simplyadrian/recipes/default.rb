#
# Cookbook Name:: role-datascience-simplyadrian
# Recipe:: default
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

node.default['blockdevice_simplyadrian']['dir'] = "/mnt/ebs"
node.default['blockdevice_simplyadrian']['mount_point_group'] = "predictive_analytics"
node.default['blockdevice_simplyadrian']['recurse_permissions'] = false
node.default['blockdevice_simplyadrian']['filesystem'] = "xfs"
node.default['blockdevice_simplyadrian']['ebs']['raid'] = false
node.default['blockdevice_simplyadrian']['ebs']['size'] = 500 
node.default['ephemeral_lvm']['mount_point'] = "/mnt/ephemeral"
node.default['java']['install_flavor'] = "oracle"
node.default['java']['jdk_version'] = "7"
node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['mkdirs-simplyadrian']['path'] = ["/automnt"]
node.default['nodejs']['npm_packages'] = [{:name => "async", :name => "aws-sdk", :name => "moment"}]
node.default['pbis-simplyadrian']['organizational_unit_level_5'] = "Predictive Analytics" if File.directory?('/etc/pbis')
node.default['ad-simplyadrian']['organizational_unit_level_5'] = "Predictive Analytics"
node.default['python']['install_method'] = "source"
node.default['python']['version'] = "3.3.5"
node.default['python-simplyadrian']['packages'] = ["pyyaml", "kombu", "lockfile", "asyncio", "paramiko", "boto", "awscli"]
node.default['r']['version'] = nil
node.default['r']['install_dir'] = "/usr/lib64/R"
node.default['r_simplyadrian']['packages'] = ["optparse", "yaml", "data.table", "ffbase", "ROCR", "ETLUtils", "rjson", "RODBC", "ff", "gbm", "LaF"]
node.default['rabbitmq']['version'] = "3.3.5"
node.default['rabbitmq']['mnesiadir'] = "/mnt/ebs/rabbitmq_db"
node.default['rabbitmq']['logdir'] = "/mnt/ebs/log/rabbitmq"
node.default['rabbitmq']['enabled_users'] =
  [{ :name => 'datascience', :password => 'datascience', :tag => 'administrator', :rights =>
    [{ :conf => '.*', :write => '.*', :read => '.*' }]
  }]
node.default['tuned']['active_profile'] = "virtual-guest"

include_recipe 'role-base-simplyadrian'

node.default['authorization']['sudo']['groups'] = node['sudoers']['allowed_groups'].concat(['predictive_analytics', 'Data\ Science'])

include_recipe 'cifs-simplyadrian'
include_recipe 'git'
include_recipe 'blockdevice-simplyadrian'
include_recipe 'blockdevice-simplyadrian::tags'
include_recipe 'mkdirs-simplyadrian'
include_recipe 'nodejs'
include_recipe 'python'
include_recipe 'python-simplyadrian'
include_recipe 'r'
include_recipe 'r-simplyadrian'
include_recipe 'rabbitmq'
include_recipe 'rabbitmq::mgmt_console'
include_recipe 'rabbitmq::user_management'
include_recipe 'tuned-simplyadrian::apply_profile'
