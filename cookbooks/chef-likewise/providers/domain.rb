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
include Chef::Likewise::DomainHelpers

def load_current_resource
  Chef::Log.debug("Loading current resource for Likewise domain #{new_resource.name}")
  @current_resource = Chef::Resource::LikewiseDomain.new new_resource.name
  @current_resource.joined domain_joined?
end

action :join do
  Chef::Log.debug("Are we joined to domain #{new_resource.name}? #{@current_resource.joined.inspect}")
  unless @current_resource.joined
    Chef::Log.info("*** Joining domain #{new_resource.name}..")
    join_domain
    new_resource.updated_by_last_action(true)
  end
end

action :unjoin do
  Chef::Log.debug("Are we joined to domain #{new_resource.name}? #{@current_resource.joined.inspect}")
  if @current_resource.joined
    Chef::Log.info("*** Unjoining domain #{new_resource.name}..")
    unjoin_domain
    new_resource.updated_by_last_action(true)
  end
end
