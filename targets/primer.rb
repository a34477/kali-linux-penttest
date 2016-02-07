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
  vconfig.vm.define :primer do |target|
    target.vm.box = 'vulnhub-primer-1.0.1'
    target.vm.box_url = 'http://box.hackbbs.org/vulnhub-primer-1.0.1.box'

    target.vm.synced_folder '.', '/vagrant', disabled: true

    target.ssh.username = 'root'
    target.ssh.private_key_path = 'ssh-keys/pentest-env'

    target.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--name', 'pentest-env-primer']
      v.customize ['modifyvm', :id, '--memory', 256]
    end

    target.vm.network :private_network, type: 'dhcp'
  end
end
