# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
knife[:editor] = '/usr/bin/vim'
log_level                :info
log_location             STDOUT
node_name                "nativex"
client_key               "#{current_dir}/nativex.pem"
validation_client_name   "nativex-validator"
validation_key           "#{current_dir}/nativex-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/nativex"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
