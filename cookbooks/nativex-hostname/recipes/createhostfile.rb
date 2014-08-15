#
# Cookbook Name:: nativex-hostname
# Recipe:: createhostfile
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

hostsfile_entry '1.2.3.4' do
  hostname  'example.com'
  action    :create
end
