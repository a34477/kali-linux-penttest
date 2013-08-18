def target (vconfig)
  vconfig.vm.define :bricks do | target |
    target.vm.box = "debian-squeeze-64"
    target.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-607-x64-vbox4210.box"

    target.berkshelf.enabled = true

    target.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "pentest-env-target-bricks"]
    end

    target.vm.provision :chef_solo do | chef |
      chef.json = {
        "mysql" => {
          "server_root_password" => "bricks",
          "server_debian_password" => "bricks",
          "server_repl_password" => "bricks"
        },
        "bricks" => {
          "codename" => "raidak"
        }
      }
      chef.add_recipe("bricks")
    end

    target.vm.network :private_network, ip: "192.168.107.104"
  end
end
