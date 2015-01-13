r-nativex Cookbook
==================
Leverages the r_package provider from the r community cookbook to install R packages from CRAN.

Requirements
------------
#### cookbooks
- `r` - This cookbook installs additional packages for r on top of the community r cookbook.

#### packages
- `unixODBC-devel` - r-nativex::rpackages needs unix ODBC development packages.
- `rinruby` - TODO: why?

Recipes
-------
#### default.rb
Installs unixODBC-devel package required by r-nativex::rpackages
Calls r-nativex::rpackages

#### rpackages.rb
Installs additional r packages specified in the cookbook attribute.

Attributes
----------
#### r-nativex::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['r-nativex']['packages']</tt></td>
    <td>Array</td>
    <td>Additional r packages to install</td>
    <td><tt>empty {}</tt></td>
  </tr>
</table>

Usage
-----
#### r-nativex::default
Just include `r-nativex` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[r-nativex]"
  ]
}
```

In a role cookbook be sure to first include r then include r-nativex. An example of using r-nativex to install
several additional packages from CRAN:
node.default['r_nativex']['packages'] = ["optparse", "yaml", "data.table", "ffbase", "ROCR", "ETLUtils", "rjson",
  "RODBC", "ff", "gbm", "LaF"]

License and Authors
-------------------
Authors: Adrian Herrera
