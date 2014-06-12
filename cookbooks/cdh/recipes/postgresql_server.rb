#
# Cookbook Name:: cdh 
# Recipe:: postgresql_server
#
# Copyright 2014, NativeX 
#
# All rights reserved - Do Not Redistribute
#

include_recipe "postgresql::server"

sites = data_bag("cdh-sites")

sites.each do |site|
  opts = data_bag_item("cdh-sites", site)

  postgresql_database opts["database"] do
    connection ({:host => 'localhost', :username => 'root', :password => node['postgresql']['server_root_password']})
    action :create
  end

  postgresql_database_user opts["db_username"] do
    connection ({:host => 'localhost', :username => 'root', :password => node['postgresql']['server_root_password']})
    password opts["db_password"]
    database_name opts["database"]
    privileges [:select,:update,:insert,:create,:delete]
    host node['cdh']['db_user_host']
    action :grant
  end
end
