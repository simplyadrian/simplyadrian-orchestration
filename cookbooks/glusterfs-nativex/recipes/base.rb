include_recipe 'yum'

yum_repository 'glusterfs-epel' do
  description 'GlusterFS is a clustered file-system capable of scaling to several petabytes. - EPEL'
  baseurl 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/epel-$releasever/$basearch/'
  gpgcheck true
  gpgkey 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/pub.key'
  action :create
end

yum_repository 'glusterfs-noarch-epel' do
  description 'GlusterFS is a clustered file-system capable of scaling to several petabytes. - NOARCH'
  baseurl 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/epel-$releasever/noarch'
  gpgcheck true
  gpgkey 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/pub.key'
  action :create
end

yum_repository 'glusterfs-source-epel' do
  description 'GlusterFS is a clustered file-system capable of scaling to several petabytes. - Source'
  baseurl 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/epel-$releasever/SRPMS'
  gpgcheck true
  gpgkey 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/pub.key'
  action :create
end