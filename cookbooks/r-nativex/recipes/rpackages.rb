#
# Cookbook Name:: r-nativex
# Recipe:: rpackages 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'r'

require "rinruby"
R.echo(enable=false)
R.eval "packages <- installed.packages()[,1]"
installed_r_packages = R.pull "packages"

node['r_nativex']['packages'].each do |pkg|
  unless installed_r_packages.include?(pkg)
    r_package pkg do
      action :install
    end
  end
end