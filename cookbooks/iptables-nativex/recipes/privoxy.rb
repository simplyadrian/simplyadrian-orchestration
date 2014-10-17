#
# Cookbook Name:: iptables-nativex
# Recipe:: privoxy.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Have we decided to lock down the node?
if node['iptables-nativex']['privoxy']['addresses'].empty?
  # Use the all_privoxy rule
  iptables_rule "all_privoxy"
  # Disable the network privoxy rule
  iptables_rule "network_privoxy", :enable => false
else
  # Use the network rule
  iptables_rule "network_privoxy"
  # Disable the all traffic rule
  iptables_rule "all_privoxy", :enable => false
end
