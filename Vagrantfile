# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # create Bastion -local
  config.vm.define :bastion do |bastion_local_config|
      bastion_local_config.vm.box = "ubuntu/trusty64"
      #bastion_local_config.vm.box = "centos/7"
      bastion_local_config.vm.hostname = "bastion" 
      bastion_local_config.vm.network :private_network, ip: "10.0.10.10" ## change IP
      bastion_local_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
      bastion_local_config.vm.provision :shell, path: "boot-strap.sh"
  end
end
