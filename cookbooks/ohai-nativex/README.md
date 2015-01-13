ohai-nativex Cookbook
=====================
Configures ohai and additional plugins for ohai.

Requirements
------------
Depends on the ohai community cookbook.

#### ohai-nativex::awsplugin
Depends on the ec2 plugin.

#### ohai-nativex::awsplugin
Reloads aws ohai plugin and configures it using the aws.rb file.

Recipes
-------
#### ohai-nativex::default
Calls ohai-nativex::awsplugin

Attributes
----------
None.

Usage
-----
Just include `ohai-nativex` in your node's `run_list`.

License and Authors
-------------------
Authors: Adrian Herrera
