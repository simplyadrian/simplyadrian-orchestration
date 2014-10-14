#
# Cookbook Name:: nativex-dse
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#
# Default behavior is to install Apache Cassandra DSE component only, alongside an OpsCenter agent.

include_recipe "cassandra"
include_recipe "opscenter-agent" if node['opscenter-agent']['enabled']
