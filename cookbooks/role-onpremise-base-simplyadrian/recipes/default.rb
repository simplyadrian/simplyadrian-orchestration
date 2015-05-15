#
# Cookbook Name:: role-onpremise-base-simplyadrian
# Recipe:: default
#
# Copyright (C) 2015 simplyadrian
#
# All rights reserved - Do Not Redistribute
#

node.default['ad-simplyadrian']['domain_controllers'] = {
    'us-west-1' => {
        'primary' => 'PAW1AM-DC-05',
        'backup' => 'PAW1CM-DC-06'
    },
    'us-west-2' => {
        'primary' => 'PAW2AM-DC-01',
        'backup' => 'PAW2BM-DC-02'
    },
    'us-east-1' => {
        'primary' => 'PAE1CM-DC-03',
        'backup' => 'PAE1DM-DC-04'
    },
    'on-premise' => {
        'primary' => 'STHO-DC-1',
        'backup' => 'STHO-DC-2'
    }
}
node.default['ad-simplyadrian']['sssd_ldap']['ldap_uri'] = 'ldap://teamfreeze.com'
node.default['ad-simplyadrian']['sssd_ldap']['ldap_search_base'] = 'dc=teamfreeze,dc=com'
node.default['ad-simplyadrian']['sssd_ldap']['ldap_user_search_base'] = 'dc=teamfreeze,dc=com'
node.default['ad-simplyadrian']['sssd_ldap']['ldap_group_search_base'] = 'dc=teamfreeze,dc=com'
node.default['ad-simplyadrian']['sssd_ldap']['ldap_sudo'] = true
node.default['ad-simplyadrian']['sssd_ldap']['override_homedir'] = '/home/TEAMFREEZE/%u'
authorized_users = [
    'predictive_analytics',
    'Data\ Science'
]
hadoop_users = [
    'hadoop_admins',
    'hadoop_developers',
    'hadoop_release',
    'Hadoop\ Admins',
    'Hadoop\ Developers',
    'Hadoop\ Release',
    'predictive_analytics',
    'Data\ Science'
]
node.default['autopatch-simplyadrian']['auto_reboot_enabled'] = true
node.default['ntp']['servers'] = ["10.15.0.108","10.15.0.109","10.12.34.11","10.12.34.12"]
node.default['ntp']['conf_restart_immediate'] = true
node.default['sudoers']['allowed_groups'] = ['admins', 'domain\ admins', 'system\ administrators\ gs']
node.default['sshd']['allowed_groups'] = ['root'].concat(node['sudoers']['allowed_groups'].map{ |group| group.gsub('\ ','?') }).uniq
node.default['sshd']['allowed_groups'] = node['sshd']['allowed_groups'].concat(hadoop_users.map{ |group| group.gsub('\ ','?') }).uniq if node['hostname'].upcase.include? 'HDP' # Only on Hadoop nodes
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
node.default['authorization']['sudo']['groups'] = node['sudoers']['allowed_groups'].concat(authorized_users)
node.default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'].concat(hadoop_users) if node['hostname'].upcase.include? 'HDP' # Only on Hadoop nodes
# mapper options
node.default['autofs-simplyadrian']['maps'] = [{:mount_dir => '/home',
									  :key => 'TEAMFREEZE',
									  :source => '/etc/auto.TEAMFREEZE',
									  :options => '-rw,intr,rsize=8192,wsize=8192',
									  :export => '/linuxhome'}]

include_recipe 'chef-sugar'
include_recipe 'ntp'
include_recipe 'autopatch-simplyadrian::default'
include_recipe 'sshd'
include_recipe 'sudo'
include_recipe 'ad-simplyadrian'
include_recipe 'autofs-simplyadrian'
include_recipe 'chef-client::delete_validation'
include_recipe 'chef-client'
