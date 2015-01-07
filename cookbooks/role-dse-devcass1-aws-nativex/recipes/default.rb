#
# Cookbook Name:: role-dse-devcass1-aws-nativex
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#
node.default['tuned']['active_profile'] = "cassandra-ssd-storage"
node.default['cassandra']['cluster_name'] = "dev-cass1"
node.default['cassandra']['cluster_dc_info'] = { "dev-cass1": { "seeds": ["10.15.72.101", "10.15.72.102"] }, "us-west-1": { "seeds": ["172.28.12.144", "172.28.22.105"] } }
node.default['cassandra']['seeds'] = "10.15.72.101,10.15.72.102,172.28.12.144,172.28.22.105"
node.default['cassandra']['auto_bootstrap'] = false
node.default['cassandra']['max_hint_window_in_ms'] = 604800000
node.default['cassandra']['hinted_handoff_throttle_in_kb'] = 512
node.default['cassandra']['max_hints_delivery_threads'] = 4
node.default['cassandra']['partitioner'] = "org.apache.cassandra.dht.RandomPartitioner"
node.default['cassandra']['memory_allocator'] = "JEMallocAllocator"
node.default['cassandra']['concurrent_writes'] = 64
node.default['cassandra']['memtable_total_space_in_mb'] = 1024
node.default['cassandra']['rpc_address'] = "0.0.0.0"
node.default['cassandra']['rpc_server_type'] = "hsha"
node.default['cassandra']['rpc_min_threads'] = 16
node.default['cassandra']['rpc_max_threads'] = 2048
node.default['cassandra']['batch_size_warn_threshold_in_kb'] = 64
node.default['cassandra']['in_memory_compaction_limit'] = 256
node.default['cassandra']['compaction_throughput_mb_per_sec'] = 64
node.default['cassandra']['read_request_timeout_in_ms'] = 10000
node.default['cassandra']['write_request_timeout_in_ms'] = 10000
node.default['cassandra']['cross_node_timeout'] = true
node.default['cassandra']['phi_convict_threshold'] = 12
node.default['cassandra']['endpoint_snitch'] = "com.datastax.bdp.snitch.DseDelegateSnitch"
node.default['cassandra']['dynamic_snitch_badness_threshold'] = 0.2
node.default['cassandra']['inter_dc_tcp_nodelay'] = false
node.default['cassandra']['inter_dc_stream_throughput_outbound_Mbps'] = 10
node.default['cassandra']['max_heap_size'] = "2G"
node.default['cassandra']['heap_newsize'] = "200M"
node.default['cassandra']['jvm_gc_UseNUMA'] = true
node.default['cassandra']['gc_log_PrintGCDetails'] = true
node.default['cassandra']['gc_log_PrintGCDateStamps'] = true
node.default['cassandra']['gc_log_PrintHeapAtGC'] = true
node.default['cassandra']['gc_log_PrintTenuringDistribution'] = true
node.default['cassandra']['gc_log_PrintGCApplicationStoppedTime'] = true
node.default['cassandra']['gc_log_PrintPromotionFailure'] = true
node.default['cassandra']['gc_log_PrintFLSStatistics'] = true
node.default['cassandra']['gc_log_Xloggc'] = "gc.log"
node.default['cassandra']['gc_log_UseGCLogFileRotation'] = true
node.default['cassandra']['gc_log_NumberOfGCLogFiles'] = 10
node.default['cassandra']['gc_log_GCLogFileSize'] = "10M"
node.default['cassandra']['log_syslog_enabled'] = true
node.default['cassandra']['log_syslog_host'] = "10.15.0.249"
node.default['dse']['delegated_snitch'] = "org.apache.cassandra.locator.GossipingPropertyFileSnitch"
node.default['opscenter-agent']['opscenter-ip'] = "10.15.72.5"
node.default['opscenter-agent']['is_opscenter_cluster_configured'] = true

include_recipe "role-dse-nativex"