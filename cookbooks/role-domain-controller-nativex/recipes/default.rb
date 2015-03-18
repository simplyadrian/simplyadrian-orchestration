#
# Cookbook Name:: role-domain-controller-nativex
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['ad-nativex']['oupath'] = "OU=Domain Controllers,DC=teamfreeze,DC=com"

include_recipe "aws"
include_recipe "windows"
include_recipe "ad-nativex::joindomain"
include_recipe "ad-nativex::renamecomputer"
include_recipe "ad-nativex::installdomaincontroller"
include_recipe "dnsupdate-nativex"
include_recipe "chef-client::delete_validation"
include_recipe "chef-client"






