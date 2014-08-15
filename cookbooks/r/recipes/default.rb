#
# Author:: Adrian Herrera(<adrian.herrera@nativex.com>)
# Cookbook Name:: R
# Recipe:: default
#
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

chef_gem "rinruby"
require 'fileutils'

if node['r']['install_repo']
  include_recipe "r::repo"
end

include_recipe "r::install_#{node['r']['install_method']}"

# Setting the default CRAN mirror makes
# remote administration of R much easier.
template "#{node['r']['install_dir']}/etc/Rprofile.site" do
  mode "0555"
  variables( :cran_mirror => node['r']['cran_mirror'])
end

dirname = "/usr/local/lib64/R/etc"
unless File.directory?(dirname)
  FileUtils.mkdir_p(dirname)
end
