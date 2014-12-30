#Where to write the status file for the process.
default['syncdata-nativex']['status_directory'] = "/mnt/ebs"
#The user to perform the rsync process.
default['syncdata-nativex']['user_name'] = "syncdata"
#The remote nodes fully qualified domain name.
default['syncdata-nativex']['remote_node_fqdn'] = "PAW1AL-NAS-01-prv.nativexintern.com"
#The remote nodes directory you want to sync locally.
default['syncdata-nativex']['source_directory'] = "/mnt/ebs"
#The local directory that will be synced with the remote node.
default['syncdata-nativex']['destination_directory'] = "/mnt/ebs"