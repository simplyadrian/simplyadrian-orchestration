#
# Cookbook Name:: role-win-onpremise-base-nativex
# Recipe:: default
#
# Copyright (C) 2015 NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "autopatch-nativex::default"
include_recipe "chef-client::delete_validation"
include_recipe "chef-client"
