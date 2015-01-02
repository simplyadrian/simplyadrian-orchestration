#
# Cookbook Name:: syncdata-nativex
# Recipe:: pull-datasync
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

template '/usr/local/bin/push-datasync.rb' do
  action :create
  source 'push-datasync.erb'
  mode '0644'
end

# Run channel update on the 3rd Tuesday of every month
cron 'push-datasync' do
  action :create
  command "/usr/local/bin/push-datasync.rb"
  minute '*'
end