# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :remote, :autostart => true do |node|
    node.vm.box = "bento/ubuntu-18.04"
    node.vm.hostname = 'remote'
    node.vm.network :private_network, ip: "10.0.11.12"
    node.vm.synced_folder ".", "/vagrant", type: "virtualbox"
    node.vm.box_check_update = true
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.gui = false
      vb.customize ["modifyvm", :id, "--cpus", 2]
    end
    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
      ansible.limit = "remote"
      ansible.verbose = 'vvv'
      ansible.extra_vars = {
        n_cpus: 2,
      }
    end
  end
end
