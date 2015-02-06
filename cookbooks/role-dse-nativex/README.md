role-dse-nativex Cookbook
====================
# Datastax Enterprise Role Cookbook (for NativeX)
This cookbook is a Role cookbook intended to be used as the 'base' for all DSE installations at NativeX.
In general, the goal is to provide the simplest "out-of-the-box" configuration that will work in our environment.
In all likelihood, you should build another role cookbook that defines this one as the base, and expands from there.

## Overview
This cookbook encapsulates these concepts that are deemed common to all DSE installations at NativeX.
1. Using `role-base-nativex` to configure a base CentOS image.
2. Defining attributes that are central to NativeX like (see below for detail):
  - Use Oracle JRE/JDK
  - Use `xfs` filesystem
  - Descriptive lvm volume group and logical volume names.
  - Enable the use of OpsCenter.
3. Setting up 'tuned' service on top of the base image.
4. Installing Datastax Enterprise using the 'dse-nativex' cookbook.

## Usage

Like other Role cookbooks, specify `role-dse-nativex:default` in your run list for the node.

## Attributes
* `node.default['ephemeral_lvm']['mount_point'] = "/var/lib/cassandra"` We want Cassandra data, commitlog, and saved caches to always reside here.
* `node.default['ephemeral_lvm']['filesystem'] = "xfs"` 
* `node.default['ephemeral_lvm']['volume_group_name'] = "vg_data_ephem"` Cassandra Data will occupy most of the LVM volume group.
* `node.default['ephemeral_lvm']['logical_volume_name'] = "lv_cass_raid0"` The logical volume is a RAID-0 for Cassandra.
* `node.default['java']['install_flavor'] = "oracle"` 
* `node.default['java']['jdk_version'] = "7"` 
* `node.default['java']['oracle']['accept_oracle_download_terms'] = true` 
* `node.default['opscenter-agent']['enabled'] = true` We always want to use OpsCenter.
* `node.default['pbis-nativex']['organizational_unit_level_5'] = "Cassandra Servers"` We have a special OU in ActiveDirectory for Cassandra servers.
* `node.default['tuned']['active_profile'] = "throughput-performance"` Being a database, at least use the throughput-performance tuned profile.

## Direct Dependencies
* `'role-base-nativex'` The base Linux role.
* `'tuned-nativex'` For setting up 'tuned' on top of the base.
* `'dse-nativex'` For installing DSE/OpsCenter