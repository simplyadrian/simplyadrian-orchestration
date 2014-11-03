default[:blockdevice_nativex][:ec2] = false
default[:blockdevice_nativex][:dir] = '/mnt/ebs'
default[:blockdevice_nativex][:filesystem] = 'ext4'
default[:blockdevice_nativex][:snapshots_to_keep] = 30
default[:blockdevice_nativex][:ebs] = {
  :raid => true,
  :count=> 4,
  :size => 1024, # size is in GB
  :level => 10
}
