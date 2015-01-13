Requires Chef 0.10.0+.

This directory is for Ruby DSL and JSON files for environments. For more information see the Chef wiki page:

http://wiki.opscode.com/display/chef/Environments

NativeX Environments
--------------------
We use environments to define attributes and cookbook versions that apply globally across the specified environment. Things like:

- Spacwalk Registration Key - to define which channel the node belongs to.
- OpsCenter server IP Address 

#### Current environments
- `dev`: Anything not 'production'. Development machines, QA, prototypes, temporary instances are all included here.
- `prod`: All Production nodes that require 24x7 uptime.
