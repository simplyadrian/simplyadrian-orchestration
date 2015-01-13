nfs-nativex Cookbook
====================
Configures a node as a NFS server.

Requirements
------------
#### cookbooks
- `nfs` - The nfs community cookbook should run before nfs-nativex runs

#### packages
- `nfs-utils` - nfs-utils required for NFS server

Recipes
-------
#### default.rb
Calls nfs-nativex::export.

#### export.rb
Configures a node as a NFS server using the appropriate options provided in attributes.

Attributes
----------
#### nfs-nativex::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['nfs-nativex']['export_dir']</tt></td>
    <td>String</td>
    <td>NFS export directory.</td>
    <td><tt>"/mnt/ebs"</tt></td>
  </tr>
 <tr>
   <td><tt>['nfs-nativex']['network']</tt></td>
   <td>String</td>
   <td>NFS subnet.</td>
   <td><tt>"172.16.0.0/12"</tt></td>
 </tr>
 <tr>
   <td><tt>['nfs-nativex']['writeable']</tt></td>
   <td>Boolean</td>
   <td>If set to true, exported directory is writable.</td>
   <td><tt>false</tt></td>
 </tr>
 <tr>
   <td><tt>['nfs-nativex']['sync']</tt></td>
   <td>Boolean</td>
   <td>If set to true, NFS will use synchronous write. If set to false it will use async.</td>
   <td><tt>true</tt></td>
 </tr>
 <tr>
   <td><tt>['nfs-nativex']['options']</tt></td>
   <td>Array</td>
   <td>Additional NFS options.</td>
   <td><tt>['no_root_squash']</tt></td>
 </tr>
</table>

Usage
-----
#### nfs-nativex::default
Just include `nfs-nativex` in your node's `run_list`.

Example usage in a role cookbook:
node.default['nfs-nativex']['export_dir'] = "/mnt/ebs"
node.default['nfs-nativex']['network'] = "172.16.0.0/12"
node.default['nfs-nativex']['writeable'] = true
node.default['nfs-nativex']['sync'] = true

License and Authors
-------------------
Authors: Adrian Herrera
