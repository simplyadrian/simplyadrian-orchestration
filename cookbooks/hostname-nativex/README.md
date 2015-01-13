hostname-nativex Cookbook
=========================
This cookbook sets the hostname on a linux server.

Requirements
------------

#### packages
- `hostfile` - hostname-nativex needs hostfile cookbook providers to update a nodes hostfile.

Usage
-----
#### hostname-nativex::default

Just include `hostname-nativex` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[hostname-nativex]"
  ]
}
```

License and Authors
-------------------
Authors: Adrian Herrera
