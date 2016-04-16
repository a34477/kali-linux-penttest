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

def instance(vconfig)
  vconfig.vm.define :kali do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username =  'root'

    kali.vm.box = 'kali-2016.1'
    kali.vm.box_url = 'http://box.hackbbs.org/kali-2016.1.1-netfix.box'
    kali.vm.box_download_checksum_type = 'sha256'
    kali.vm.box_download_checksum = 'c652a76feca465f872c49442d780d332'\
                                    'ec10aba3047950d8a3de95183ec8af6c'

    kali.vm.guest = :debian

    # kali.vm.network :private_network, adapter: 2, type: 'dhcp'
    # kali.vm.network :public_network, adapter: 3, type: 'dhcp', bridge: 'wlan0'

    kali.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kali-rolling']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end
  end
end
