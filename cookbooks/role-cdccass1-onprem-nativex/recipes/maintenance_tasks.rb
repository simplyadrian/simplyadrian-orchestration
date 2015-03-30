#
# Cookbook Name:: role-cdccass1-onprem-nativex
# Recipe:: maintenance_tasks
#
# Copyright (C) 2015 NativeX
#
# All rights reserved - Do Not Redistribute
#
# Sets up scheduled maintenance tasks (cluster repair, ActivityTracking CF drop, ActivityTracking data files cleanup, backups) using 'cron'

directory '/root/cassandrascripts' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

%w[ repair ActivityTrackingDropCF.sh removeWeeklyActivityTrackingCFfiles.sh ].each do |scriptFile|
  cookbook_file "Cassandra Script #{scriptFile}" do
    source "cassandrascripts/#{scriptFile}"
    path "/root/cassandrascripts/#{scriptFile}"
    group 'root'
    owner 'root'
    mode '0755'
    action :create
  end
end
