# -*- coding: utf-8 -*-

def instance(vconfig)
  vconfig.vm.define :cyborg do |cyborg|
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
  end
end
