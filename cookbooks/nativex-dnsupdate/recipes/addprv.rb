#
# Cookbook Name:: nativex-dnsupdate
# Recipe:: addprv.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

require 'net/http'
include_recipe 'route53'

aws = Chef::EncryptedDataBagItem.load("credentials", "aws")
full_nodename = "#{node.name}-prv.#{node['nativex-dnsupdate']['int_domain']}"
route53_record "create a record" do
  name                   full_nodename
  value                  Net::HTTP.get(URI.parse('http://169.254.169.254/latest/meta-data/local-ipv4'))
  type                   "A"
  zone_id                node['nativex-dnsupdate']['zone_id']
  aws_access_key_id      aws["aws_access_key_id"]
  aws_secret_access_key  aws["aws_secret_access_key"]
  ttl                    60
  action :create
end
