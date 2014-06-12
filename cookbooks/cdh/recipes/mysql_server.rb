#
# Cookbook Name:: cdh 
# Recipe:: mysql_server
#
# Copyright 2014, NativeX 
#
# All rights reserved - Do Not Redistribute
#

#mysql_secret = Chef::EncryptedDataBagItem.load_secret("#{node[:mysql][:secretpath]}")
#secrets = Chef::EncryptedDataBagItem.load("secrets", "mysql", "mysql_sercret")
#if secrets && mysql_passwords = secrets[node.chef_environment]
#  node['mysql']['server_root_password'] = mysql_passwords['root']
#  node['mysql']['server_repl_password'] = mysql_passwords['repl']
#end

include_recipe "mysql::server"
include_recipe "mysql-chef_gem"

sites = data_bag("cdh-sites")

sites.each do |site|
  opts = data_bag_item("cdh-sites", site)

  mysql_database opts["database"] do
    connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
    action :create
  end

  mysql_database_user opts["db_username"] do
    connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
    password opts["db_password"]
    database_name opts["database"]
    privileges [:select,:update,:insert,:create,:delete]
    host node['cdh']['db_user_host']
    action :grant
  end
end
