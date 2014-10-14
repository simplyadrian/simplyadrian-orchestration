#Install the datastax-agent package
package "datastax-agent" do
  version node['opscenter-agent']['version']
  action :install
end

#Set up the stomp IP (the IP of Opscenter)
template "#{node['opscenter-agent']['conf_dir']}/address.yaml" do
   source "address.yaml.erb"
   notifies :restart, "service[datastax-agent]"
 end

#Restart the agent
service "datastax-agent" do
  supports :restart => true, :status => true
  action [:enable, :start]
end
