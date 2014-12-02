#
# Cookbook Name:: r-nativex
# Recipe:: rpackages 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'r'

node['r_nativex']['packages'].each do |pkg|
  r_package pkg do
    action :install
  end
end