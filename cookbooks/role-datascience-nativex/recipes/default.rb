#
# Cookbook Name:: role-datascience-nativex
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['blockdevice_nativex']['dir'] = "/mnt/ebs"
node.default['blockdevice_nativex']['mount_point_group'] = "predictive_analytics"
node.default['blockdevice_nativex']['recurse_permissions'] = false
node.default['blockdevice_nativex']['filesystem'] = "xfs"
node.default['blockdevice_nativex']['ebs']['raid'] = false
node.default['blockdevice_nativex']['ebs']['size'] = 500 
node.default['ephemeral_lvm']['mount_point'] = "/mnt/ephemeral"
node.default['java']['install_flavor'] = "oracle"
node.default['java']['jdk_version'] = "7"
node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['mkdirs-nativex']['path'] = ["/automnt"]
node.default['nodejs']['npm_packages'] = [{:name => "async", :name => "aws-sdk", :name => "moment"}]
node.default['pbis-nativex']['organizational_unit_level_5'] = "Predictive Analytics"
node.default['python']['install_method'] = "source"
node.default['python']['version'] = "3.3.5"
node.default['python-nativex']['packages'] = ["pyyaml", "kombu", "lockfile", "asyncio", "paramiko", "boto", "awscli"]
node.default['r']['version'] = "3.1.2-1.el6"
node.default['r']['install_dir'] = "/usr/lib64/R"
node.default['r_nativex']['packages'] = ["optparse", "yaml", "data.table", "ffbase", "ROCR", "ETLUtils", "rjson", "RODBC", "ff", "gbm", "LaF"]
node.default['rabbitmq']['version'] = "3.3.5"
node.default['rabbitmq']['mnesiadir'] = "/mnt/ebs/rabbitmq_db"
node.default['rabbitmq']['logdir'] = "/mnt/ebs/log/rabbitmq"
node.default['rabbitmq']['enabled_users'] =
  [{ :name => 'datascience', :password => 'datascience', :tag => 'administrator', :rights =>
    [{ :conf => '.*', :write => '.*', :read => '.*' }]
  }]
node.default['tuned']['active_profile'] = "virtual-guest"

include_recipe 'role-base-nativex'
include_recipe 'cifs-nativex'
include_recipe 'git'
include_recipe 'blockdevice-nativex'
include_recipe 'blockdevice-nativex::tags'
include_recipe 'iptables-nativex::ssh'
include_recipe 'mkdirs-nativex'
include_recipe 'nodejs'
include_recipe 'python'
include_recipe 'python-nativex'
include_recipe 'r'
include_recipe 'r-nativex'
include_recipe 'rabbitmq'
include_recipe 'rabbitmq::mgmt_console'
include_recipe 'rabbitmq::user_management'
include_recipe 'tuned-nativex::apply_profile'
