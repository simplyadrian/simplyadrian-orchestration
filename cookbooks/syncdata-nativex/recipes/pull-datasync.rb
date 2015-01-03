#
# Cookbook Name:: syncdata-nativex
# Recipe:: pull-datasync
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

template '/usr/local/bin/pull-datasync.rb' do
  action :create
  source 'pull-datasync.erb'
  mode '0744'
end

# Run channel update on the 3rd Tuesday of every month
cron 'pull-datasync' do
  action :create
  command "/usr/local/bin/pull-datasync.rb"
  minute '*'
end