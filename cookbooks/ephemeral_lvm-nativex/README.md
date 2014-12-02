ephemeral_lvm-nativex Cookbook
==============================
This cookbook wraps the ephemeral_lvm cookbook for NativeX.
The main reason is to install XFS on the machine if ephemeral_lvm is set to create volumes of type xfs.

Requirements
------------
#### cookbooks
- `xfs` - ephemeral_lvm-nativex needs xfs to install the xfs packages.
- `ephemeral_lvm` - ephemeral_lvm-nativex needs ephemeral_lvm, because it is designed to be a wrapper for it.

Attributes
----------
None - See ephemeral_lvm cookbook.

Usage
-----
#### ephemeral_lvm-nativex::default

e.g.
Just include `ephemeral_lvm-nativex` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ephemeral_lvm-nativex]"
  ]
}
```

License and Authors
-------------------
Authors: Derek Bromenshenkel
