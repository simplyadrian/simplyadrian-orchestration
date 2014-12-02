#
# Export Directory
default['nfs-nativex']['export_dir'] = "/mnt/ebs"
# Network
default['nfs-nativex']['network'] = "172.16.0.0/12"
# Writeable ro/rw
default['nfs-nativex']['writeable'] = false
# synchronous/asynchronous export option
default['nfs-nativex']['sync'] = true
# options
default['nfs-nativex']['options'] = ['no_root_squash']
