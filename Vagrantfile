# -*- mode: ruby -*-
# vi: set ft=ruby :

timezone = "America/Los_Angeles"

Vagrant.configure("2") do |config|

    # centos 6.4 64-bit box with guest additions 4.3
    config.vm.box = "centos-6.4-x64-vb4.3"
    config.vm.box_url = "http://ofmldev.com/vagrant-boxes/centos64-x64-vbox43.box"

    # network config
    config.vm.hostname = "mt.local"
    config.vm.network "private_network", ip: "11.11.11.15"
    config.vm.network :forwarded_port, guest: 80, host: 8080
    config.vm.network :forwarded_port, guest: 3306, host: 8081


    # synced folders
    config.vm.synced_folder "www", "/var/www", {:mount_options => ['dmode=777','fmode=777']}
    config.vm.synced_folder "vhosts", "/etc/httpd/vhosts", {:mount_options => ['dmode=777','fmode=777']}

    # ssh agent forwarding
    config.ssh.forward_agent = true

    # virtualbox config
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512"]
    end

    # set local timezone
    config.vm.provision "shell",
        inline: "sudo mv /etc/localtime /etc/localtime.bak && sudo ln -s /usr/share/zoneinfo/"+timezone+" /etc/localtime"

    config.vm.provision "puppet" do |puppet|
       puppet.manifests_path = "puppet/manifests"
       puppet.manifest_file  = "default.pp"
       puppet.module_path = "puppet/modules"
    end

    # flush firewall rules and set chains to policy ACCEPT: filter
    config.vm.provision "shell",
        inline: "sudo service iptables stop && sudo chkconfig iptables off"

end