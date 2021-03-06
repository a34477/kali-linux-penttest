# -*- coding: utf-8 -*-

def instance(vconfig, _custom)
  vconfig.vm.define 'kali-light', primary: false do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username = 'root'

    kali.vm.box = 'Sliim/kali-2016.2-light-amd64'
    kali.vm.box_download_checksum_type = 'sha256'
    kali.vm.box_download_checksum = '5d455bf1cf8d7b2b4f3be7c4b3cc4315'\
                                    '2ae5cfe09eaf4aaf30ac112aa6bd3b40'

    kali.vm.guest = :debian

    kali.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kali-light']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end
  end
end
