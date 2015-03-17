#
# Cookbook Name:: role-win-base-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ohai-nativex"
include_recipe "aws"
include_recipe "windows"
include_recipe "ad-nativex::joindomain",
include_recipe "ad-nativex::renamecomputer",
include_recipe "dnsupdate-nativex::addprv"
include_recipe "autopatch-nativex::default"
include_recipe "chef-client::delete_validation"
include_recipe "chef-client"