#
# Cookbook Name:: dstat
# Recipe:: default
#
# Copyright 2014, Shinya Furuwata
#
# All rights reserved - Do Not Redistribute
#

package "dstat" do
	action :install
end

cookbook_file "/etc/profile.d/dstat.sh" do
	source "dstat.sh"
	owner "root"
	group "root"
	mode "0755"
end

