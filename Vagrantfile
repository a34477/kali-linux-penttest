require 'rbconfig'

Vagrant::Config.run do | config |

  config.ssh.forward_agent = true
  config.vm.boot_mode = :gui

  config.vm.define :bt5 do | bt5 |
    bt5.vm.box = "bt5-r3-amd64.box"

    bt5.vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    bt5.vm.customize ["modifyvm", :id, "--memory", 1024]

    bt5.vm.base_mac = "0800" + rand(0xffffffff).to_s(16).upcase

    bt5.vm.network :hostonly, "192.168.13.37"

    bt5.vm.share_folder "v-root", "/root/data", "data/", :nfs => true

  end

end
