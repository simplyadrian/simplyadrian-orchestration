#
# Author: Randy Dickinson <rtd@i-x.net>
# Cookbook Name: likewise
# Provider: domain
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

include Chef::Likewise
include Chef::Likewise::RegistryHelpers

def load_current_resource
  Chef::Log.debug("Loading current resource for Likewise domain #{new_resource.name}")
  @current_resource = Chef::Resource::LikewiseRegistry.new new_resource.name
  @current_resource.value_set already_set?
end

action :set do
  Chef::Log.debug("Has the setting #{new_resource.name} already set? #{@current_resource.value_set.inspect}")
  unless @current_resource.value_set
    Chef::Log.info("*** Changing setting #{new_resource.name}..")
    change_registry_setting
    new_resource.updated_by_last_action(true)
  end
end
