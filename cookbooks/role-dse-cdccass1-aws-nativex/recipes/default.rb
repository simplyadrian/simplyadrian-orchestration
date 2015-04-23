#
# Cookbook Name:: role-dse-cdccass1-aws-nativex
# Recipe:: default
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

# Listing most attributes to have some security around defaults changing in Production as well as a single place to view attributes.
# Some are pushed up to the environment to allow testing the role in dev without joining the production cluster (seeds, cluster name, etc)
# General info
# Override 'role-dse-nativex' (which itself overrides role-base-nativex)
node.override['tuned']['active_profile']                                 = "cassandra-ssd-storage"
node.default['cassandra']['dse_version']                                 = "4.5.3-1"
node.default['cassandra']['user']                                        = "cassandra"
node.default['cassandra']['group']                                       = "cassandra"
node.default['cassandra']['root_dir']                                    = "/var/lib/cassandra/"
node.default['cassandra']['log_directory']                               = "/var/log/cassandra/"
node.default['cassandra']['heapdump_dir']                                = "/var/lib/cassandra/heapdumps"
node.default['cassandra']['jar_lib_dir']                                 = "/usr/share/dse/cassandra/lib"
node.default['opscenter-agent']['is_opscenter_cluster_configured']       = true

# Cassandra.yaml
node.default['cassandra']['vnodes']                                      = true
node.default['cassandra']['auto_bootstrap']                              = false
node.default['cassandra']['num_tokens']                                  = "256"
node.default['cassandra']['initial_token']                               = ""
node.default['cassandra']['hinted_handoff_enabled']                      = true
node.default['cassandra']['max_hint_window_in_ms']                       = 604800000
node.default['cassandra']['hinted_handoff_throttle_in_kb']               = 15360
node.default['cassandra']['max_hints_delivery_threads']                  = 4
node.default['cassandra']['batchlog_replay_throttle_in_kb']              = 3072
node.default['cassandra']['authenticator']                               = "AllowAllAuthenticator"
node.default['cassandra']['authorizer']                                  = "AllowAllAuthorizer"
node.default['cassandra']['permissions_validity_in_ms']                  = 2000
node.default['cassandra']['partitioner']                                 = "org.apache.cassandra.dht.RandomPartitioner"
node.default['cassandra']['data_file_directories']                       = [ "/var/lib/cassandra/data" ]
node.default['cassandra']['commitlog_directory']                         = "/var/lib/cassandra/commitlog"
node.default['cassandra']['disk_failure_policy']                         = "stop"
node.default['cassandra']['commit_failure_policy']                       = "stop"
node.default['cassandra']['key_cache_size_in_mb']                        = ""
node.default['cassandra']['key_cache_save_period']                       = 14400
node.default['cassandra']['row_cache_size_in_mb']                        = 0
node.default['cassandra']['row_cache_save_period']                       = 0
node.default['cassandra']['memory_allocator']                            = "JEMallocAllocator"
node.default['cassandra']['saved_caches_directory']                      = "/var/lib/cassandra/saved_caches"
node.default['cassandra']['commitlog_sync']                              = "periodic"
node.default['cassandra']['commitlog_sync_period_in_ms']                 = 10000
node.default['cassandra']['commitlog_segment_size_in_mb']                = 32
node.default['cassandra']['concurrent_reads']                            = 128
node.default['cassandra']['concurrent_writes']                           = 128
node.default['cassandra']['memtable_total_space_in_mb']                  = 1024
node.default['cassandra']['memtable_flush_writers']                      = 8
node.default['cassandra']['memtable_flush_queue_size']                   = 32
node.default['cassandra']['trickle_fsync']                               = true
node.default['cassandra']['trickle_fsync_interval_in_kb']                = 10240
node.default['cassandra']['storage_port']                                = 7000
node.default['cassandra']['ssl_storage_port']                            = 7001
node.default['cassandra']['listen_address']                              = node['ipaddress']
node.default['cassandra']['start_native_transport']                      = true
node.default['cassandra']['native_transport_port']                       = 9042
node.default['cassandra']['start_rpc']                                   = true
node.default['cassandra']['rpc_address']                                 = "0.0.0.0"
node.default['cassandra']['rpc_port']                                    = 9160
node.default['cassandra']['rpc_keepalive']                               = true
node.default['cassandra']['rpc_server_type']                             = "hsha"
node.default['cassandra']['rpc_min_threads']                             = 16
node.default['cassandra']['rpc_max_threads']                             = 2048
node.default['cassandra']['thrift_framed_transport_size_in_mb']          = "15"
node.default['cassandra']['incremental_backups']                         = false
node.default['cassandra']['snapshot_before_compaction']                  = false
node.default['cassandra']['auto_snapshot']                               = true
node.default['cassandra']['tombstone_warn_threshold']                    = 10000
node.default['cassandra']['tombstone_failure_threshold']                 = 1000000
node.default['cassandra']['column_index_size_in_kb']                     = 64
node.default['cassandra']['batch_size_warn_threshold_in_kb']             = 64
node.default['cassandra']['in_memory_compaction_limit']                  = 256
node.default['cassandra']['concurrent_compactors']                       = 6
node.default['cassandra']['multithreaded_compaction']                    = false
node.default['cassandra']['compaction_throughput_mb_per_sec']            = 64
node.default['cassandra']['compaction_preheat_key_cache']                = true
node.default['cassandra']['stream_throughput_outbound_megabits_per_sec'] = 60
node.default['cassandra']['inter_dc_stream_throughput_outbound_Mbps']    = 20
node.default['cassandra']['read_request_timeout_in_ms']                  = 2000
node.default['cassandra']['range_request_timeout_in_ms']                 = 10000
node.default['cassandra']['write_request_timeout_in_ms']                 = 2000
node.default['cassandra']['cas_contention_timeout_in_ms']                = 1000
node.default['cassandra']['truncate_request_timeout_in_ms']              = 60000
node.default['cassandra']['request_timeout_in_ms']                       = 10000
node.default['cassandra']['cross_node_timeout']                          = true
node.default['cassandra']['phi_convict_threshold']                       = nil
node.default['cassandra']['endpoint_snitch']                             = "com.datastax.bdp.snitch.DseDelegateSnitch"
node.default['cassandra']['dynamic_snitch_update_interval_in_ms']        = 100
node.default['cassandra']['dynamic_snitch_reset_interval_in_ms']         = 600000
node.default['cassandra']['dynamic_snitch_badness_threshold']            = 0.1
node.default['cassandra']['request_scheduler']                           = "org.apache.cassandra.scheduler.NoScheduler"
node.default['cassandra']['internode_compression']                       = "all"
node.default['cassandra']['inter_dc_tcp_nodelay']                        = false
node.default['cassandra']['preheat_kernel_page_cache']                   = false

