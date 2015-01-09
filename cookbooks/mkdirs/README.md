mkdirs Cookbook
===============
Creates \[empty\] directories defined in a node attribute list.

Attributes
----------
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mkdirs']</tt></td>
    <td>Array/List</td>
    <td>The directories to create. See example below.</td>
    <td><tt>empty list []</tt></td>
  </tr>
</table>

Usage
-----
Just include `mkdirs` in your node's `run_list` and configure the mkdirs attribute:

```json
{
  "name":"my_node",
  "default_attributes": {
    "mkdirs": [{
      "path": "/foo"
    }, {
      "path": "/foo/bar",
      "owner": "bar_owner",
      "group": "bar_group",
      "mode": "0774"
    }]
  }
  "run_list": [
    "recipe[mkdirs]"
  ]
}
```