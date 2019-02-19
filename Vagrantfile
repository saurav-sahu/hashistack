VAGRANTFILE_API_VERSION = "2"
NUM_OF_NODES = 2

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"
  if Vagrant.has_plugin?("Vagrant-cachier")
    config.cache.scope = :box
  end
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 3
  end
  config.vm.provision :shell, inline: "echo 'Hello World!'"
  config.vm.provision "basic", type: "shell", path: "./scripts/basic.sh"
  # config.vm.provision "docker", type: "shell", path: "./scripts/docker.sh"
  config.vm.provision "hashistack", type: "shell", path: "./scripts/hashistack.sh"

  NUM_OF_NODES.times do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.hostname = "node#{i}"
      node.vm.network "private_network", ip: "192.168.1.#{i+100}"
      node.vm.provision :shell, inline: "echo 'Hello from node#{i}'"
    end
  end

  config.vm.define "systems" do |node|
    node.vm.hostname = "systems"
    node.vm.network "private_network", ip: "192.168.1.200"
    node.vm.provision "consul-server", type: "shell", path: "./scripts/consul-server.sh"
  end
end