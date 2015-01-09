#
# Cookbook Name:: r-nativex
# Recipe:: rpackages 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'r'

installed_r_packages = []
begin
	require "rinruby"
	R.echo(enable=false)
	R.eval "packages <- installed.packages()[,1]"
	installed_r_packages = R.pull "packages"
rescue Exception => e
	# Ignore on compile phase of bootstrap/new-host when R isn't installed yet.
	# Accept empty package list default.
	unless e.message == "No such file or directory - R --interactive --slave"
		raise e
	end
end

node['r_nativex']['packages'].each do |pkg|
  unless installed_r_packages.include?(pkg)
    r_package pkg do
      action :install
    end
  end
end