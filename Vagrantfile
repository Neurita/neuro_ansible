# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.box_check_update = true
  config.vm.hostname = "remote"
  config.vm.network :private_network, ip: "10.11.10.11"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.gui = false
    vb.customize ["modifyvm", :id, "--cpus", 2]
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.verbose = true
    ansible.limit = "remote"
    ansible.inventory_path = "hosts"
    ansible.extra_vars = {
      n_cpus: 2,
    }
  end
end
