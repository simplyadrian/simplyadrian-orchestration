# role-onpremise-base-nativex-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['role-onpremise-base-nativex']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### role-onpremise-base-nativex::default

Include `role-onpremise-base-nativex` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[role-onpremise-base-nativex::default]"
  ]
}
```

## License and Authors

Author:: NativeX (<derek.bromenshenkel@nativex.com>)
