#
# Cookbook Name:: tuned-nativex
# Recipe:: apply_profile
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
# Sets a profile active.  If it is custom, installs the profile from the cookbook files directory.

# Look at the list of built-in profiles to determine if the one we're looking at is custom.
is_active_profile_custom = node['tuned']['known_custom_profiles'].include?(node['tuned']['active_profile'])

# Make sure the directory for the tune profile exists, if it is a custom profile.
directory "#{node['tuned']['profiles_dir']}/#{node['tuned']['active_profile']}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  only_if { is_active_profile_custom }
end

# Each custom profile should contain the same set of files that comprise the profile itself.
# A custom profile should have its own directory of these files in the cookbook/files/default/custom-profiles directory.
# Loop over them and ensure they exist and are correct. Again, only applies to custom profiles.
node['tuned']['files_in_each_profile'].each do |profile_file|
   cookbook_file "custom #{node['tuned']['active_profile']} profile #{profile_file}" do
     source "custom-profiles/#{node['tuned']['active_profile']}/#{profile_file}"
     path "#{node['tuned']['profiles_dir']}/#{node['tuned']['active_profile']}/#{profile_file}"
     owner 'root'
     group 'root'
     mode '0755'
     backup 2
     action :create
     notifies :run, "execute[Apply tuned profile #{node['tuned']['active_profile']}]", :delayed
     only_if { is_active_profile_custom }
  end
end

# Apply the profile unless it is already active.
execute "Apply tuned profile #{node['tuned']['active_profile']}" do
  command "tuned-adm profile #{node['tuned']['active_profile']}"
  timeout 60
  action :run
  notifies :restart, "service[tuned]", :immediately
  not_if "tuned-adm active | grep -q \": #{node['tuned']['active_profile']}$\""
end