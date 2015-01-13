python-nativex Cookbook
=======================
Install python and includes specified packages.

Requirements
------------
Depends on the python community cookbook.

Attributes
----------
default['python_nativex']['packages'] = {}

#### python-nativex::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['python-nativex']['packages']</tt></td>
    <td>Array</td>
    <td>Additional python packages to install on a node.</td>
    <td><tt>empty</tt></td>
  </tr>
</table>

Usage
-----
#### python-nativex::default
Calls python-nativex::pippackages

Example usage in a role cookbook adding several packages:
node.default['python-nativex']['packages'] = ["pyyaml", "kombu", "lockfile", "asyncio", "paramiko", "boto", "awscli"]

License and Authors
-------------------
Authors: Adrian Herrera
