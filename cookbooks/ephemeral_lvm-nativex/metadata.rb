name             'ephemeral_lvm-nativex'
maintainer       'NativeX'
maintainer_email 'derek.bromenshenkel@nativex.com'
license          'All rights reserved'
description      'Wraps ephemeral_lvm for NativeX, where it adds a dependency to xfs cookbook.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'xfs'
depends 'ephemeral_lvm'
