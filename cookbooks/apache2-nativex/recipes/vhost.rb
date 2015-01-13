#
# Cookbook Name:: apache2-nativex
# Recipe:: vhost
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"

# Set up the Apache virtual host 
web_app "#{node['apache2-nativex']['app_name']}" do 
  server_name node['hostname']
  docroot "#{node['apache2']['docroot_dir']}"
  server_aliases [node['fqdn'], node['hostname']]
  directory_options "Indexes FollowSymLinks Includes ExecCGI"
  allow_override "All" 
  template "web_app.conf.erb" 
  log_dir node['apache']['log_dir'] 
end

directory "#{node['apache2']['docroot_dir']}/#{node['apache2-nativex']['app_name']}" do
  owner "apache" 
  group "apache"
  mode "0755"
  action :create
  recursive true
end

template "#{node['apache2']['docroot_dir']}/#{node['apache2-nativex']['app_name']}/index.html" do
  source "index.html.erb"
  mode "0644"
end
