#
# Cookbook Name:: nativex-yum
# Recipe:: default
#
# Copyright 2014, NativeX 
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nativex-yum::customrepo"
include_recipe "nativex-yum::deleterepo"
include_recipe "nativex-yum::doupgrade"
