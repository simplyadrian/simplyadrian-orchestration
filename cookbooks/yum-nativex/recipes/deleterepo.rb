#
# Cookbook Name:: yum-nativex
# Recipe:: deleterepo.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

repositories = %w(
    CentOS-Base
    CentOS-Media
    CentOS-Debuginfo
    CentOS-Vault
    rightlink
    epel
    spacewalk-client
    base
    extras
)

repositories.each do |r|
  yum_repository r do
    action :delete
  end
end
