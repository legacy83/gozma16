Vagrant.configure("2") do |config|
    config.ssh.forward_agent = true
    config.ssh.insert_key = false

    # Ubuntu 16.04 - Xenial Xerus
    config.vm.define "gozma16" do |gozma16|
        gozma16.vm.box = "geerlingguy/ubuntu1604"
        gozma16.vm.hostname = "gozma16"
        gozma16.vm.network "private_network", ip: "192.168.27.16"
        config.vm.provision "ansible" do |ansible|
            ansible.playbook = "playbook.yml"
        end
    end
end