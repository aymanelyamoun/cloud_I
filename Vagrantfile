Vagrant.configure("2") do |config|
    #Server Node
    config.vm.define "ael-yamoS" do |server_conf|
        # server_conf.vm.box = "bento/debian-11"
        server_conf.vm.box = "hashicorp/bionic64"
        # server_conf.vm.box = "hashicorp/bionic64"
        server_conf.vm.box_version = "1.0.282"
        server_conf.vm.hostname = "Server"
        server_conf.vm.network "private_network", ip: "192.168.56.110"
        server_conf.vm.provider "virtualbox" do |vb|
            vb.name = "ael-yamoS"
            vb.memory = "2048"
            vb.cpus = 4
        end
    end
end

  