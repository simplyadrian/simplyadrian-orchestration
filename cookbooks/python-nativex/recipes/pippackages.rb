#
# Cookbook Name:: python-nativex
# Recipe:: pippackages.rb 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'python'

node['python_nativex']['packages'].each do |pkg|
  python_pip pkg do
    action :install
  end
end