# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  BASE_INT_NETWORK = "10.10.20"
  HO_NETWORK = "192.168.56"
  BOX_IMAGE = "ubuntu/jammy64"
  config.ssh.insert_key = false

  #configurazione web
  config.vm.define "web.m340" do |web|
    web.vm.box = BOX_IMAGE
    web.vm.hostname = "web.m340"
    web.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: "intnet" 
    web.vm.network "private_network", ip: "#{HO_NETWORK}.10", name: "VirtualBox Host-Only Ethernet Adapter"
    web.vm.synced_folder "web/", "/var/www/html"
    web.vm.provision "shell", path: "provision_web.sh"
  end
  
  # configurazione db
  config.vm.define "db.m340" do |db|
    db.vm.box = BOX_IMAGE
    db.vm.hostname = "db.m340"
    db.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: "intnet" 
    db.vm.provision "shell", path: "provision_db.sh"
  end
end