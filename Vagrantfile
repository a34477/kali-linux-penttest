# This source file is part of pentest-env.
#
# pentest-env is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# pentest-env is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with pentest-env. If not, see <http://www.gnu.org/licenses/gpl-3.0.html>.

require 'rbconfig'
require File.expand_path('lib/pentestenv/customization')

customdir = "custom"
if Dir.exists?(ENV['HOME'] + "/.pentest-env")
  customdir = ENV['HOME'] + "/.pentest-env"
end

Vagrant::configure('2') do | config |

  config.ssh.forward_agent = true
  config.vm.define :kali do | kali |

    kali.ssh.private_key_path = "ssh-keys/kali-1.0"
    kali.ssh.username = "root"

    kali.vm.box = "kali-1.0.4-amd64"
    kali.vm.box_url = "http://ftp.sliim-projects.eu/boxes/kali-linux-1.0.4-amd64.box"

    # Kali customizations
    kali.vm.network :public_network
    kali.vm.network :private_network, ip: "192.168.107.145"
    kali.vm.provider "virtualbox" do |v|
      v.gui = true
      v.customize ["modifyvm", :id, "--name", "pentest-env-kali-1.0"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--macaddress3", "0800276cf835"]
    end

    #Running kali customizations
    customization = Pentestenv::Customization.new(customdir, kali)
    customization.packages
    customization.synced_folders
    customization.scripts

    # Kali provisionning
    kali.vm.provision :chef_solo do | chef |
      chef.install = false
      chef.cookbooks_path = 'cookbooks/'
      chef.add_recipe('apt')
      chef.add_recipe('kali::top10')
    end
  end

  #Running targets customizations
  customization = Pentestenv::Customization.new(customdir, config)
  customization.targets
end
