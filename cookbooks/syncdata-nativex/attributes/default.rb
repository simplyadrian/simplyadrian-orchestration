#The remote nodes fully qualified domain name.
default['syncdata_nativex']['remote_node_fqdn'] = "PAW1AL-NAS-01-prv.nativexintern.com"
#The remote nodes directory you want to sync locally.
default['syncdata_nativex']['source_directory'] = "/mnt/ebs/"
#The local directory that will be synced with the remote node.
default['syncdata_nativex']['destination_directory'] = "/mnt/ebs/"
#The list of remote servers content is to be pushed to.
default['syncdata_nativex']['remote_servers'] = ["PAW2AL-NAS-02-prv.nativexintern.com","PAE1AL-NAS-03-prv.nativexintern.com"]
#The user the ssh keys will be generated for use by.
default['syncdata_nativex']['ssh']['user'] = "root"
#The group the ssh keys will be owned by.
default['syncdata_nativex']['ssh']['group'] = "root"
#The users home directory where the ssh keys will be generated and stored.
default['syncdata_nativex']['ssh']['home'] = "/root/.ssh"

