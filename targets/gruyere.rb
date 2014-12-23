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

def target (vconfig)
  vconfig.vm.define :gruyere do | target |
    target.vm.box = 'debian-squeeze-64'
    target.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/debian-607-x64-vbox4210.box'

    target.berkshelf.enabled = true

    target.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--name', 'pentest-env-target-gruyere']
    end

    target.vm.provision :chef_solo do | chef |
      chef.add_recipe('gruyere::apache2_proxy')
    end

    target.vm.network :private_network, ip: '192.168.107.103'
  end
end
