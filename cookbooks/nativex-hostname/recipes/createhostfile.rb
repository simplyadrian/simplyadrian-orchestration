#
# Cookbook Name:: nativex-hostname
# Recipe:: createhostfile
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

require 'net/http'

hostname = Net::HTTP.get(URI.parse('http://169.254.169.254/latest/meta-data/local-ipv4'))
full_nodename = "#{node.name}-prv.#{node['nativex-dnsupdate']['int_domain']}"

hostsfile_entry "#{hostname}" do
  hostname  "#{full_nodename}"
  action    :create
end

bash "set hostname" do
  user "root"
  code <<-EOH
  (hostname #{full_nodename})
  EOH
end
