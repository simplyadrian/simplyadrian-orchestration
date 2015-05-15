role-dse-simplyadrian Cookbook
====================
# Datastax Enterprise Role Cookbook (for simplyadrian)
This cookbook is a Role cookbook intended to be used as the 'base' for all DSE installations at simplyadrian.
In general, the goal is to provide the simplest "out-of-the-box" configuration that will work in our environment.
In all likelihood, you should build another role cookbook that defines this one as the base, and expands from there.

## Overview
This cookbook encapsulates these concepts that are deemed common to all DSE installations at simplyadrian.
1. Using `role-base-simplyadrian` to configure a base CentOS image.
2. Defining attributes that are central to simplyadrian like (see below for detail):
  - Use Oracle JRE/JDK
  - Use `xfs` filesystem
  - Descriptive lvm volume group and logical volume names.
  - Enable the use of OpsCenter.
3. Setting up 'tuned' service on top of the base image.
4. Installing Datastax Enterprise using the 'dse-simplyadrian' cookbook.

## Usage

Like other Role cookbooks, specify `role-dse-simplyadrian:default` in your run list for the node.

## Attributes
* `node.normal['autopatch-simplyadrian']['auto_reboot_enabled'] = false` We are OK with automated patching, but want to control the reboots manually.
* `node.default['ephemeral_lvm']['mount_point'] = "/var/lib/cassandra"` We want Cassandra data, commitlog, and saved caches to always reside here.
* `node.default['ephemeral_lvm']['filesystem'] = "xfs"` 
* `node.default['ephemeral_lvm']['volume_group_name'] = "vg_data_ephem"` Cassandra Data will occupy most of the LVM volume group.
* `node.default['ephemeral_lvm']['logical_volume_name'] = "lv_cass_raid0"` The logical volume is a RAID-0 for Cassandra.
* `node.default['java']['install_flavor'] = "oracle"` 
* `node.default['java']['jdk_version'] = "7"` 
* `node.default['java']['oracle']['accept_oracle_download_terms'] = true` 
* `node.default['opscenter-agent']['enabled'] = true` We always want to use OpsCenter.
* `node.default['pbis-simplyadrian']['organizational_unit_level_5'] = "Cassandra Servers"` Will be depreciated after SSSD migration and can be safely removed. ad-simplyadrian attribute replaces this.
* `node.default['ad-simplyadrian']['organizational_unit_level_5'] = "Cassandra Servers"` We have a special OU in ActiveDirectory for Cassandra servers.
* `node.default['tuned']['active_profile'] = "throughput-performance"` Being a database, at least use the throughput-performance tuned profile.

## Direct Dependencies
* `'role-base-simplyadrian'` The base Linux role.
* `'tuned-simplyadrian'` For setting up 'tuned' on top of the base.
* `'dse-simplyadrian'` For installing DSE/OpsCenter
