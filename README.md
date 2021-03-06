Overview
========

Every Chef installation needs a Chef Repository. This is the place where cookbooks, roles, config files and other artifacts for managing systems with Chef will live.

Repository Directories
======================

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

* `ec2_user_data/` user data scripts used to bootstrap ec2 instances in AWS.
* `environments/` - environment files as defined here: http://docs.chef.io/environments.html
* `roles/` - Store roles in .rb or .json in the repository.

Data Bags
==========

You can find the data_bags @ https://manage.chef.io/organizations/simplyadrian/data_bags or request them from adrian.herrera.

### NOTE
Data Bag contents should never exist in this repository. Use the 'knife data bag' commands to manage our databags.

Cookbooks
=========

Cookbooks are managed by Berkshelf. 

- Community cookbooks exist only in the Berkshelf. The code does not exist anywhere.
  - Exceptions are the 'aws' and 'r' cookbooks. There are 'forks' of them in the simplyadrian git repo.
- The code for simplyadrian cookbooks are individual repositories like 'cookbook-<name>-simplyadrian' in the simplyadrian git repo.

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
