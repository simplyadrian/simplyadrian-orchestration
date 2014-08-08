Description
===========

Installs & configures Likewise Open (now PBIS)

Requirements
============

Attributes
==========

default[:likewise][:domain_fqdn]

The fully qualified name of the domain to be joined. Example: example.com

default[:likewise][:machine_ou]

The Active Directory OU that the computer account will be created in. Example: ou=linux servers,dc=example,dc=com

default[:likewise][:registry_settings]

Hash of Likewise registry settings, for example:

```json
{
  "UserDomainPrefix": {
    "registry_key": "[HKEY_THIS_MACHINE\\Services\\lsass\\Parameters\\Providers\\ActiveDirectory\\]",
    "value_data": "EXAMPLECOM"
  },
  "AssumeDefaultDomain": {
    "registry_key": "[HKEY_THIS_MACHINE\\Services\\lsass\\Parameters\\Providers\\ActiveDirectory\\]",
    "value_data": "1"
  },
  "LoginShellTemplate": {
    "registry_key": "[HKEY_THIS_MACHINE\\Services\\lsass\\Parameters\\Providers\\ActiveDirectory\\]",
    "value_data": "/bin/zsh"
  },
  "HomeDirTemplate": {
    "registry_key": "[HKEY_THIS_MACHINE\\Services\\lsass\\Parameters\\Providers\\ActiveDirectory\\]",
    "value_data": "%H/%D/%U"
  },
  "RequireMembershipOf": {
    "registry_key": "[HKEY_THIS_MACHINE\\Services\\lsass\\Parameters\\Providers\\ActiveDirectory\\]",
    "value_data": [
      "EXAMPLE\\domain^admins",
      "EXAMPLE\\linux^admins"
    ]
  }
}
```

Usage
=====

Admin credentials with permission to join the domain are stored in an encrypted data bag.  By default it
will look for the "likewise_admin" item in the "passwords" data bag.  Currently, registry settings are
not idempotent due to challenges parsing the registry export format.
