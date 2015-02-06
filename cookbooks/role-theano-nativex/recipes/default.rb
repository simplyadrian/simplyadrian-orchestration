#
# Cookbook Name:: role-theano-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['build-essential']['compile_time'] = true
node.default['apt']['compile_time_update'] = true
node.default['authorization']['sudo']['users'] = ["ubuntu","brett.stime","eric.li","henry.humadi","hui.li","james.shanahan","joel.barajas","liang.dai","sherry.sidhu","zhiyong.tan"]
node.default['authorization']['passwordless'] = true
node.default['blockdevice_nativex']['filesystem'] = "xfs"
node.default['blockdevice_nativex']['ebs']['raid'] = false
node.default['ephemeral_lvm']['mount_point'] = "/mnt/ephemeral"
node.default['ephemeral_lvm']['filesystem'] = "xfs"
node.default['ephemeral_lvm']['volume_group_name'] = "vg_data_ephem"
node.default['ephemeral_lvm']['logical_volume_name'] = "lv_theano_raid0"
node.default['ntp']['servers'] = ["0.us.pool.ntp.org","1.us.pool.ntp.org","2.us.pool.ntp.org","3.us.pool.ntp.org"]
node.default['snmp']['community'] = "xmass1970"
node.default['snmp']['full_systemview'] = true
node.default['snmp']['sources'] = ["10.15.0.0/16", "localhost"]
node.default['snmp']['syslocationVirtual'] = "AWS Cloud - Virtual Pool, CentOS Linux 6.5, Linux Server"
node.default['snmp']['syscontact'] = "sysadmins <sysadmins@w3i.com>"
node.default['xml']['compile_time'] = true
node.default['xml']['nokogiri']['version'] = "1.6.1"

include_recipe "ohai-nativex"
include_recipe "aws"
include_recipe "xml"
include_recipe "users::sysadmins"
include_recipe "sudo"
include_recipe "apt"
include_recipe "vim"
include_recipe "nano"
include_recipe "bash-completion"
include_recipe "dstat"
include_recipe "ephemeral_lvm-nativex"
include_recipe "blockdevice-nativex"
include_recipe "dnsupdate-nativex"
include_recipe "hostname-nativex::updatehostname"
include_recipe "iptables"
include_recipe "snmp"
include_recipe "ntp"
include_recipe "motd"
include_recipe "chef-client::delete_validation"
include_recipe "chef-client"