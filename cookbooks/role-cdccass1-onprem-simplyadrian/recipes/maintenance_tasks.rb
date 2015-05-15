#
# Cookbook Name:: role-cdccass1-onprem-simplyadrian
# Recipe:: maintenance_tasks
#
# Copyright (C) 2015 simplyadrian
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

cron "Cassandra Repair" do
  action node['role-cdccass1-onprem-simplyadrian']['cron_repair_enabled'] ? :create : :delete
  minute '0'
  hour '0'
  day '*'
  month '*'
  weekday '1-5'
  command '/root/cassandrascripts/repair'
end

cron "Cassandra ActivityTracking CF Drop" do
  action node['role-cdccass1-onprem-simplyadrian']['cron_activitytracking_drop_enabled'] ? :create : :delete
  minute '0'
  hour '9'
  day '*'
  month '*'
  weekday '1'
  command '/root/cassandrascripts/ActivityTrackingDropCF.sh 14'
end

cron "Cassandra ActivityTracking Remove Files" do
  action node['role-cdccass1-onprem-simplyadrian']['cron_activitytracking_file_cleanup_enabled'] ? :create : :delete
  minute '30'
  hour '9'
  day '*'
  month '*'
  weekday '1'
  command '/root/cassandrascripts/removeWeeklyActivityTrackingCFfiles.sh 14'
end

cron "Cassandra Take Snapshot" do
  action node['role-cdccass1-onprem-simplyadrian']['cron_take_snapshot_enabled'] ? :create : :delete
  minute '45'
  hour '9'
  day '*'
  month '*'
  weekday '1'
  command '/usr/bin/nodetool -h localhost snapshot'
end

cron "Cassandra Clear Snapshot" do
  action node['role-cdccass1-onprem-simplyadrian']['cron_clear_snapshot_enabled'] ? :create : :delete
  minute '15'
  hour '9'
  day '*'
  month '*'
  weekday '0,1,3-6'
  command '/usr/bin/nodetool -h localhost clearsnapshot'
end

cron "Cassandra Remove Backup Folders" do
  action node['role-cdccass1-onprem-simplyadrian']['cron_remove_backups_enabled'] ? :create : :delete
  minute '45'
  hour '9'
  day '*'
  month '*'
  weekday '1'
  command '/bin/rm -rf /var/lib/cassandra/data/*/*/backups'
end

cron "Cassandra Remove CommVault Incremental Folders" do
  action node['role-cdccass1-onprem-simplyadrian']['cron_remove_cvincrem_enabled'] ? :create : :delete
  minute '15'
  hour '9'
  day '*'
  month '*'
  weekday '*'
  command '/bin/rm -rf /var/lib/cassandra/data/*/*/cv_backups'
end

cron "Cassandra Remove CommVault Full Folders" do
  action node['role-cdccass1-onprem-simplyadrian']['cron_remove_cvfull_enabled'] ? :create : :delete
  minute '45'
  hour '9'
  day '*'
  month '*'
  weekday '1'
  command '/bin/rm -rf /var/lib/cassandra/data/*/*/cv_backups'
end

cron "Cassandra Move Backups for CommVault" do
  action node['role-cdccass1-onprem-simplyadrian']['cron_move_cvbackups_enabled'] ? :create : :delete
  minute '45'
  hour '9'
  day '*'
  month '*'
  weekday '0,2-6'
  command 'for i in /var/lib/cassandra/data/*/*/backups; do echo mv $i ${i/backups/cv_backups}; done | sh'
end
