###
# Software Source Attributes

# For Datastax Cassandra the prefix is "dsc-"
default[:cassandra][:nameprefix] = "dsc-cassandra"

# Where to get Cassandra from: Directly from Datastax
default[:cassandra][:version] = "1.2.9"
default[:cassandra][:checksum] = "671ae08ce04a7c6117acc644646fabcb26b8062c4dd73f6e2dc570450f0cdc78"
#default[:cassandra][:version] = "2.0.7"
#default[:cassandra][:checksum] = "671ae08ce04a7c6117acc644646fabcb26b8062c4dd73f6e2dc570450f0cdc78"
default[:cassandra][:src_url] = "http://downloads.datastax.com/community/#{node[:cassandra][:nameprefix]}-#{node['cassandra']['version']}-bin.tar.gz"

# Priam Build Sources
# You can get builds directly from maven.org : http://search.maven.org/ search for "com.netflix.priam"
# By default files are in a Medidata-controlled S3 bucket with no authentication, because at the time of writing there are no Priam 1.2 builds available at the maven.org site.
SRC = 'https://s3.amazonaws.com/chef-atrull-builds/cassandra'
default[:cassandra][:priam_version] = "1.2.29"
default[:cassandra][:priam_web_war][:src_url] = "#{SRC}/priam/#{node['cassandra']['priam_version']}/priam-web-#{node['cassandra']['priam_version']}.war"
default[:cassandra][:priam_web_war][:checksum] = "927638d7a0704534a5ae5812cdb0a3e20dc63cd2afdbe4a073e0368072d0595d"
default[:cassandra][:priam_cass_extensions_jar][:src_url] = "#{SRC}/priam/#{node['cassandra']['priam_version']}/priam-cass-extensions-#{node['cassandra']['priam_version']}.jar"
default[:cassandra][:priam_cass_extensions_jar][:checksum] = "53e6457fe26dcd7a9bedbc5cc7960df5c673b1ac09416d0e179cbfe1fd895f07"

###
# Various Install attributes

# JVM Stack size - this default is 180k which is not enough and stops cassandra from running.
default[:cassandra][:stacksize] = "Xss228k"

# We will attempt to get AWS credentials from a databag - the attributes of which are below
# These variables stolen from the EBS cookbook https://raw.github.com/albertsj1/chef-ebs/master/attributes/default.rb
default[:cassandra][:aws][:databag] = "credentials"
default[:cassandra][:aws][:item] = "aws"
# IDs inside the item to use
default[:cassandra][:aws][:aki] = "aws_access_key_id"
default[:cassandra][:aws][:sak] = "aws_secret_access_key"
default[:cassandra][:aws][:encrypted] = true

# We will create this user
default[:cassandra][:user] = "cassandra"
default[:cassandra][:log_dir] = "/var/log/cassandra"

# We will try to install all software to this path
default[:cassandra][:parentdir] = "/opt"

# Fog gem version - used to write to SimpleDB
default[:cassandra][:fog][:version] = "1.9.0"

# This package name may be different on untested distributions so we make it an attribute
default[:cassandra][:jnapackagename] = "libjna-java"

###
# Start of SimpleDB Config Attributes

# The following variables are used to feed SimpleDB
# Priam configures Cassandra and itself using these variables

# priam_clustername MUST match the autoscaling group name (before the dash) in order to be used i.e. project_stage_db-useast1 == cluster_name-ec2region
# priam_clustername is effectively the reference to the correct set of SimpleDB Configuration
# we will attempt to set this based on the role name, which should match the asg name. If your role does not match the name then this MUST be set.
default[:cassandra][:priam_clustername] = "SET_ME_PLEASE"

# We won't set this if it isn't true  - set it to "true" to enable enable multiregion
default[:cassandra][:priam_multiregion_enable] = nil

# This is the default single-region snitch - set it to "org.apache.cassandra.locator.Ec2MultiRegionSnitch" for multiregion
default[:cassandra][:priam_endpoint_snitch] = "org.apache.cassandra.locator.Ec2Snitch"

# This must be set for all multiregion and any single region deployments outside the first three (abc) AZs/datacenters in a region
# i.e. "us-east-1a,us-east-1c,us-west-1a,us-west-1b,us-west-1c" or "us-east-1c,us-east-1d"
# If not set it will not be applied
default[:cassandra][:priam_zones_available] = nil

# If you want backups, set this variable to the name of an s3 bucket you have created.
default[:cassandra][:priam_s3_bucket] = "SET_ME_PLEASE"

# The rest - relatively self-explanatory variables, safe defaults for ec2 deployment where /mnt is a large block device.
default[:cassandra][:priam_s3_base_dir] = "cassandra_backups"
default[:cassandra][:priam_cass_home] = "#{node[:cassandra][:parentdir]}/cassandra"
default[:cassandra][:priam_data_location] = "/mnt/cassandra/data"
default[:cassandra][:priam_cache_location] = "/mnt/cassandra/saved_caches"
default[:cassandra][:priam_commitlog_location] = "/mnt/cassandra/commitlog"
default[:cassandra][:priam_cass_startscript] = "/etc/init.d/cassandra start"
default[:cassandra][:priam_cass_stopscript] = "/etc/init.d/cassandra stop"
default[:cassandra][:priam_upload_throttle] = "5"

