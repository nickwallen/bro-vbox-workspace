# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # all hosts built on centos 6
  config.vm.box = "bento/centos-6.7"
  #config.vm.box = "bento/fedora-22"
  #config.vm.box = "centos/7"
  #config.vm.box = "bento/centos-7.1"
  config.ssh.insert_key = "true"

  # enable the hostmanager plugin
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

  # host definition
  config.vm.define "bro1" do |node|

    # host settings
    node.vm.hostname = "bro1"
    node.vm.network "private_network", ip: "192.168.66.121"

    # vm settings
    node.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  end

  # provisioning
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.extra_vars = {
      kafka_broker_url: "bro1:9092",
      sniff_interface: "eth1"
    }
  end

  config.vm.synced_folder "../bro-plugins", "/opt/bro-plugins"
end
