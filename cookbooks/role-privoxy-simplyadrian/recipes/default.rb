#
# Cookbook Name:: role-privoxy-simplyadrian
# Recipe:: default
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

node.default['tuned']['active_profile'] = "virtual-guest"

include_recipe "role-base-simplyadrian"
include_recipe "privoxy-simplyadrian"