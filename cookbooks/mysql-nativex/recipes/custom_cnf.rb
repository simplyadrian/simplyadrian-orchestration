#
# Cookbook Name:: nativex-mysql
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
     :key_buffer		=> node['nativex-mysql']['key_buffer'],
     :key_buffer_size		=> node['nativex-mysql']['key_buffer_size'],
     :max_allowed_packet	=> node['nativex-mysql']['max_allowed_packet'],
     :thread_stack		=> node['nativex-mysql']['thread_stack'],
     :thread_cache_size		=> node['nativex-mysql']['thread_cache_size'],
     :query_cache_limit		=> node['nativex-mysql']['query_cache_limit'],
     :query_cache_size		=> node['nativex-mysql']['query_cache_size'],
     :query_cache_type		=> node['nativex-mysql']['query_cache_type'],
     :max_connections		=> node['nativex-mysql']['max_connections'],
     :table_open_cache		=> node['nativex-mysql']['table_open_cache'],
     :sort_buffer_size		=> node['nativex-mysql']['sort_buffer_size'],
     :join_buffer_size		=> node['nativex-mysql']['join_buffer_size'],
     :net_buffer_length		=> node['nativex-mysql']['net_buffer_length'],
     :read_buffer_size		=> node['nativex-mysql']['read_buffer_size'],
     :read_rnd_buffer_size	=> node['nativex-mysql']['read_rnd_buffer_size'],
     :myisam_sort_buffer_size	=> node['nativex-mysql']['myisam_sort_buffer_size'],
     :thread_concurrency	=> node['nativex-mysql']['thread_concurrency'],
     :innodb_file_per_table	=> node['nativex-mysql']['innodb_file_per_table'],
     :innodb_log_buffer_size	=> node['nativex-mysql']['innodb_log_buffer_size'],
     :innodb_buffer_pool_size	=> node['nativex-mysql']['innodb_buffer_pool_size'],
     :innodb_thread_concurrency	=> node['nativex-mysql']['innodb_thread_concurrency'],
     :innodb_flush_method	=> node['nativex-mysql']['innodb_flush_method'],
     :innodb_log_file_size	=> node['nativex-mysql']['innodb_log_file_size'],
     :max_allowed_packet	=> node['nativex-mysql']['max_allowed_packet'],
     :myisam_key_buffer_size	=> node['nativex-mysql']['myisam_key_buffer_size'],
     :sort_buffer_size		=> node['nativex-mysql']['sort_buffer_size'],
     :read_buffer		=> node['nativex-mysql']['read_buffer'],
     :write_buffer		=> node['nativex-mysql']['write_buffer'],
     :log_bin			=> node['nativex-mysql']['log_bin']
  )
end
