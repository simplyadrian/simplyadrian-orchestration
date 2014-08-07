#
# Author:: Randy Dickinson <rtd@i-x.net>
# Cookbook Name:: likewise
# Resource:: domain
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

actions :join, :unjoin

attribute :name, :name_attribute => true, :kind_of => String, :regex => /[a-zA-Z0-9\-\.]+\.$/
attribute :machine_ou, :kind_of => String
attribute :admin_user, :kind_of => String
attribute :admin_pass, :kind_of => String
attribute :joined, :default => false

def initialize(*args)
  super
  @action = [ :join ]
end
