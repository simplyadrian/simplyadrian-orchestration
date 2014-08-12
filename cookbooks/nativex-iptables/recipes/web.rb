#
# Cookbook Name:: nativex-iptables
# Recipe:: web.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Have we decided to lock down the node?
if node['nativex-iptables']['web']['addresses'].empty?
  # Use the all_ rules
  iptables_rule "all_http"
  iptables_rule "all_https"
  # Disable the network rules
  iptables_rule "network_http", :enable => false
  iptables_rule "network_https", :enable => false
else
  # Use the network rule
  iptables_rule "network_http"
  iptables_rule "network_https"
  # Disable the all traffic rules
  iptables_rule "all_http", :enable => false
  iptables_rule "all_https", :enable => false
end
