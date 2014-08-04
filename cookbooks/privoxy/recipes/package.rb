#
# Cookbook Name:: privoxy
# Recipe:: package
# Author:: Rostyslav Fridman (<rostyslav.fridman@gmail.com>)
#
# Copyright 2014, Rostyslav Fridman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "yum-epel" if platform_family?("rhel")

package "privoxy" do
  action :install
end

case node['platform']
  when "redhat", "centos", "amazon", "scientific"
    template "/etc/init.d/privoxy" do
      source "privoxy.init.rhel.erb"
      owner  "root"
      group  "root"
      mode   00744
    end
end
