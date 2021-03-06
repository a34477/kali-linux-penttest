# -*- coding: utf-8 -*-

def instance(vconfig, _custom)
  vconfig.vm.define 'kali-xfce', primary: false do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username = 'root'

    kali.vm.box = 'Sliim/kali-2016.2-xfce-amd64'
    kali.vm.box_download_checksum_type = 'sha256'
    kali.vm.box_download_checksum = '4b597aa7ad31179ecad882e800749451'\
                                    '55e0017fb465db6474e553f58728486e'

    kali.vm.guest = :debian

    kali.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kali-xfce']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end
  end
end
