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

def target(vconfig)
  vconfig.vm.define :dvwa do |target|

    target.vm.provider 'virtualbox' do |v|
      v.box = 'opscode-ubuntu-12.04'
      v.box_url = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box'
      v.customize ['modifyvm', :id, '--name', 'pentest-env-dvwa']
    end

    target.vm.provider 'docker' do |d|
      d.image = 'citizenstig/dvwa'
      d.ports = ['8080:80']
      d.name = 'pentest-env-dvwa'
    end

    target.vm.provision :chef_solo do |chef|
      chef.json = {
        'dvwa' => {
          'db' => {
            'use_psql' => false
          }
        }
      }
      chef.add_recipe('dvwa')
    end

    target.vm.network :private_network, type: 'dhcp'
  end
end
