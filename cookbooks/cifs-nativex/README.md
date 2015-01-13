cifs-nativex Cookbook
=====================
Just (at least initially) a bare-bones cookbook to install the
"Common Internet File System" (CIFS) (formerly known as
"Server Message Block" (SMB)) system package so that you can connect to volumes
via Windows file sharing protocols.

http://technet.microsoft.com/en-us/library/cc939973.aspx
https://en.wikipedia.org/wiki/CIFS

Usage
-----
Just include `cifs-nativex` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cifs-nativex]"
  ]
}
```

License and Authors
-------------------
Authors: Brett Stime