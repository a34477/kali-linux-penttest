# -*- coding: utf-8 -*-

def instance(vconfig, _custom)
  vconfig.vm.define 'kali-mate', primary: false do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username = 'root'

    kali.vm.box = 'Sliim/kali-2016.2-mate-amd64'
    kali.vm.box_download_checksum_type = 'sha256'
    kali.vm.box_download_checksum = '5f1e06f18714d78dc0310f188bb0a102'\
                                    '83c5d257e3d640c1399fa556fe681355'

    kali.vm.guest = :debian

    kali.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kali-mate']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end
  end
end
