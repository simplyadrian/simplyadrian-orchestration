#
## Cookbook Name:: nativex-dse
## Recipe:: determine_seeds.rb
##
## Copyright 2014, NativeX
##
## All rights reserved - Do Not Redistribute
##

ruby_block "determine_seeds" do
  block do
    cluster_name = node['cassandra']['cluster_name']
    datacenter_name = node['cassandra']['datacenter']
    cluster_info_hash =  node['cassandra']['cluster_dc_info']

    Chef::Log.warn("Cluster name: #{cluster_name}")
    Chef::Log.warn("Datacenter name: #{datacenter_name}")
    Chef::Log.warn("Cluster info: #{cluster_info_hash}")
	Chef::Log.warn("Current local seeds: #{node['cassandra']['seeds']}")
	
	if cluster_info_hash.has_key?(datacenter_name) &&
	   cluster_info_hash[datacenter_name].has_key?('seeds')
	  if cluster_info_hash[datacenter_name]['seeds'].length < node['cassandra']['num_seeds_per_dc'] 
        Chef::Log.warn("I should need to do something!!")
	  else
	    Chef::Log.warn("I have enough seeds in my DC.")
	  end
    else
      Chef::Log.warn("No seeds defined yet for cluster '#{cluster_name}' and datacenter '#{datacenter_name}'.")
    end

    all_known_seeds = Set.new
    known_seeds_my_dc = Set.new
    my_cluster_nodes = search(:node, "cassandra.cluster_name:#{cluster_name}")
    if my_cluster_nodes != nil && my_cluster_nodes.length > 0
	  # skip myself
	  my_cluster_nodes.keep_if { |a_node| a_node.ipaddress != node['ipaddress'] }
      # Loop over all the other nodes in 'this' cluster. See what they have for Seeds in each DC
      my_cluster_nodes.each do |another_node|
        another_node.casssandra.cluster.dc_info.each do |dc, info| #key-> DC name, values-> hash containing seeds array
          all_known_seeds.merge(info.seeds)
          if dc == datacenter_name # 'my' datacenter
		    known_seeds_my_dc.merge(info.seeds)
          end
        end
      end
	end
	
	if known_seeds_my_dc.length < node['cassandra']['num_seeds_per_dc'] && !known_seeds_my_dc.include?(node['ipaddress'])
	  Chef::Log.warn("There are only #{known_seeds_my_dc.length} seeds in my DC, and I am not one of them. Adding myself.")
	  known_seeds_my_dc << node['ipaddress']
	  all_known_seeds << node['ipaddress']
	  node.set['cassandra']['cluster_dc_info'][datacenter_name]['seeds'] = known_seeds_my_dc.to_a
	  node.set['cassandra']['seeds'] = all_known_seeds.to_a.join(", ") # seeds in the yaml file is comma separated list
	end
  end
  action :run
end
