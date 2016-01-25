# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = [
  { hostname: "node1", ip: "192.168.66.121", memory: "2048", cpus: 2 }
]

Vagrant.configure(2) do |config|

  # all hosts built on centos 6
  config.vm.box = "bento/centos-6.7"
  config.ssh.insert_key = "true"

  # enable the hostmanager plugin
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

  # host definition
  hosts.each_with_index do |hosts, index|
    config.vm.define hosts[:hostname] do |node|

      # host settings
      node.vm.hostname = hosts[:hostname]
      node.vm.network "private_network", ip: hosts[:ip]

      # vm settings
      node.vm.provider "virtualbox" do |vb|
        vb.memory = hosts[:memory]
        vb.cpus = hosts[:cpus]
      end
    end
  end

  # provisioning
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "./playbook.yml"
    ansible.sudo = true
    #ansible.inventory_path = "../../inventory/singlenode-vagrant"
    ansible.extra_vars = {
      kafka_broker_url: "node1:9092",
      bro_topic: "bro"
    }
  end
end
