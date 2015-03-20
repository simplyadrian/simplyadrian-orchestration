#
# Cookbook Name:: role-nat-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['ephemeral_lvm']['mount_point'] = "/mnt/ephemeral"
node.default['ephemeral_lvm']['filesystem'] = "xfs"
node.default['ephemeral_lvm']['volume_group_name'] = "vg_data_ephem"
node.default['ephemeral_lvm']['logical_volume_name'] = "lv_nat_raid0"
node.default['ntp']['servers'] = ["0.us.pool.ntp.org","1.us.pool.ntp.org","2.us.pool.ntp.org","3.us.pool.ntp.org"]
node.default['snmp']['community'] = "xmass1970"
node.default['snmp']['full_systemview'] = true
node.default['snmp']['sources'] = ["10.15.0.0/16", "localhost"]
node.default['snmp']['syslocationVirtual'] = "AWS Cloud - Virtual Pool, CentOS Linux 6.5, Linux Server"
node.default['snmp']['syscontact'] = "sysadmins <sysadmins@w3i.com>"
node.default['tuned']['active_profile'] = "virtual-guest"

include_recipe "ohai-nativex"
include_recipe "aws"
include_recipe "vim"
include_recipe "nano"
include_recipe "bash-completion"
include_recipe "dstat"
include_recipe "numad-nativex"
include_recipe "tuned-nativex"
include_recipe "nfs"
include_recipe "ephemeral_lvm-nativex"
include_recipe "snmp"
include_recipe "dnsupdate-nativex"
include_recipe "hostname-nativex"
include_recipe "yum-nativex::customrepo"
include_recipe "spacewalk-nativex"
include_recipe "pbis-nativex"
include_recipe "yum-nativex::doupgrade"
include_recipe "yum-nativex::deleterepo"
include_recipe "ntp"
include_recipe "motd"
include_recipe "chef-client::delete_validation"
include_recipe "chef-client"
