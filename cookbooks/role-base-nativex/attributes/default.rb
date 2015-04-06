# The directory where you want your ssh keys stored. Currently being
# use with the git_auth.rb recipe for ssh authentication to github.com
node.default['role-base-nativex']['ssh']['home'] = '/root/.ssh'
# The user who will own the ssh keys above.
node.default['role-base-nativex']['ssh']['user'] = 'root'
# The group that will own the ssh keys above
node.default['role-base-nativex']['ssh']['group'] = 'root'
# The name of the ssh_key also mentioned above.
node.default['role-base-nativex']['ssh']['key_name'] = 'git_nativex'