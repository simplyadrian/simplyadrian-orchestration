#
# Cookbook Name:: nativex-dnsupdate
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nativex-dnsupdate::addpub.rb"
include_recipe "nativex-dnsupdate::addprv.rb"
