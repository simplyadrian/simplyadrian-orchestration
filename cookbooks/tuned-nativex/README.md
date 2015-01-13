tuned-nativex Cookbook
======================
This cookbook installs, configures and enables the 'tuned' service.  It also allows for custom profiles to be created and applied by the cookbook.

Attributes
----------

#### default.rb
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['tuned']['active_profile']</tt></td>
    <td>string</td>
    <td>Name of the tuned profile you wish to be active.</td>
    <td><tt>"default"</tt></td>
  </tr>
  <tr>
    <td><tt>node['tuned']['profiles_dir']</tt></td>
    <td>string</td>
    <td>Path to install custom profiles.</td>
    <td><tt>"/etc/tune-profiles"</tt></td>
  </tr>
  <tr>
    <td><tt>node['tuned']['known_custom_profiles']</tt></td>
    <td><tt>Set</tt> of <tt>string</tt></td>
    <td>Set of known custom profile names that are defined in the <tt>files</tt> of this cookbook.</td>
    <td><tt>Set.new(["cassandra-ssd-storage"])</tt></td>
  </tr>
  <tr>
    <td><tt>node['tuned']['files_in_each_profile']</tt></td>
    <td>tt>Set</tt> of <tt>string</tt></td>
    <td>Set of filenames that are defined for each custom profile and should be copied to the <tt>profiles_dir</tt>.</td>
    <td><tt>Set.new(["ktune.sh", "ktune.sysconfig", "sysctl.ktune", "tuned.conf"])</tt></td>
  </tr>
</table>

Recipes
-------

* `default`: Installs, configures and enables the 'tuned' service
* `apply_profile`: Applies the tuned profile specified by `node['tuned']['active_profile']`. If the profile is a custom profile, the profile will be created and the files from the cookbook will be copied to `node['tuned']['profiles_dir']`.

Usage
-----
#### tuned-nativex::default

Just include `tuned-nativex` in your node's `run_list` to install 'tuned' with it's out-of-the-box configuration:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[tuned-nativex]"
  ]
}
```

#### tuned-nativex::apply_profile

- Include this recipe in the node's `run_list` (after `default`) to enable a specific built-in or custom profile.
- Set `node['tuned']['active_profile']` to specify which profile to use.

Creating Custom Profiles
------------

1. Decide on a name for your profile.
2. Create a directory in cookbook at `files/default/custom-profiles/<profile_name>`
3. In the new profile directory, create a file for each `node['tuned']['files_in_each_profile']`
4. Configure the contents of the files as needed by your profile
5. Update the `default` attribute file, including the name of your new profile in the Set defined by `node['tuned']['known_custom_profiles']`
6. Use your new custom profile by setting `node['tuned']['active_profile']` in your node's environment or role cookbook.

License and Authors
-------------------
Authors: Derek Bromenshenkel
