#
# Network
default['nfs-nativex']['network'] = '172.0.0.0/8'
# Writeable
default['nfs-nativex']['writeable'] = 'rw'
# synchronous/asynchronous export option
default['nfs-nativex']['sync'] = true
# options
default['nfs-nativex']['options'] = 'no_root_squash'