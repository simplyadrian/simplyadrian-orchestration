role-cdccass1-onprem-nativex Cookbook
=====================
A role cookbook for managing the Chicago cdc-cass1 production Cassandra cluster nodes.

- Cassandra configuration is handled by Spacewalk.
- This cookbook's intentions are to:
  * Provide a delivery mechanism for cluster maintenance tasks like backups, repair, weekly CF cleanup, etc.  Previously this was handled by Group Policy Objects over PBIS.
  * Provide ActiveDirectory user authentication.
  * Deliver the automated patching solution to these nodes.

Requirements
------------
#### cookbooks
- `role-onpremise-base-nativex` - Delivers the autopatch & ActiveDirectory functionality.

Recipes
-------
#### default.rb
The standard Role Cookbook recipe. It overrides any necessary attributes and sets the runlist for this Role.
Overrides autopatch settings for auto-reboot=off and skipping DSE packages upon upgrade.  Then invokes role-onpremise-base-nativex and this cookbook's maintenance_tasks recipe.

#### maintenance_tasks.rb
Lays down scripts and associated cron tasks that schedule various cluster maintenance operations specifically on the cdc-cass1 cluster, Chicago datacenter nodes.

Attributes
----------
#### role-cdccass1-onprem-nativex::default
These attributes are designed as a simple on/off switch for the maintenance tasks.  To change the contents or behavior of the tasks/scripts requires modifying the files in this cookbook and releasing.
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['role-cdccass1-onprem-nativex']['cron_repair_enabled']</tt></td>
    <td>bool</td>
    <td>Enables or disables the cron task for performing cluster Repair.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['role-cdccass1-onprem-nativex']['cron_activitytracking_drop_enabled']</tt></td>
    <td>bool</td>
    <td>Enables or disables the cron task for dropping the weekly ActivityTracking column family.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['role-cdccass1-onprem-nativex']['cron_activitytracking_file_cleanup_enabled']</tt></td>
    <td>bool</td>
    <td>Enables or disables the cron task for removing the data files for ActivitTracking column families that have been dropped.</td>
    <td><tt>node['role-cdccass1-onprem-nativex']['cron_activitytracking_drop_enabled']</tt></td>
  </tr>
  <tr>
    <td><tt>['role-cdccass1-onprem-nativex']['cron_take_snapshot_enabled']</tt></td>
    <td>bool</td>
    <td>Enables or disables the cron task for taking snapshots of the Mobile keyspace.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['role-cdccass1-onprem-nativex']['cron_clear_snapshot_enabled']</tt></td>
    <td>bool</td>
    <td>Enables or disables the cron task for clearing snapshots of the Mobile keyspace.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['role-cdccass1-onprem-nativex']['cron_remove_backups_enabled']</tt></td>
    <td>bool</td>
    <td>Enables or disables the cron task for removing all 'backup' folders in the Mobile data directory.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['role-cdccass1-onprem-nativex']['cron_remove_cvincrem_enabled']</tt></td>
    <td>bool</td>
    <td>Enables or disables the cron task for removing CommVault Incremental backup data snapshots.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['role-cdccass1-onprem-nativex']['cron_remove_cvfull_enabled']</tt></td>
    <td>bool</td>
    <td>Enables or disables the cron task for removing CommVault Full backup data snapshots.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['role-cdccass1-onprem-nativex']['cron_move_cvbackups_enabled']</tt></td>
    <td>bool</td>
    <td>Enables or disables the cron task for moving snapshots to CommVault backup folders.</td>
    <td><tt>true</tt></td>
  </tr>
</table>

#### Setting attributes outside a release cycle
Recognizing the potential need to change one or more of the above values across the cluster quickly, without a release, here are some options:

  1. Individually change the attribute(s) for each node, on the Chef Server, like you would for any other attribute.  Painful, error-prone and time-consuming, but it works.
  2. Use the knife tools to search for the all the nodes and set the value:

    * Ex: display all the attributes for this cookbook on all nodes: `knife exec -E 'nodes.find("role:cdccass1-onprem") {|n| puts n.name; puts n["role-cdccass1-onprem-nativex"] }'`
    * Ex: display 'cron_repair_enabled' value on all nodes: `knife exec -E 'nodes.find("role:cdccass1-onprem") {|n| puts n.name; puts n["role-cdccass1-onprem-nativex"]["cron_repair_enabled"] }'`
    * Ex: set the repair task to "off": `knife exec -E 'nodes.find("role:cdccass1-onprem") {|n| n.normal["role-cdccass1-onprem-nativex"]["cron_repair_enabled"] = false; n.save; }'`
      - NOTE: In Chef 11.x there is no way to "remove" this override.  You're stuck with setting it using this method.  In Chef 12, there is 'rm_normal' method to reverse what this example does.
  3. In the Chef Server, modify the attribute directly in the 'cdccass1-onprem' Role, or 'cdccass1-onprem-[dev|prod]' environments. NOTE: THIS WOULD BE REVERTED BY ANY CHEF RELEASE AND SHOULD ONLY BE CONSIDERED IN AN EMERGENCY!!!
