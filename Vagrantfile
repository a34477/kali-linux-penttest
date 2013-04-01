require 'rbconfig'

Vagrant::Config.run do | config |

  config.ssh.forward_agent = true
  config.vm.boot_mode = :gui

  config.vm.define :kali do | kali |
    kali.ssh.private_key_path = "ssh-keys/kali-1.0"
    kali.vm.box = "kali-1.0-amd64"
    kali.vm.box_url = "http://ftp.sliim-projects.eu/boxes/kali-linux-1.0-amd64.box"

    kali.vm.customize ["modifyvm", :id, "--name", "pentest-env-kali-1.0"]
    kali.vm.customize ["modifyvm", :id, "--memory", 1024]

    kali.vm.provision :chef_solo do | chef |
      chef.cookbooks_path = "cookbooks"

      chef.json = {
        "emacs24" => {
          "use_unstable" => true
        }
      }

      chef.add_recipe("emacs24")
    end

    kali.vm.provision :shell, :inline => "apt-get install -y emacs-snapshot"

    kali.vm.base_mac = "080027" + rand(0xffffff).to_s(16).upcase
    kali.vm.network :hostonly, "192.168.107.42"
    kali.vm.network :bridged, :bridge => "eth0"

    kali.vm.share_folder "v-root", "/root/data", "data/", :nfs => true

    if File.exists?(ENV["HOME"] + "/repositories")
      kali.vm.share_folder "repositories", "/root/repositories", ENV["HOME"] + "/repositories", :nfs => true
    end
  end

end
