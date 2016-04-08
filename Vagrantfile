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
require 'yaml'
require File.expand_path('lib/pentestenv/customization')

rc = "#{ENV['HOME']}/.pentestrc"
customization = Pentestenv::Customization.new(
  File.exist?(rc) ? YAML.load(File.read(rc)) : {})
chef_base_url = 'https://opscode-omnibus-packages.s3.amazonaws.com/debian/8/x86_64'
chef_deb_file = 'chef_12.8.1-1_amd64.deb'

Vagrant::configure('2') do |config|
  config.ssh.forward_agent = true
  config.vm.define :kali do |kali|

    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username =  'root'

    kali.vm.provider 'virtualbox' do |v|
      v.box = 'kali-2016.1'
      v.box_url = 'http://box.hackbbs.org/kali-2016.1.box'
      v.box_download_checksum_type = 'sha256'
      v.box_download_checksum = '083f44685ea4fa8910c31e142f448392'\
                                    'e2cf69f140c9893aeee1a1780b0bd20a'
      v.guest = :debian
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kali-rolling']
      v.customize ['modifyvm', :id, '--memory', 2048]
      # v.network :private_network, adapter: 2, type: 'dhcp'
      # v.network :public_network, adapter: 2, type: 'dhcp', bridge: 'eth0'
    end

    kali.vm.provider 'docker' do |d|
      d.build_dir = '.'
      d.build_args = ['-t', 'pentest-env/kali']
      d.dockerfile = 'Dockerfile-kali'
      d.has_ssh = true
    end

    customization.apply :kali, kali

    if File.directory? "#{ENV['PWD']}/chef-repo/roles"
      kali.vm.provision :shell,
                        inline: 'test -d /opt/chef ||'\
                                "(wget #{chef_base_url}/#{chef_deb_file} -O #{chef_deb_file} && "\
                                "dpkg -i #{chef_deb_file} && rm #{chef_deb_file})"
      kali.vm.provision :chef_solo do |chef|
        chef.install = false
        chef.cookbooks_path = 'cookbooks/'
        chef.roles_path = 'chef-repo/roles'

        chef.add_recipe('apt')
        chef.add_role('kali-base')
        customization.apply_chef :kali, chef
      end
    end
  end

  config.vm.define :cyborg do |cyborg|
    cyborg.ssh.private_key_path = 'ssh-keys/pentest-env'
    cyborg.ssh.username =  'root'
    cyborg.vm.guest = :debian

    cyborg.vm.box = 'cyborg-essentials-v1'
    cyborg.vm.box_url = 'http://box.hackbbs.org/cyborg-essentials-v1.box'
    cyborg.vm.box_download_checksum_type = 'sha256'
    cyborg.vm.box_download_checksum = 'd15384c2e10b8ede2893b045399e959f'\
                                      '87fbf5ed8b152c7fd9f6bbc84fa8e33f'

    # cyborg.vm.network :private_network, adapter: 2, type: 'dhcp'
    # cyborg.vm.network :public_network, adapter: 3, type: 'dhcp', bridge: 'wlan0'

    cyborg.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-cyborg']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end

    customization.apply :cyborg, cyborg
  end

  # Running targets customizations
  customization.targets config
end
