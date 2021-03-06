# -*- coding: utf-8 -*-

def instance(vconfig, _custom)
  vconfig.vm.define 'kali-e17', primary: false do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username = 'root'

    kali.vm.box = 'Sliim/kali-2016.2-e17-amd64'
    kali.vm.box_download_checksum_type = 'sha256'
    kali.vm.box_download_checksum = '980c7402bbb8f7c3adafb0544db8430a'\
                                    'ddda4c68918c1756ac031ab333faf66b'

    kali.vm.guest = :debian

    kali.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kali-e17']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end
  end
end
