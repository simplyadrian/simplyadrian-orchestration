apache2-nativex Cookbook
========================
This cookbook sets up apache2 for NativeX. A minimal configuration of a vhost file at this point for testing of html display. More will need to be developed to make this a meaningful production cookbook.

Requirements
============

- Apache2 - Official windows cookbook from opscode https://supermarket.chef.io/cookbooks/apache2

Attributes
----------

#### apache2-nativex::vhost
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['apache2-nativex']['app_name']</tt></td>
    <td>String</td>
    <td>Provide the name of the app you are loading into Apache2</td>
    <td><tt>helloWorld</tt></td>
  </tr>
</table>

Usage
-----
#### apache2-nativex::vhost

Just include `apache2-nativex::vhost` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[apache2-nativex::vhost]"
  ]
}
```

License and Authors
-------------------
Authors: Adrian Herrera
