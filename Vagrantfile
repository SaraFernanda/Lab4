# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "router" do |router|
      router.vm.box = "ubuntu/bionic64"
      router.vm.network "private_network", ip: "20.0.2.10"
      router.vm.network "public_network"
      router.vm.provision "shell", path: "router_setup.sh"
      #router.vm.provision "file", source: "console-setup", destination: "/etc/console_setup"
      router.vm.provision "shell", path: "router_iptables.sh"
  end

  config.vm.define "client" do |client|
      client.vm.box = "ubuntu/bionic64"
      client.vm.network "private_network", ip: "20.0.2.20"
      client.vm.provision "shell", path: "client_setup.sh"
      #client.vm.provision "file", source: "console-setup", destination: "/etc/console_setup"
      client.vm.provision "shell", path: "client_iptables.sh"
  end

  	config.vm.define "bd" do |bd|
    bd.vm.box = "ubuntu/bionic64"
    bd.vm.network "private_network", ip: "192.168.0.30"
    bd.vm.network "public_network", ip: "192.168.1.30"
    bd.vm.provision "shell", inline: <<-SHELL
        echo "bdserver" > /etc/hostname
        
        hostname -b dbserver
        echo "***> sudo  apt-get upadted"; sudo apt-get update
        echo "***> sudo  apt install -y postgresql postgresql-contrib"; sudo  apt install -y postgresql postgresql-contrib
      SHELL
  end

  	config.vm.define "app" do |app|
    app.vm.box = "ubuntu/bionic64"
    app.vm.box = "exeldigital/trusty64-apache2-php5"
    app.vm.network "private_network", ip: "192.168.0.40"
    app.vm.network "public_network", ip: "192.168.1.40"
    app.vm.provision "shell", inline: <<-SHELL
        echo "appserver" > /etc/hostname
        hostname -b appserver

        echo "***> sudo  apt-get upadted"; sudo apt-get update
        echo "***> sudo apt-get install -y nodejs"; sudo apt-get install -y nodejs
      SHELL
  end
end
