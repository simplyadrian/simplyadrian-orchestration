#
# Cookbook Name:: r-nativex
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

r_package "ROCR"

r_package "ETLUtils"

r_package "rjson"

r_package "RODBC"

r_package "ff"
