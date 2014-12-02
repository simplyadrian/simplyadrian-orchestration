#
# Cookbook Name:: yum-nativex
# Recipe:: default
#
# Copyright 2014, NativeX 
#
# All rights reserved - Do Not Redistribute
#

package "yum-plugin-fastestmirror"
include_recipe "yum-nativex::customrepo"
