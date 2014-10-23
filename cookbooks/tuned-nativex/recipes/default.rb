#
# Cookbook Name:: tuned-nativex
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute

# Install tuned
package "tuned" do
  action :install
end

# Start the tuned service
service "tuned" do
  action [:enable, :start]
end
