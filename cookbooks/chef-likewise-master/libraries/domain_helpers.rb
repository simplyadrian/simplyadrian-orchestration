#
# Author: Randy Dickinson <rtd@i-x.net>
# Cookbook Name: likewise
# Library: domain
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

require 'chef/mixin/command'
require 'chef/mixin/language'
require 'chef/mixin/shell_out'
include Chef::Mixin::Command
include Chef::Mixin::ShellOut

class Chef
  module Likewise
    module Likewise::DomainHelpers

      def domain_joined?
        cmd = "domainjoin-cli query | egrep -i \"Domain = #{new_resource.name}\""
        result = shell_out!(cmd, :returns => [0,1])
        if result.status.exitstatus == 0
          return true
        end
       return false
      end

      def join_domain
        cmd = "domainjoin-cli join \
          --ou \'#{new_resource.machine_ou}\' \
          \'#{new_resource.name}\' \
          \'#{new_resource.admin_user}\' \
          \'#{new_resource.admin_pass}\'"
        result = shell_out!(cmd, :returns => [0,1])
      end

      def unjoin_domain
        cmd = "domainjoin-cli leave \
          \'#{new_resource.admin_user}\' \
          \'#{new_resource.admin_pass}\'"
        result = shell_out!(cmd, :returns => [0,1])
      end

    end
  end
end
