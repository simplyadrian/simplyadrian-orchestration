glusterfs-nativex Cookbook
====================
This cookbook is attempting to install glusterfs, configure a cluster and create the filesystem. In its current state the cookbook only installs the glusterfs services and software. Work will have to be done to be able to properly join nodes in the cluster.

Requirements
------------

#### packages
- `yum` - glusterfs-nativex needs yum to correctly install the glusterfs channels.

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### glusterfs-nativex::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['glusterfs-nativex']['server']['peers']</tt></td>
    <td>String</td>
    <td>An array of servers that you wish to join in the clustered filesystem</td>
    <td><tt>empty</tt></td>
  </tr>
  <tr>
    <td><tt>['glusterfs-nativex']['server']['volumes']</tt></td>
    <td>String</td>
    <td>Name of the glusterfs volume (share) you are creating.</td>
    <td><tt>empty</tt></td>
  </tr>
  <tr>
    <td><tt>['glusterfs-nativex']['server']['stripe']</tt></td>
    <td>Integer</td>
    <td>The stripe setting you are using while creating the glusterfs volume. How many nodes in your filesystem.</td>
    <td><tt>empty</tt></td>
  </tr>
  <tr>
    <td><tt>['glusterfs-nativex']['server']['replica']</tt></td>
    <td>String</td>
    <td>.</td>
    <td><tt>.</tt></td>
  </tr>
  <tr>
    <td><tt>['glusterfs-nativex']['server']['transport']</tt></td>
    <td>String</td>
    <td>.</td>
    <td><tt>.</tt></td>
  </tr>
  <tr>
    <td><tt>['glusterfs-nativex']['client']['mounts']</tt></td>
    <td>String</td>
    <td>Sets up the client side mount points for glusterfs.</td>
    <td><tt>empty</tt></td>
  </tr>
</table>

Usage
-----
#### glusterfs-nativex::default

Just include `glusterfs-nativex` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[glusterfs-nativex]"
  ]
}
```


License and Authors
-------------------
Authors: Adrian Herrera
