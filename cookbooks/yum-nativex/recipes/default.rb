#
# Cookbook Name:: yum-nativex
# Recipe:: default
#
# Copyright 2014, NativeX 
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum-nativex::customrepo"
include_recipe "yum-nativex::doupgrade"
include_recipe "yum-nativex::deleterepo"
