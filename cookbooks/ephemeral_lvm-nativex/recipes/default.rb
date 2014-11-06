#
# Cookbook Name:: ephemeral_lvm-nativex
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
# Conditionally includes the xfs default recipe to install the XFS filesystem, if that is the chosen filesystem for the ephemeral_lvm cookbook.
# If xfs is not chosen, this recipe is basically a no-op passthrough to ephemeral_lvm cookbook

include_recipe "xfs::default" if node['ephemeral_lvm']['filesystem'] == "xfs"
include_recipe "ephemeral_lvm::default"
