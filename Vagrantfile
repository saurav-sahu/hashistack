VAGRANTFILE_API_VERSION = "2"
NUM_OF_NODES = 3

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end
  config.vm.provision :shell, inline: "echo 'Hello World!'"
  config.vm.provision "prompt", type: "shell", path: "./scripts/update-prompt.sh"
  config.vm.provision "basic", type: "shell", path: "./scripts/basic.sh"
  config.vm.provision "docker", type: "shell", path: "./scripts/docker.sh"
  config.vm.provision "hashistack", type: "shell", path: "./scripts/hashistack.sh"

  NUM_OF_NODES.times do |i|
    config.vm.define "saurav-#{i}" do |node|
      node.vm.hostname = "saurav-#{i}"
      node.vm.network "public_network", use_dhcp_assigned_default_route: true
      node.vm.provision :shell, inline: "echo 'Hello from saurav#{i}'"
    end
  end
end