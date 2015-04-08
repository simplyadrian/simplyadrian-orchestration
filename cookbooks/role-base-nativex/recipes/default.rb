#
# Cookbook Name:: role-base-nativex
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

node.default['autopatch-nativex']['auto_reboot_enabled'] = true
node.default['build-essential']['compile_time'] = true
node.default['ntp']['servers'] = ["0.us.pool.ntp.org","1.us.pool.ntp.org","2.us.pool.ntp.org","3.us.pool.ntp.org"]
node.default['snmp']['community'] = "xmass1970"
node.default['snmp']['full_systemview'] = true
node.default['snmp']['sources'] = ["10.15.0.0/16", "localhost"]
node.default['snmp']['syslocationVirtual'] = "AWS Cloud - Virtual Pool, CentOS Linux 6.5, Linux Server"
node.default['snmp']['syscontact'] = "sysadmins <sysadmins@w3i.com>"
node.default['sudoers']['allowed_groups'] = ['admins']
node.default['sshd']['allowed_groups'] = ['root', 'admins'].concat(node['sudoers']['allowed_groups']).uniq
node.default['sshd']['sshd_config'] = {
  'Port' => 22,
  'Protocol' => 2,
  'HostKey' => %w(/etc/ssh/ssh_host_rsa_key
                  /etc/ssh/ssh_host_ed25519_key
                  /etc/ssh/ssh_host_dsa_key
                  /etc/ssh/ssh_host_ecdsa_key),
  'AcceptEnv' => 'LANG LANGUAGE LC_* XMODIFIERS',
  'PasswordAuthentication' => 'yes',
  'ChallengeResponseAuthentication' => 'yes',
  'X11Forwarding' => 'yes',
  'Subsystem' => 'sftp /usr/libexec/openssh/sftp-server',
  'GSSAPIKeyExchange' => 'yes',
  'GSSAPIAuthentication' => 'yes',
  'GSSAPICleanupCredentials' => 'yes',
  'UsePAM' => 'yes',
  'SyslogFacility' => 'AUTHPRIV',
  'UseDNS' => 'no',
  'LoginGraceTime' => '2m',
  'StrictModes' => 'yes',
  'MaxAuthTries' => 6,
  'AllowGroups' => node['sshd']['allowed_groups']
}
node.default['authorization']['sudo']['sudoers_defaults'] = [ 
  'requiretty',
  '!visiblepw', 
  'env_reset', 
  'env_keep = "COLORS DISPLAY HOSTNAME HISTSIZE INPUTRC KDEDIR LS_COLORS"', 
  'env_keep += "MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE"', 
  'env_keep += "LC_COLLATE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES"', 
  'env_keep += "LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE"', 
  'env_keep += "LC_TIME LC_ALL LANGUAGE LINGUAS _XKB_CHARSET XAUTHORITY"', 
  'env_keep += "HOME"', 
  'always_set_home', 
  'secure_path = /sbin:/bin:/usr/sbin:/usr/bin' 
]
node.default['authorization']['sudo']['groups'] = node['sudoers']['allowed_groups']
node.default['tuned']['active_profile'] = "virtual-guest"

include_recipe 'ohai-nativex'
include_recipe 'chef-sugar'
include_recipe 'aws'
include_recipe 'vim'
include_recipe 'nano'
include_recipe 'bash-completion'
include_recipe 'dstat'
include_recipe 'numad-nativex'
include_recipe 'tuned-nativex'
include_recipe 'nfs'
include_recipe 'ephemeral_lvm-nativex'
include_recipe 'snmp'
include_recipe 'sshd'
include_recipe 'sudo'
include_recipe 'hostname-nativex'
include_recipe 'yum-nativex'
include_recipe 'yum-epel'
include_recipe 'spacewalk-nativex'
include_recipe 'ad-nativex'
include_recipe 'auto-patch'
include_recipe 'autofs-nativex'
include_recipe 'yum-nativex::deleterepo'
include_recipe 'yum-nativex::doupgrade_once'
include_recipe 'autopatch-nativex::default'
include_recipe 'ntp'
include_recipe 'motd'
include_recipe 'chef-client::delete_validation'
include_recipe 'chef-client'
