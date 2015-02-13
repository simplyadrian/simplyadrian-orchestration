role-dse-cdccass1-aws-nativex Cookbook
====================
# Datastax Enterprise Role Cookbook (for NativeX 'cdc-cass1' cluster nodes that reside in AWS. This is the main production Cassandra cluster.)
This cookbook is a Role cookbook intended to be used as the master for all AWS nodes that belong to the 'cdc-cass1' Cassandra cluster.
It sits atop the `role-dse-nativex` role cookbook and simply sets the configuration to match the Chicago data center cluster members, with a few tweaks for AWS.

## Overview
This cookbook is providing attributes along these themes:

1. Use `cassandra-ssd-storage` tuned profile because we know we're running on HVM instances.
2. Don't autobootstrap, and we know the seeds from the Chicago datacenter.
3. Turn on GC logging.
4. Turn on JEmalloc.
5. Use a 8GB/1200MB max/new heap size, respectively.
3. Use the Production OpsCenter server. The cluster is already configured there.

## Usage

Like other Role cookbooks, specify `role-dse-cdccass1-aws-native` in your run list for the node. Ensure the node is using the corresponding 'dse-cdccass1-(dev|prod)' environment.

## Attributes
Most of the reasoning was explained above in the Overview section.  The remaining settings mirror those found on the Chicago datacenter servers.

## Direct Dependencies
* `'role-dse-nativex'` For base NativeX DSE installation.
