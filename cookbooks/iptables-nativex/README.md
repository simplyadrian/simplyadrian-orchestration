iptables-nativex Cookbook
=========================
This cookbook sets up iptable chain rules for host level firewall per security best practices. This cookbook is designed to be extensible and additional recipes should be built to create a firewall for new roles or services. i.e. web servers, securing ssh, privoxy servers, etc..

Requirements
------------

#### packages
- `iptables` - Official iptables cookbook from opscode: https://supermarket.chef.io/cookbooks/iptables

Attributes
----------
#### iptables-nativex::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['iptables-nativex']['privoxy']['addresses']</tt></td>
    <td>String</td>
    <td>the CIDR or CIDR's you wish to use to retrict iptables further </td>
    <td><tt>empty? utilizing the all_privoxy templates</tt></td>
  </tr>
  <tr>
    <td><tt>['iptables-nativex']['ssh']['addresses']</tt></td>
    <td>String</td>
    <td>the CIDR or CIDR's you wish to use to retrict iptables further </td>
    <td><tt>empty? utilizing the all_ssh templates</tt></td>
  </tr>
  <tr>
    <td><tt>['iptables-nativex']['web']['addresses']</tt></td>
    <td>String</td>
    <td>the CIDR or CIDR's you wish to use to retrict iptables further </td>
    <td><tt>empty? utilizing the all_http and all_https templates</tt></td>
  </tr>
</table>

Usage
-----
#### iptables-nativex::default

To restrict with all current recipes just include `iptables-nativex` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[iptables-nativex]"
  ]
}
```

To configure iptables to allow for the privoxy service include `iptables-nativex::privoxy` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[iptables-nativex::privoxy]"
    ]
}
```
To configure iptables to allow for the ssh service include `iptables-nativex::ssh` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[iptables-nativex::ssh]"
    ]
}
```
To configure iptables to allow for the web service on both ports 80 and 443 include `iptables-nativex::web` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[iptables-nativex::web]"
    ]
}
```

License and Authors
-------------------
Authors: Adrian Herrera
