#
# passwords
default['mysql']['server_root_password'] = 'ilikerandompasswords'

# mysql_user
default['mysql-nativex']['mysql_user'] = 'root'

case node['platform']
when 'smartos'
  default['mysql']['data_dir'] = '/opt/local/lib/mysql'
else
  default['mysql']['data_dir'] = '/var/lib/mysql'
end

# port
default['mysql']['port'] = '3306'

# socket_file
default['mysql']['socket_file'] = '/var/lib/mysql/mysql.sock'

# pid_file
default['mysql']['pid_file'] = '/var/run/mysql/mysql.pid'

#include_dir
default['mysql']['include_dir'] = '/etc/mysql/conf.d'

# mysqld
default['mysql-nativex']['key_buffer'] = '32M'
default['mysql-nativex']['key_buffer_size'] = '64M'
default['mysql-nativex']['max_allowed_packet'] = '32M'
default['mysql-nativex']['thread_stack'] = '256K'
default['mysql-nativex']['thread_cache_size'] = '64'
default['mysql-nativex']['query_cache_limit'] = '16M'
default['mysql-nativex']['query_cache_size'] = '64M'
default['mysql-nativex']['query_cache_type'] = '1'
default['mysql-nativex']['max_connections'] = '700'
default['mysql-nativex']['table_open_cache'] = '256'
default['mysql-nativex']['sort_buffer_size'] = '8M'
default['mysql-nativex']['join_buffer_size'] = '8M'
default['mysql-nativex']['net_buffer_length'] = '8K'
default['mysql-nativex']['read_buffer_size'] = '2M'
default['mysql-nativex']['read_rnd_buffer_size'] = '16M'
default['mysql-nativex']['myisam_sort_buffer_size'] = '64M'
default['mysql-nativex']['thread_concurrency'] = '8'
default['mysql-nativex']['innodb_file_per_table'] = '1'
default['mysql-nativex']['innodb_log_buffer_size'] = '64M'
default['mysql-nativex']['innodb_buffer_pool_size'] = '6G'
default['mysql-nativex']['innodb_thread_concurrency'] = '16'
default['mysql-nativex']['innodb_flush_method'] = 'O_DIRECT'
default['mysql-nativex']['innodb_log_file_size'] = '1024M'
default['mysql-nativex']['log_bin'] = 'mysql-bin'

# mysqldump
default['mysql-nativex']['max_allowed_packet'] = '16M'

# myisamchk
default['mysql-nativex']['myisam_key_buffer_size'] = '128M'
default['mysql-nativex']['sort_buffer_size'] = '128M'
default['mysql-nativex']['read_buffer'] = '2M'
default['mysql-nativex']['write_buffer'] = '2M'

# s3_backups
default['mysql-nativex']['s3_bucket'] = 'some_bucket'
default['mysql-nativex']['aws_access_key_id'] = 'some_id_goes_here'
default['mysql-nativex']['aws_secret_access_key'] = 'some_key_goes_here'
default['mysql-nativex']['temp_dir'] = '/tmp/mysql-backup'
