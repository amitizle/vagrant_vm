# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

def mount_dirs(config)
  dirs_mapping_file = "dirs_mapping.json"
  if File.exist?(dirs_mapping_file)
    JSON.parse(File.read(dirs_mapping_file)).each do |mapping|
      config.vm.synced_folder(File.expand_path(mapping["host"]), mapping["guest"])
    end
  end
end

Vagrant.configure(2) do |config|
  config.vm.box = ENV['VAGRANT_BOX'] || "debian/wheezy64"
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.iso_path = "http://download.virtualbox.org/virtualbox/%{version}/VBoxGuestAdditions_%{version}.iso"
  end
  mount_dirs(config)
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.roles_path = "roles"
    vagrant_node_json = JSON.parse(File.read("nodes/vagrant.json"))
    chef.json = vagrant_node_json
    chef.run_list = vagrant_node_json['run_list']
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
end
