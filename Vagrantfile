require 'rbconfig'

Vagrant::configure('2') do | config |

  config.ssh.forward_agent = true

  config.vm.define :kali do | kali |

    kali.ssh.private_key_path = "ssh-keys/kali-1.0"
    kali.vm.box = "kali-1.0-amd64"
    kali.vm.box_url = "http://ftp.sliim-projects.eu/boxes/kali-linux-1.0-amd64.box"

    config.vm.provider "virtualbox" do |v|
      v.gui = true
      v.customize ["modifyvm", :id, "--name", "pentest-env-kali-1.0"]
      v.customize ["modifyvm", :id, "--memory", 1024]
    end

    kali.vm.provision :chef_solo do | chef |
      chef.cookbooks_path = "cookbooks"

      chef.json = {
        "emacs24" => {
          "use_unstable" => true
        }
      }

      chef.add_recipe("emacs24")
    end

    kali.vm.network :public_network
    kali.vm.network :private_network, ip: "192.168.107.42"

    if File.exists?(ENV["HOME"] + "/repositories")
      kali.vm.synced_folder ENV["HOME"] + "/repositories", "/root/repositories"
    end
  end

end
