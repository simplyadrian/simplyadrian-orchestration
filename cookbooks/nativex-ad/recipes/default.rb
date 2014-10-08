#
# Cookbook Name:: nativex-ad
# Recipe:: default 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nativex-ad::joindomain'
include_recipe 'nativex-ad::renamecomputer'
