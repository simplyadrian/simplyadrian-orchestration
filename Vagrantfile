# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # vagrantup.com

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = 'vagrant-centos-65-x86_64-minimal'

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = 'http://files.brianbirkinbine.com/vagrant-centos-65-x86_64-minimal.box'

  # This can be set to the host name you wish the guest machine to have. Vagrant
  # will automatically execute the configuration necessary to make this happen.
  config.vm.hostname = 'nativex-centos-6-5'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  #config.vm.network :forwarded_port, guest: 4000, host: 4000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network 'private_network', ip: '192.168.33.10'

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:

  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with CFEngine. CFEngine Community packages are
  # automatically installed. For example, configure the host as a
  # policy server and optionally a policy file to run:
  #
  # config.vm.provision "cfengine" do |cf|
  #   cf.am_policy_hub = true
  #   # cf.run_file = "motd.cf"
  # end
  #
  # You can also configure and bootstrap a client to an existing
  # policy server:
  #
  # config.vm.provision "cfengine" do |cf|
  #   cf.policy_server_address = "10.0.2.15"
  # end

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file default.pp in the manifests_path directory.
  #
  # config.vm.provision "puppet" do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "default.pp"
  # end

  # Chef Zero plugin configuration
  #config.chef_zero.enabled = true
  #config.chef_zero.chef_repo_path = '.'

  # Vagrant-omnibus plugin configuration
  ##config.omnibus.chef_version = "11.4.0"

  # Enable provisioning with Chef Solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  ##config.vm.provision :chef_client do |chef|
    #chef.cookbooks_path = 'cookbooks'
    #chef.roles_path = 'roles'
    #chef.data_bags_path = 'data_bags'

    ##chef.chef_server_url = 'https://api.opscode.com/organizations/jhauf-nativex'
    #chef.node_name = 'jhauf'
    ##chef.validation_key_path = '.chef/jhauf-nativex-validator.pem'
    ##chef.validation_client_name = 'jhauf-nativex-validator'
    ##chef.encrypted_data_bag_secret_key_path = '.chef/encrypted_data_bag_secret'
    #chef.add_role 'spacewalk-server'
    #chef.delete_node = true
    #chef.delete_client = true
    # You may also specify custom JSON attributes:
    # chef.json = { :mysql_password => "foo" }
  ##end

  #
  # Chef Solo will automatically install the latest version of Chef for you.
  # This can be configured in the provisioner block:
  #
  # config.vm.provision "chef_solo" do |chef|
  #   chef.version = "11.16.4"
  # end
  #
  # Alternative you can disable the installation of Chef entirely:
  #
  # config.vm.provision "chef_solo" do |chef|
  #   chef.install = false
  # end

  # Enable provisioning with Chef Zero. The Chef Zero provisioner accepts the
  # exact same parameter as the Chef Solo provisioner:
  #
  # config.vm.provision "chef_zero" do |chef|
  #   chef.cookbooks_path = "~/chef/cookbooks"
  #   chef.roles_path     = "~/chef/roles"
  #   chef.data_bags_path = "~/chef/data_bags"
  #
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { mysql_password: "foo" }
  # end

  # Enable provisioning with Chef Server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Hosted Chef platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision "chef_client" do |chef|
  #   chef.chef_server_url     = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Hosted Chef platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
  #
  # Chef Client will automatically install the latest version of Chef for you.
  # This can be configured in the provisioner block:
  #
  # config.vm.provision "chef_client" do |chef|
  #   chef.version = "11.16.4"
  # end
  #
  # Alternative you can disable the installation of Chef entirely:
  #
  # config.vm.provision "chef_client" do |chef|
  #   chef.install = false
  # end

  # Enable provisioning with Chef Apply, specifying an inline recipe to execute
  # on the target system.
  #
  # config.vm.provision "chef_apply" do |chef|
  #   chef.recipe = <<-RECIPE
  #     package "curl"
  #   RECIPE
  # end
  #
  # Chef Apply will automatically install the latest version of Chef for you.
  # This can be configured in the provisioner block:
  #
  # config.vm.provision "chef_apply" do |chef|
  #   chef.version = "11.16.4"
  # end
end