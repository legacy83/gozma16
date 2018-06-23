Vagrant.configure("2") do |config|
  # Ubuntu 16.04 - Xenial Xerus
  config.vm.define "ubuntu16" do |ubuntu16|
    ubuntu16.vm.box = "bento/ubuntu-16.04"
    ubuntu16.vm.hostname = "gozma16"
    ubuntu16.vm.network "private_network", ip: "192.168.27.16"
    # provisioners
    ubuntu16.vm.provision 'shell', path: './vagrant/provision/provision-01--common.sh'
    ubuntu16.vm.provision 'shell', path: './vagrant/provision/provision-02--webserver.sh'
    ubuntu16.vm.provision 'shell', path: './vagrant/provision/provision-03--databases.sh'
    ubuntu16.vm.provision 'shell', path: './vagrant/provision/provision-04--extras.sh'
    ubuntu16.vm.provision 'shell', path: './vagrant/provision/provision-05--cleanup.sh'
    # synced folders
    ubuntu16.vm.synced_folder '.', '/vagrant', disabled: true
    ubuntu16.vm.synced_folder '~/PhpStorm__Projects', '/projects', owner: 'vagrant', group: 'vagrant'
    # configuration
    ubuntu16.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end
end