#cassandra-env.sh
node.default['cassandra']['max_heap_size']                               = "8G"
node.default['cassandra']['heap_newsize']                                = "1200M"
node.default['cassandra']['jvm_gc_SurvivorRatio']                        = 8
node.default['cassandra']['jvm_gc_MaxTenuringThreshold']                 = 1
node.default['cassandra']['jvm_gc_CMSInitiatingOccupancyFraction']       = "75"
node.default['cassandra']['jvm_gc_UseNUMA']                              = true
node.default['cassandra']['gc_log_PrintGCDetails']                       = true
node.default['cassandra']['gc_log_PrintGCCause']                         = true
node.default['cassandra']['gc_log_PrintGCDateStamps']                    = true
node.default['cassandra']['gc_log_PrintHeapAtGC']                        = true
node.default['cassandra']['gc_log_PrintTenuringDistribution']            = true
node.default['cassandra']['gc_log_PrintGCApplicationStoppedTime']        = true
node.default['cassandra']['gc_log_PrintPromotionFailure']                = true
node.default['cassandra']['gc_log_PrintFLSStatistics']                   = true
node.default['cassandra']['gc_log_PrintSafepointStatistics']             = false
node.default['cassandra']['gc_log_PrintSafepointStatisticsCount']        = false
node.default['cassandra']['gc_log_TraceBiasedLocking']                   = false
node.default['cassandra']['gc_log_Xloggc']                               = "gc.log"
node.default['cassandra']['gc_log_UseGCLogFileRotation']                 = true
node.default['cassandra']['gc_log_NumberOfGCLogFiles']                   = 10
node.default['cassandra']['gc_log_GCLogFileSize']                        = "10M"

# Log4J Settings
node.default['cassandra']['log_level']                                   = "INFO"
node.default['cassandra']['log_file_size_mb']                            = "20"
node.default['cassandra']['log_file_roll_count']                         = 10
node.default['cassandra']['log_syslog_enabled']                          = true
node.default['cassandra']['log_syslog_host']                             = "10.15.0.249"
node.default['cassandra']['log_syslog_threshold']                        = "WARN"
node.default['cassandra']['audit_logging']                               = false
node.default['cassandra']['audit_dir']                                   = "/etc/dse/cassandra"
node.default['cassandra']['active_categories']                           = "ADMIN,AUTH,DDL,DCL"
# JNA (3.2.7 or higher required for C* 2.0 and 2.1)
node.default['cassandra']['jna_version']                                 = "3.5.2"
node.default['cassandra']['jna_install_dir']                             = node['cassandra']['jar_lib_dir']
node.default['cassandra']['jna_jar_source_base_uri']                     = "https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna/"

# JEMalloc
node.default['cassandra']['jemalloc_location']                           = "/usr/lib64/"

# OS settings for Cassandra (See: http://www.datastax.com/documentation/cassandra/2.0/cassandra/install/installRecommendSettings.html)
node.default['cassandra']['os']['zone_reclaim_mode']                     = 0
node.default['cassandra']['os']['limits_ary']                            = [
                                                                            { 'domain' => 'cassandra', 'type' => '-', 'item' => 'memlock', 'value' => 'unlimited' },
                                                                            { 'domain' => 'cassandra', 'type' => '-', 'item' => 'nofile', 'value' => '100000' },
                                                                            { 'domain' => 'cassandra', 'type' => '-', 'item' => 'nproc', 'value' => '32768' },
                                                                            { 'domain' => 'cassandra', 'type' => '-', 'item' => 'as', 'value' => 'unlimited' }
                                                                           ]
node.default['cassandra']['os']['90_nproc_limits_ary']                   = [
                                                                            { 'domain' => 'root', 'type' => 'soft', 'item' => 'nproc', 'value' => 'unlimited' },
                                                                            { 'domain' => '*', 'type' => '-', 'item' => 'nproc', 'value' => '32768' }
                                                                           ]
node.default['cassandra']['os']['sysctl_vm_max_map_count']               = 131072

include_recipe "role-dse-nativex"
