# Install sshkey gem into chef
chef_gem 'sshkey'

# Base location of ssh key
pkey = node['syncdata_nativex']['ssh']['home'] + '/.ssh/id_rsa'

# Generate a keypair with Ruby
require 'sshkey'
sshkey = SSHKey.generate(
  type: 'RSA',
  comment: "#{node['syncdata_nativex']['ssh']['user']}@#{node['hostname']}"
)

# Create ~/.ssh directory
directory "#{node['syncdata_nativex']['ssh']['home']}/.ssh" do
  owner node['syncdata_nativex']['ssh']['user']
  group node['syncdata_nativex']['ssh']['group']
  mode 00700
end

# Store private key on disk
template pkey do
  owner node['syncdata_nativex']['ssh']['user']
  group node['syncdata_nativex']['ssh']['group']
  variables(ssh_private_key: sshkey.private_key)
  mode 00600
  action :create_if_missing
end

# Store public key on disk
template "#{pkey}.pub" do
  owner node['syncdata_nativex']['ssh']['user']
  group node['syncdata_nativex']['ssh']['group']
  variables(ssh_public_key: sshkey.ssh_public_key)
  mode 00644
  action :create_if_missing
end

# Save public key to chef-server as syncdata_nativex_pubkey 
ruby_block 'node-save-pubkey' do
  block do
    node.set_unless['syncdata_nativex_pubkey'] = File.read("#{pkey}.pub")
    node.save unless Chef::Config['solo']
end