#
# Cookbook Name:: database
# Recipe:: create
#
# Copyright 2014, Adrian Herrera. All Rights Reserved.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "database::mysql"
include_recipe "mysql::server"
include_recipe "mysql-chef_gem"

# Store this in a variable so we don't keep repeating it
mysql_connection_info = {
    :host => "localhost",
    :username => 'root',
    # automatically get this from the override_attributes call!
    :password => node['mysql']['server_root_password']
}

sites = data_bag("cdh-sites")

sites.each do |site|
  opts = data_bag_item("cdh-sites", site)

  mysql_database opts["database"] do
    connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
    action :create
  end

  mysql_database_user opts["db_username"] do
    connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
    password opts["db_password"]
    database_name opts["database"]
    privileges [:select,:update,:insert,:create,:delete]
    host node['mysql']['db_user_host']
    action :grant
  end
end

# this isn't really necessary, as we're using root and not creating a database
# user, but I'm including it and commenting it out so you can see what it looks like
# mysql_database_user 'my_user' do
#  connection mysql_connection_info
#  database_name 'my_database'
#  action :grant
# end
