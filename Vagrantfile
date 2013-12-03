# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	
	config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210-nocm.box"
	config.vm.box = "centos64"
	
	config.vm.provider :virtualbox do |vb|
	    vb.customize ["modifyvm", :id, "--memory", "512"]
	    vb.customize ["modifyvm", :id, "--usb", "off"]
	    vb.customize ["modifyvm", :id, "--cpus", "1"]
	    vb.customize ["modifyvm", :id, "--ioapic", "on"]
	end
	
	config.vm.provision "shell" do |s|
		s.path = "code/bootstrap.sh"
	end
			
	config.vm.define "static" do |static|
  	
	    static.vm.network "private_network", ip: "10.100.0.2"
	    static.vm.hostname = "static"
		static.vm.network "forwarded_port", guest: 80, host: 8081
  		static.vm.synced_folder "content/", "/opt/static"
  		
		static.vm.provision :chef_solo do |chef|
			chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
			chef.data_bags_path = "data_bags"
			chef.roles_path = "roles"
			chef.add_role("static")
		end
		
	end
	
end