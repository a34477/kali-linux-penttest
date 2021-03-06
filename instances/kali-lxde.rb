# -*- coding: utf-8 -*-

def instance(vconfig, _custom)
  vconfig.vm.define 'kali-lxde', primary: false do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username = 'root'

    kali.vm.box = 'Sliim/kali-2016.2-lxde-amd64'
    kali.vm.box_download_checksum_type = 'sha256'
    kali.vm.box_download_checksum = 'd7d534c329d43b6df9b294eeb558f834'\
                                    '6b20d9334ef037f4c0360ed2acfeaab6'

    kali.vm.guest = :debian

    kali.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kali-lxde']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end
  end
end
