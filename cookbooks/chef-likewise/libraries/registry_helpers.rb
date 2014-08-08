#
# Author: Randy Dickinson <rtd@i-x.net>
# Cookbook Name: likewise
# Library: registry
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
    module Likewise::RegistryHelpers

      def already_set?
        # Need something to parse the output of regshell export
        # to deterimine if key is already set.  For now just refresh
        # lsass on each run.
        return false
      end

      def change_registry_setting
        value_data = ""
        regshell_cmd = ""
        cmd = ""

        if new_resource.value_data.kind_of?(Array)
          a = new_resource.value_data.map {|x| "\"#{x}\""}
          value_data = a.join(" ")
        else
          value_data = "\"#{new_resource.value_data}\""
        end

        case node[:platform]
          when "centos"
            regshell_cmd = "regshell"
          else
            regshell_cmd = "lwregshell"
        end

        cmd = "PATH=$PATH:/opt/pbis/bin #{regshell_cmd} set_value \
              \'#{new_resource.key}\' \
              \'#{new_resource.value_name}\' \
              #{value_data}"

        result = shell_out!(cmd, :returns => [0,1])
      end

    end
  end
end
