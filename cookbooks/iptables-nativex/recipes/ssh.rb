#
# Cookbook Name:: iptables-nativex
# Recipe:: ssh.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Have we decided to lock down the node?
if node['iptables-nativex']['ssh']['addresses'].empty?
  # Use the all_ssh rule
  iptables_rule "all_ssh"
  # Disable the network ssh rule
  iptables_rule "network_ssh", :enable => false
else
  # Use the network rule
  iptables_rule "network_ssh"
  # Disable the all traffic rule
  iptables_rule "all_ssh", :enable => false
end
