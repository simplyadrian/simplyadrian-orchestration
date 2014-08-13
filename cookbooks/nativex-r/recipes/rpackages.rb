#
# Cookbook Name:: nativex-r
# Recipe:: rpackages 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'r'

r_package "optparse"

r_package "yaml"

r_package "data.table"

r_package "ffbase"

r_package "rocr"

r_package "ETLUtils"

r_package "rjson"

r_package "RODBC"

r_package "ff"
