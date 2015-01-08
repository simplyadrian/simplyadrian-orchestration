Overview
========

Every Chef installation needs a Chef Repository. This is the place where cookbooks, roles, config files and other artifacts for managing systems with Chef will live.

Repository Directories
======================

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

* `cookbooks/` - Cookbooks you download or create.
* `ec2_user_data/` user data scripts used to bootstrap ec2 instances in AWS.
* `environments/` - environment files as defined here: http://docs.chef.io/environments.html
* `roles/` - Store roles in .rb or .json in the repository.

Berks Tasks
==========
 Berksfile and Berks stuff will go here

Configuration
=============

The repository uses a configuration file.

* .chef/knife.rb

The config file, `.chef/knife.rb` is a repository specific configuration file for knife. If you're using the Opscode Platform, you can download one for your organization from the management console. If you're using the Open Source Chef Server, you can generate a new one with `knife configure`. For more information about configuring Knife, see the Knife documentation.

http://docs.opscode.com/knife.html

Next Steps
==========

Read the README file in each of the subdirectories for more information about what goes in those directories.
