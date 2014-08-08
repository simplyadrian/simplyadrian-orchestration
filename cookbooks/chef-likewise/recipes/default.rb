#
# Author:: Randy Dickinson <rtd@i-x.net>
# Cookbook Name:: likewise
# Recipe:: default
#
# Copyright 2012, Randy Dickinson
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node[:platform]
  when "centos"
    package "pbis-open"
  when "ubuntu"
    package "likewise-open"
end

likewise_admin = Chef::EncryptedDataBagItem.load("passwords", "likewise_admin")

likewise_domain node[:likewise][:domain_fqdn] do
  machine_ou  node[:likewise][:machine_ou]
  admin_user  likewise_admin['username']
  admin_pass  likewise_admin['password']
end

bash "refresh_lsass" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    PATH=$PATH:/opt/pbis/bin lwsm refresh lsass
  EOH
  action :nothing
end

node[:likewise][:registry_settings].each_pair do |value_name,v|
  registry_key = v['registry_key']
  value_data = v['value_data']

  likewise_registry value_name do
    key         registry_key
    value_data  value_data
    notifies    :run, "bash[refresh_lsass]"
  end
end
