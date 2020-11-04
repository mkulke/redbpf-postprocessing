Vagrant.configure("2") do |config|
  config.vm.box = "generic/fedora33"
  config.vm.box_version = "3.1.0"
  config.vm.network "private_network", ip: "10.10.10.4"

  config.vm.provider "virtualbox" do |vb|
    vb.linked_clone = true
    vb.memory = 3072
    vb.cpus = 2
  end

  config.ssh.forward_agent = true
  config.ssh.insert_key = false
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

  config.vm.synced_folder ".", "/vagrant",
    type: "rsync",
    rsync__exclude: [
      ".git/",
      "target/",
      "README.md",
      "Vagrantfile",
    ],
    rsync__auto: true

  config.vm.provision :shell,
    path: "system.sh",
    privileged: true,
    env: {"VAGRANT" => true}

  config.vm.provision :shell,
    path: "user.sh",
    privileged: false,
    env: {"VAGRANT" => true}
end
