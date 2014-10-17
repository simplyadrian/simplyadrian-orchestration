#
# Cookbook Name:: mysql-nativex
# Recipe:: custom_cnf
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mysql::server"

template '/etc/my.cnf' do
  owner 'mysql'
  owner 'mysql'      
  source 'my.cnf.erb'
  variables(
     :port			=> node['mysql']['port'],
     :socket_file		=> node['mysql']['socket_file'],
     :pid_file			=> node['mysql']['pid_file'],
     :data_dir			=> node['mysql']['data_dir'],
     :include_dir		=> node['mysql']['include_dir'],
     :key_buffer		=> node['mysql-nativex']['key_buffer'],
     :key_buffer_size		=> node['mysql-nativex']['key_buffer_size'],
     :max_allowed_packet	=> node['mysql-nativex']['max_allowed_packet'],
     :thread_stack		=> node['mysql-nativex']['thread_stack'],
     :thread_cache_size		=> node['mysql-nativex']['thread_cache_size'],
     :query_cache_limit		=> node['mysql-nativex']['query_cache_limit'],
     :query_cache_size		=> node['mysql-nativex']['query_cache_size'],
     :query_cache_type		=> node['mysql-nativex']['query_cache_type'],
     :max_connections		=> node['mysql-nativex']['max_connections'],
     :table_open_cache		=> node['mysql-nativex']['table_open_cache'],
     :sort_buffer_size		=> node['mysql-nativex']['sort_buffer_size'],
     :join_buffer_size		=> node['mysql-nativex']['join_buffer_size'],
     :net_buffer_length		=> node['mysql-nativex']['net_buffer_length'],
     :read_buffer_size		=> node['mysql-nativex']['read_buffer_size'],
     :read_rnd_buffer_size	=> node['mysql-nativex']['read_rnd_buffer_size'],
     :myisam_sort_buffer_size	=> node['mysql-nativex']['myisam_sort_buffer_size'],
     :thread_concurrency	=> node['mysql-nativex']['thread_concurrency'],
     :innodb_file_per_table	=> node['mysql-nativex']['innodb_file_per_table'],
     :innodb_log_buffer_size	=> node['mysql-nativex']['innodb_log_buffer_size'],
     :innodb_buffer_pool_size	=> node['mysql-nativex']['innodb_buffer_pool_size'],
     :innodb_thread_concurrency	=> node['mysql-nativex']['innodb_thread_concurrency'],
     :innodb_flush_method	=> node['mysql-nativex']['innodb_flush_method'],
     :innodb_log_file_size	=> node['mysql-nativex']['innodb_log_file_size'],
     :max_allowed_packet	=> node['mysql-nativex']['max_allowed_packet'],
     :myisam_key_buffer_size	=> node['mysql-nativex']['myisam_key_buffer_size'],
     :sort_buffer_size		=> node['mysql-nativex']['sort_buffer_size'],
     :read_buffer		=> node['mysql-nativex']['read_buffer'],
     :write_buffer		=> node['mysql-nativex']['write_buffer'],
     :log_bin			=> node['mysql-nativex']['log_bin']
  )
end
