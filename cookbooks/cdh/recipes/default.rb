#
# Cookbook Name:: phpapp
# Recipe:: default
#
# Copyright 2014, NativeX 
#
# All rights reserved - Do Not Redistribute
#

include_recipe "cdh::mysql_server"
include_recipe "cdh::web"

