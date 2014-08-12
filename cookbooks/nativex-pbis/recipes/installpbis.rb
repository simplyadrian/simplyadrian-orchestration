#
# Cookbook Name:: nativex-pbis
# Recipe:: installpbis.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default["pbis_enterprise"]["rpm_url"] = "http://spacewalk.teamfreeze.com/nativex-custom/pbis-enterprise-8.0.1-2031.x86_64.rpm"
    
pbisRPM = File.basename(node["pbis_enterprise"]["rpm_url"])

remote_file "#{Chef::Config[:file_cache_path]}/#{pbisRPM}" do
  action :create_if_missing
  source node["pbis_enterprise"]["rpm_url"]
  mode "0755"
  backup false
  not_if "rpm -qa | grep -qx '[pbis_enterprise]'"
end

package pbisRPM do
   action :install
   source "#{Chef::Config[:file_cache_path]}/#{pbisRPM}"
   options "--nogpgcheck" # NativeX doesn't sign their RPMs o_O
end
