include_recipe 'glusterfs-nativex::base'

package 'glusterfs-server' do
  action :install
end

service 'glusterd' do
  supports :status => true, :restart => true, :reload => true
  action :start
end

directory node[:glusterfs][:server][:export_directory] do
  action :create
  recursive true
end
