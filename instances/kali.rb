# -*- coding: utf-8 -*-

def instance(vconfig, _custom)
  vconfig.vm.define :kali, primary: true do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username = 'root'

    kali.vm.box = 'Sliim/kali-2016.2-amd64'
    kali.vm.box_download_checksum_type = 'sha256'
    kali.vm.box_download_checksum = '4c04e28c4fb7b6601cb838fba753af4c'\
                                    'ffb3ea2f0a9aa4c13f834cabd7e353cb'

    kali.vm.guest = :debian

    kali.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kali-rolling']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end
  end
end
