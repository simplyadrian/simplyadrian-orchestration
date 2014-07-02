#
# passwords
default['mysql']['server_root_password'] = 'ilikerandompasswords'

# mysql_user
default['nativex-mysql']['mysql_user'] = 'root'

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
default['nativex-mysql']['key_buffer'] = '32M'
default['nativex-mysql']['key_buffer_size'] = '64M'
default['nativex-mysql']['max_allowed_packet'] = '32M'
default['nativex-mysql']['thread_stack'] = '256K'
default['nativex-mysql']['thread_cache_size'] = '64'
default['nativex-mysql']['query_cache_limit'] = '16M'
default['nativex-mysql']['query_cache_size'] = '64M'
default['nativex-mysql']['query_cache_type'] = '1'
default['nativex-mysql']['max_connections'] = '700'
default['nativex-mysql']['table_open_cache'] = '256'
default['nativex-mysql']['sort_buffer_size'] = '8M'
default['nativex-mysql']['join_buffer_size'] = '8M'
default['nativex-mysql']['net_buffer_length'] = '8K'
default['nativex-mysql']['read_buffer_size'] = '2M'
default['nativex-mysql']['read_rnd_buffer_size'] = '16M'
default['nativex-mysql']['myisam_sort_buffer_size'] = '64M'
default['nativex-mysql']['thread_concurrency'] = '8'
default['nativex-mysql']['innodb_file_per_table'] = '1'
default['nativex-mysql']['innodb_log_buffer_size'] = '64M'
default['nativex-mysql']['innodb_buffer_pool_size'] = '6G'
default['nativex-mysql']['innodb_thread_concurrency'] = '16'
default['nativex-mysql']['innodb_flush_method'] = 'O_DIRECT'
default['nativex-mysql']['innodb_log_file_size'] = '1024M'
default['nativex-mysql']['log_bin'] = 'mysql-bin'

# mysqldump
default['nativex-mysql']['max_allowed_packet'] = '16M'

# myisamchk
default['nativex-mysql']['myisam_key_buffer_size'] = '128M'
default['nativex-mysql']['sort_buffer_size'] = '128M'
default['nativex-mysql']['read_buffer'] = '2M'
default['nativex-mysql']['write_buffer'] = '2M'

# s3_backups
default['nativex-mysql']['s3_bucket'] = 'some_bucket'
default['nativex-mysql']['aws_access_key_id'] = 'some_id_goes_here'
default['nativex-mysql']['aws_secret_access_key'] = 'some_key_goes_here'
default['nativex-mysql']['temp_dir'] = '/tmp/mysql-backup'
