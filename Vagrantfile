# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.9.0'
Vagrant.configure(2) do |config|
  config.vm.hostname = 'php7-dev-env'
  config.vm.box = 'debian/contrib-jessie64'
  config.vm.network :private_network, type: 'dhcp'

  # Run the Chef recipies to do the heavy lifting
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      project_dir: '/vagrant/dev',
    }
    chef.run_list = [
      'recipe[composer]',
      'recipe[git]',
      'recipe[php7]',
    ]
  end

  # Force the virtualbox guest env to use the host DNS
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

end
