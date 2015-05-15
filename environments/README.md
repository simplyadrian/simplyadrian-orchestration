Requires Chef 0.10.0+.

This directory is for Ruby DSL and JSON files for environments. For more information see the Chef wiki page:

http://wiki.opscode.com/display/chef/Environments

simplyadrian Environments
--------------------
We use environments to:

1. Define attributes and cookbook versions that apply globally across the specified environment. Things like:
  - Spacwalk Registration Key - to define which channel the node belongs to.
  - Chef Client service run interval and log settings
2.  Control cookbook versions on a given node in accordance with the [Environment Cookbook Pattern](http://blog.vialstudios.com/the-environment-cookbook-pattern/) & [The simplyadrian Way](https://info.teamfreeze.com:8443/pages/viewpage.action?pageId=23036503).  This typically means there is one environment for each role cookbook + [dev|prod] combination.

#### Current environments
- `<cookbook>-dev`: A non-'production' configuration of the *cookbook*'s environment. Development machines, QA, prototypes, temporary instances are all included here.
- `<cookbook>-prod`: All Production configuration of the *cookbook*'s environment.  All nodes that require 24x7 uptime.
- `dev`: A basic configuration for test, temporary, hackish machines.  Should rarely be used because no coookbook versioning is enforced.

