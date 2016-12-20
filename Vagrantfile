Vagrant.configure("2") do |config|
    config.ssh.forward_agent = true
    config.ssh.insert_key = false

    # Ubuntu 16.04 - Xenial Xerus
    config.vm.define "ubuntu16" do |ubuntu16|
        ubuntu16.vm.box = "geerlingguy/ubuntu1604"
        ubuntu16.vm.hostname = "gozma16"
        ubuntu16.vm.network "private_network", ip: "192.168.27.16"
        ubuntu16.vm.provision "ansible" do |ansible|
            ansible.playbook = "playbook.yml"
        end
    end
end