# -*- coding: utf-8 -*-

def instance(vconfig)
  vconfig.vm.define 'kali-e17', primary: false do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username = 'root'

    kali.vm.box = 'kali-2016.2-e17'
    kali.vm.box_url = 'http://box.hackbbs.org/kali-2016.2-e17.box'
    kali.vm.box_download_checksum_type = 'sha256'
    kali.vm.box_download_checksum = 'f5c06a16a34982fd107c0fce9ee42f3f'\
                                    'e31d42636a7a551e08f4dc4dd7f275da'

    kali.vm.guest = :debian

    kali.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kali-e17']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end
  end
end
