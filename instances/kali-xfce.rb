# -*- coding: utf-8 -*-

def instance(vconfig)
  vconfig.vm.define 'kali-xfce', primary: false do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username = 'root'

    kali.vm.box = 'kali-2016.2-xfce'
    kali.vm.box_url = 'http://box.hackbbs.org/kali-2016.2-xfce.box'
    kali.vm.box_download_checksum_type = 'sha256'
    kali.vm.box_download_checksum = '5342e85587b64fc0fd58b54a07fd9726'\
                                    '4040ec3027106807b434bd6fbb80b7b6'

    kali.vm.guest = :debian

    kali.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kali-xfce']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end
  end
end
